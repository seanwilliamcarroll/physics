//! [`Voices`]: a fixed pool of strings, played by key
//! (`docs/12-acoustic-foundations.md`, "Voices").

use math::SplitMix64;
use math::convert::{f64_to_usize, usize_to_f64};

use crate::body::Body;
use crate::measure::CENTS_PER_OCTAVE;
use crate::piano::{self, Designs};
use crate::unison::Unison;
use crate::{Excitation, KsString, Scalar, Voicing, Waveguide};

/// How many notes sound at once; one more steals the oldest. 16 since
/// A1.9: The Entertainer has three-note chords in both hands and needs 11
/// at its busiest (counting releases), and stealing a still-ringing voice
/// restarts its delay line mid-note. A voice is one preallocated line
/// (~7 KB at 48 kHz), and only sounding ones cost time.
pub const VOICES: usize = 16;

/// The lowest note a voice is sized for, Hz: A0, the piano's bottom key.
pub const LOWEST_HZ: f64 = 27.5;

/// Output gain by default: ¼ keeps a seven-note chord of noise-plucked
/// strings off the ±1 clamp (peak 0.824, `tests/determinism.rs`).
pub const DEFAULT_GAIN: f64 = 0.25;

/// Note off: the fundamental falls 60 dB in about this long, s, instead
/// of stopping dead (a click).
pub const RELEASE_T60: f64 = 0.1;

/// The piano's output per newton of bridge force (the strings' summed
/// force, through the body): **our choice**, so a loud chord stays off the
/// clamp at the default gain (`tests/determinism.rs` measures it).
pub const PIANO_SCALE: f64 = 0.014;

/// The piano's body runs over blocks of at most this many samples
/// (preallocated, so `render` of any length never allocates).
const PIANO_BLOCK: usize = 256;

/// How long the latest strike's hammer force is recorded, s: past the
/// longest contact (about 8 ms, A0 at pp), for the page to draw.
pub const TRACE_SECONDS: f64 = 0.012;

/// A released voice is free once it's had this many `RELEASE_T60`s (80 dB
/// down: below audibility).
const RELEASE_FREE_FACTOR: f64 = 80.0 / 60.0;

/// Which string model plays a note (`docs/13-waveguide.md`, "One synth,
/// two models").
#[derive(Copy, Clone, Debug, PartialEq, Eq, Default)]
pub enum Model {
    /// A1's Karplus–Strong loop.
    #[default]
    Loop,
    /// A2's waveguide: two traveling waves, a pluck and a pickup position.
    Waveguide,
    /// A3's piano (`docs/14-piano.md`): stiff strings, 1–3 a key, struck
    /// by fitted hammers, through a body.
    Piano,
}

/// One string and what it's playing. Both models are allocated up front,
/// so a note can use either without allocating; `model` says which one
/// this note plays.
#[derive(Clone, Debug)]
struct Voice<S> {
    string: KsString<S>,
    guide: Waveguide<S>,
    piano: Unison<S>,
    model: Model,
    /// MIDI key, while sounding.
    key: Option<u8>,
    /// The pitch asked for, Hz (the string's own pitch differs from it
    /// when the loop is untuned).
    target: f64,
    /// Note-on order: the smallest is the oldest, stolen first.
    started: u64,
    /// Samples left before a released voice is free.
    releasing: Option<usize>,
}

/// A pool of [`VOICES`] strings at one sample rate, summed into one
/// output. Every string is allocated at construction, sized for
/// [`LOWEST_HZ`], so playing notes never allocates (the audio thread's
/// rule). Noise comes from one seeded generator, so a sequence of notes is
/// reproducible.
#[derive(Clone, Debug)]
pub struct Voices<S> {
    pool: Vec<Voice<S>>,
    fs: f64,
    gain: S,
    rng: SplitMix64,
    notes: u64,
    /// Output samples clamped to ±1 so far.
    clipped: u64,
    /// The voice last played: what the page draws.
    latest: Option<usize>,
    /// The model new notes play.
    model: Model,
    /// Every waveguide's pickup, from the bridge.
    pickup: f64,
    /// Every key's dispersion design: built when the piano is first
    /// chosen (milliseconds a key), then looked up at every note on.
    designs: Option<Designs>,
    /// Whether the piano's strings are stiff (the page's toggle).
    stiff: bool,
    /// The piano's body, on its voices' summed bridge force, and the block
    /// that sum gathers in.
    body: Body<S>,
    piano_block: Vec<S>,
    piano_scale: S,
    /// The latest strike's middle-string hammer force, N, one per sample
    /// from impact (allocated once, [`TRACE_SECONDS`] long), and its voice.
    trace: Vec<f64>,
    traced: Option<usize>,
}

impl<S: Scalar> Voices<S> {
    /// A silent pool at `fs` Hz with noise seeded by `seed`. `None` if `fs`
    /// can't play [`LOWEST_HZ`] (not positive and finite).
    #[must_use]
    pub fn new(fs: f64, seed: u64) -> Option<Self> {
        let probe = Voicing {
            tuned: true,
            decay: crate::Decay::Loss(1.0),
            inharmonicity: 0.0,
        };
        let cap = f64_to_usize(libm::ceil(fs / LOWEST_HZ)).unwrap_or(0);
        let string = KsString::with_capacity(fs, LOWEST_HZ, probe, cap)?;
        let guide = Waveguide::with_capacity(fs, LOWEST_HZ, probe, cap)?;
        let piano = Unison::with_capacity(fs)?;
        let voice = Voice {
            string,
            guide,
            piano,
            model: Model::Loop,
            key: None,
            target: LOWEST_HZ,
            started: 0,
            releasing: None,
        };
        Some(Self {
            pool: vec![voice; VOICES],
            fs,
            gain: S::from_f64(DEFAULT_GAIN),
            rng: SplitMix64::new(seed),
            notes: 0,
            clipped: 0,
            latest: None,
            model: Model::Loop,
            pickup: crate::DEFAULT_PICKUP,
            designs: None,
            stiff: true,
            body: Body::new(fs)?,
            piano_block: vec![S::ZERO; PIANO_BLOCK],
            piano_scale: S::from_f64(PIANO_SCALE),
            trace: Vec::with_capacity(f64_to_usize(libm::ceil(TRACE_SECONDS * fs)).unwrap_or(0)),
            traced: None,
        })
    }

    /// The model new notes play (ringing notes keep theirs). The first
    /// switch to [`Model::Piano`] designs every key's dispersion (about
    /// 200 ms natively): a one-time pause, before the piano plays.
    pub fn set_model(&mut self, model: Model) {
        if model == Model::Piano {
            self.prepare_piano();
        }
        self.model = model;
    }

    /// The slot a new note on `key` takes: the voice already playing it,
    /// else a free one, else the oldest.
    fn slot(&self, key: u8) -> Option<usize> {
        self.pool
            .iter()
            .position(|v| v.key == Some(key))
            .or_else(|| self.pool.iter().position(|v| v.key.is_none()))
            .or_else(|| {
                self.pool
                    .iter()
                    .enumerate()
                    .min_by_key(|(_, v)| v.started)
                    .map(|(i, _)| i)
            })
    }

    /// Marks voice `i` as playing `key` at `f0` Hz, the newest note.
    fn started(&mut self, i: usize, key: u8, f0: f64, model: Model) {
        self.notes += 1;
        let notes = self.notes;
        if let Some(v) = self.pool.get_mut(i) {
            v.model = model;
            v.key = Some(key);
            v.target = f0;
            v.started = notes;
            v.releasing = None;
        }
        self.latest = Some(i);
    }

    /// Moves every waveguide's pickup to `s` (from the bridge, 0 to 1),
    /// live: a ringing note's timbre changes as it moves.
    pub fn set_pickup(&mut self, s: f64) {
        self.pickup = s.clamp(0.0, 1.0);
        for v in &mut self.pool {
            v.guide.set_pickup(self.pickup);
        }
    }

    /// Starts MIDI `key` (equal temperament, A4 = 440 Hz) with `voicing`
    /// and `excitation`: on the voice already playing that key, else a free
    /// one, else the oldest. `false`, playing nothing, for a key the
    /// voicing can't play here (below [`LOWEST_HZ`], or too high).
    pub fn note_on(&mut self, key: u8, voicing: Voicing, excitation: Excitation) -> bool {
        if self.model == Model::Piano {
            return self.strike(key, crate::hammer::mezzo_forte());
        }
        let f0 = piano::frequency(key);
        let Some(i) = self.slot(key) else {
            return false;
        };
        let (fs, model, pickup) = (self.fs, self.model, self.pickup);
        let Some(v) = self.pool.get_mut(i) else {
            return false;
        };
        let ok = match model {
            Model::Loop => v.string.restring(fs, f0, voicing),
            Model::Waveguide | Model::Piano => v.guide.restring(fs, f0, voicing),
        };
        if !ok {
            return false;
        }
        match model {
            Model::Loop => excitation.excite(&mut v.string, &mut self.rng),
            Model::Waveguide | Model::Piano => {
                v.guide.set_pickup(pickup);
                excitation.excite_waveguide(&mut v.guide, &mut self.rng);
            }
        }
        self.started(i, key, f0, model);
        true
    }

    /// Releases MIDI `key`: it fades over about [`RELEASE_T60`] and its
    /// voice frees. Nothing if it isn't sounding (or is already released).
    pub fn note_off(&mut self, key: u8) {
        let fs = self.fs;
        for v in &mut self.pool {
            if v.key == Some(key) && v.releasing.is_none() {
                match v.model {
                    Model::Loop => v.string.damp(RELEASE_T60),
                    Model::Waveguide => v.guide.damp(RELEASE_T60),
                    Model::Piano => v.piano.damp(RELEASE_T60),
                }
                let samples = f64_to_usize(fs * RELEASE_T60 * RELEASE_FREE_FACTOR).unwrap_or(0);
                v.releasing = Some(samples);
            }
        }
    }

    /// Fills `out` with the sum of every sounding voice times the gain,
    /// clamped to ±1 (counted in [`clipped`](Self::clipped)).
    pub fn render(&mut self, out: &mut [S]) {
        out.fill(S::ZERO);
        for v in &mut self.pool {
            if v.key.is_none() {
                continue;
            }
            match v.model {
                Model::Loop => {
                    for s in out.iter_mut() {
                        *s += v.string.next_sample();
                    }
                }
                Model::Waveguide => {
                    for s in out.iter_mut() {
                        *s += v.guide.next_sample();
                    }
                }
                // Below, through the body.
                Model::Piano => {}
            }
        }
        self.render_piano(out);
        for v in &mut self.pool {
            if v.key.is_none() {
                continue;
            }
            if let Some(left) = v.releasing.as_mut() {
                *left = left.saturating_sub(out.len());
                if *left == 0 {
                    v.key = None;
                    v.releasing = None;
                }
            }
        }
        for s in out {
            let y = *s * self.gain;
            *s = if y > S::ONE {
                self.clipped += 1;
                S::ONE
            } else if y < -S::ONE {
                self.clipped += 1;
                -S::ONE
            } else {
                y
            };
        }
    }

    /// Sets the output gain (applied before the clamp).
    pub fn set_gain(&mut self, gain: S) {
        self.gain = gain;
    }

    /// Output samples clamped to ±1 so far.
    #[must_use]
    pub const fn clipped(&self) -> u64 {
        self.clipped
    }

    /// How many voices are sounding (including releases).
    #[must_use]
    pub fn sounding(&self) -> usize {
        self.pool.iter().filter(|v| v.key.is_some()).count()
    }

    /// The keys sounding, by voice (`None` for a free voice).
    pub fn keys(&self) -> impl Iterator<Item = Option<u8>> + '_ {
        self.pool.iter().map(|v| v.key)
    }

    /// How far the last note's loop is from the pitch asked for, cents
    /// (`1200 log₂(played / asked)`): 0 tuned, up to ~75 untuned (the
    /// page's readout for the tuning toggle); a piano note's strings'
    /// mean. `None` before any note.
    #[must_use]
    pub fn latest_detune(&self) -> Option<f64> {
        let v = self.latest.and_then(|i| self.pool.get(i))?;
        let pitch = match v.model {
            Model::Loop => v.string.pitch(),
            Model::Waveguide => v.guide.pitch(),
            // The strings' mean, in cents: a pair sits at ±½ cent, so no
            // one string is the note.
            Model::Piano => {
                let n = usize_to_f64(v.piano.len());
                let mean = v
                    .piano
                    .pitches()
                    .map(|p| libm::log2(p / v.target))
                    .sum::<f64>()
                    / n;
                return Some(CENTS_PER_OCTAVE * mean);
            }
        };
        Some(CENTS_PER_OCTAVE * libm::log2(pitch / v.target))
    }

    /// Appends what the page draws of the last note to `out`: the loop's
    /// delay line (A1), or the waveguide's shape, cell by cell from the
    /// bridge (A2). Nothing before any note. `out` should have room for
    /// the longest (it doesn't allocate then).
    pub fn latest_shape(&self, out: &mut Vec<S>) {
        let Some(v) = self.latest.and_then(|i| self.pool.get(i)) else {
            return;
        };
        match v.model {
            Model::Loop => out.extend(v.string.samples()),
            Model::Waveguide => out.extend(v.guide.shape()),
            Model::Piano => {
                if let Some(s) = v.piano.middle() {
                    out.extend(s.shape());
                }
            }
        }
    }
}

mod strike;
#[cfg(test)]
mod tests;
