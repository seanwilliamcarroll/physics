//! [`Voices`]: a fixed pool of strings, played by key
//! (`docs/12-acoustic-foundations.md`, "Voices").

use math::SplitMix64;
use math::convert::{f64_to_usize, usize_to_f64};

use crate::body::Body;
use crate::measure::CENTS_PER_OCTAVE;
use crate::piano::{self, Designs};
use crate::unison::Unison;
use crate::{Excitation, KsString, Scalar, Voicing, Waveguide};

/// How many notes sound at once; one more steals the oldest. The Entertainer
/// needs 11 at its busiest (counting releases); a voice is ~7 KB at 48 kHz.
pub const VOICES: usize = 16;

/// The lowest note a voice is sized for, Hz: A0, the piano's bottom key.
pub const LOWEST_HZ: f64 = 27.5;

/// Output gain by default: ¼ keeps a seven-note chord of noise-plucked
/// strings off the ±1 clamp (peak 0.824, `tests/determinism.rs`).
pub const DEFAULT_GAIN: f64 = 0.25;

/// Note off: the fundamental falls 60 dB in about this long, s, instead
/// of stopping dead (a click).
pub const RELEASE_DECAY_TIME_60DB: f64 = 0.1;

/// How long the release's damper takes to come in, s (ours): applied in one
/// sample it clicked on the piano (a step about 8× the note's own).
pub const RELEASE_RAMP: f64 = 0.01;

/// The piano's output per newton of bridge force (the strings' summed
/// force, through the body): **our choice**, so a loud chord stays off the
/// clamp at the default gain (`tests/determinism.rs` measures it).
pub(crate) const PIANO_SCALE: f64 = 0.014;

const PIANO_BLOCK: usize = 256;

/// How long the latest strike's hammer force is recorded, s: past the
/// longest contact (about 8 ms, A0 at pp), for the page to draw.
pub const TRACE_SECONDS: f64 = 0.012;

/// A released voice is free once it's had this many `RELEASE_DECAY_TIME_60DB`s (80 dB
/// down: below audibility).
const RELEASE_FREE_FACTOR: f64 = 80.0 / 60.0;

/// Which string model plays a note (`docs/13-waveguide.md`, "One synth,
/// two models").
#[derive(Copy, Clone, Debug, PartialEq, Eq, Default)]
pub enum Model {
    #[default]
    Loop,
    Waveguide,
    Piano,
}

/// One voice: all three models are allocated up front; `model` is the one
/// this note plays.
#[derive(Clone, Debug)]
struct Voice<S> {
    string: KsString<S>,
    guide: Waveguide<S>,
    piano: Unison<S>,
    model: Model,
    key: Option<u8>,
    /// The pitch asked for, Hz (the string's own pitch differs from it
    /// when the loop is untuned).
    target: f64,
    /// Note-on order: the smallest is the oldest, stolen first.
    started: u64,
    releasing: Option<usize>,
}

/// A pool of [`VOICES`] strings summed into one output. Everything is
/// allocated at construction, so playing never allocates; noise comes from
/// one seeded generator, so a sequence of notes is reproducible.
#[derive(Clone, Debug)]
pub struct Voices<S> {
    pool: Vec<Voice<S>>,
    sample_rate: f64,
    gain: S,
    rng: SplitMix64,
    notes: u64,
    clipped: u64,
    latest: Option<usize>,
    model: Model,
    pickup: f64,
    designs: Option<Designs>,
    stiff: bool,
    body: Body<S>,
    piano_block: Vec<S>,
    piano_scale: S,
    trace: Vec<f64>,
    traced: Option<usize>,
}

impl<S: Scalar> Voices<S> {
    #[must_use]
    pub fn new(sample_rate: f64, seed: u64) -> Option<Self> {
        let probe = Voicing {
            tuned: true,
            decay: crate::Decay::Loss(1.0),
            inharmonicity: 0.0,
        };
        let capacity = f64_to_usize(libm::ceil(sample_rate / LOWEST_HZ)).unwrap_or(0);
        let string = KsString::with_capacity(sample_rate, LOWEST_HZ, probe, capacity)?;
        let guide = Waveguide::with_capacity(sample_rate, LOWEST_HZ, probe, capacity)?;
        let piano = Unison::with_capacity(sample_rate)?;
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
            sample_rate,
            gain: S::from_f64(DEFAULT_GAIN),
            rng: SplitMix64::new(seed),
            notes: 0,
            clipped: 0,
            latest: None,
            model: Model::Loop,
            pickup: crate::DEFAULT_PICKUP,
            designs: None,
            stiff: true,
            body: Body::new(sample_rate)?,
            piano_block: vec![S::ZERO; PIANO_BLOCK],
            piano_scale: S::from_f64(PIANO_SCALE),
            trace: Vec::with_capacity(
                f64_to_usize(libm::ceil(TRACE_SECONDS * sample_rate)).unwrap_or(0),
            ),
            traced: None,
        })
    }

    /// The model new notes play (ringing notes keep theirs). The first switch
    /// to [`Model::Piano`] designs every key's dispersion (~200 ms natively).
    pub fn set_model(&mut self, model: Model) {
        if model == Model::Piano {
            self.prepare_piano();
        }
        self.model = model;
    }

    fn slot(&self, key: u8) -> Option<usize> {
        self.pool
            .iter()
            .position(|voice| voice.key == Some(key))
            .or_else(|| self.pool.iter().position(|voice| voice.key.is_none()))
            .or_else(|| {
                self.pool
                    .iter()
                    .enumerate()
                    .min_by_key(|(_, voice)| voice.started)
                    .map(|(index, _)| index)
            })
    }

    fn started(&mut self, slot: usize, key: u8, fundamental_hz: f64, model: Model) {
        self.notes += 1;
        let notes = self.notes;
        if let Some(voice) = self.pool.get_mut(slot) {
            voice.model = model;
            voice.key = Some(key);
            voice.target = fundamental_hz;
            voice.started = notes;
            voice.releasing = None;
        }
        self.latest = Some(slot);
    }

    pub fn set_pickup(&mut self, position: f64) {
        self.pickup = position.clamp(0.0, 1.0);
        for voice in &mut self.pool {
            voice.guide.set_pickup(self.pickup);
        }
    }

    /// Starts MIDI `key` on the voice already playing it, else a free one,
    /// else the oldest. `false`, playing nothing, for a key the voicing can't
    /// play (below [`LOWEST_HZ`], or too high).
    pub fn note_on(&mut self, key: u8, voicing: Voicing, excitation: Excitation) -> bool {
        if self.model == Model::Piano {
            return self.strike(key, crate::hammer::mezzo_forte());
        }
        let fundamental_hz = piano::frequency(key);
        let Some(slot) = self.slot(key) else {
            return false;
        };
        let (sample_rate, model, pickup) = (self.sample_rate, self.model, self.pickup);
        let Some(voice) = self.pool.get_mut(slot) else {
            return false;
        };
        let restrung = match model {
            Model::Loop => voice.string.restring(sample_rate, fundamental_hz, voicing),
            Model::Waveguide | Model::Piano => {
                voice.guide.restring(sample_rate, fundamental_hz, voicing)
            }
        };
        if !restrung {
            return false;
        }
        match model {
            Model::Loop => excitation.excite(&mut voice.string, &mut self.rng),
            Model::Waveguide | Model::Piano => {
                voice.guide.set_pickup(pickup);
                excitation.excite_waveguide(&mut voice.guide, &mut self.rng);
            }
        }
        self.started(slot, key, fundamental_hz, model);
        true
    }

    pub fn note_off(&mut self, key: u8) {
        let sample_rate = self.sample_rate;
        // At least one sample, whatever the rate.
        let ramp = f64_to_usize(sample_rate * RELEASE_RAMP)
            .and_then(core::num::NonZeroUsize::new)
            .unwrap_or(core::num::NonZeroUsize::MIN);
        for voice in &mut self.pool {
            if voice.key == Some(key) && voice.releasing.is_none() {
                match voice.model {
                    Model::Loop => voice.string.damp(RELEASE_DECAY_TIME_60DB, ramp),
                    Model::Waveguide => voice.guide.damp(RELEASE_DECAY_TIME_60DB, ramp),
                    Model::Piano => voice.piano.damp(RELEASE_DECAY_TIME_60DB, ramp),
                }
                let samples =
                    f64_to_usize(sample_rate * RELEASE_DECAY_TIME_60DB * RELEASE_FREE_FACTOR)
                        .unwrap_or(0);
                voice.releasing = Some(samples);
            }
        }
    }

    /// Fills `out` with the sum of every sounding voice times the gain,
    /// clamped to ±1 (counted in [`clipped`](Self::clipped)).
    pub fn render(&mut self, out: &mut [S]) {
        out.fill(S::ZERO);
        for voice in &mut self.pool {
            if voice.key.is_none() {
                continue;
            }
            match voice.model {
                Model::Loop => {
                    for sample in out.iter_mut() {
                        *sample += voice.string.next_sample();
                    }
                }
                Model::Waveguide => {
                    for sample in out.iter_mut() {
                        *sample += voice.guide.next_sample();
                    }
                }
                Model::Piano => {}
            }
        }
        self.render_piano(out);
        for voice in &mut self.pool {
            if voice.key.is_none() {
                continue;
            }
            if let Some(samples_left) = voice.releasing.as_mut() {
                *samples_left = samples_left.saturating_sub(out.len());
                if *samples_left == 0 {
                    voice.key = None;
                    voice.releasing = None;
                }
            }
        }
        for sample in out {
            let amplified = *sample * self.gain;
            *sample = if amplified > S::ONE {
                self.clipped += 1;
                S::ONE
            } else if amplified < -S::ONE {
                self.clipped += 1;
                -S::ONE
            } else {
                amplified
            };
        }
    }

    pub fn set_gain(&mut self, gain: S) {
        self.gain = gain;
    }

    #[must_use]
    pub const fn clipped(&self) -> u64 {
        self.clipped
    }

    #[must_use]
    pub fn sounding(&self) -> usize {
        self.pool.iter().filter(|voice| voice.key.is_some()).count()
    }

    pub fn keys(&self) -> impl Iterator<Item = Option<u8>> + '_ {
        self.pool.iter().map(|voice| voice.key)
    }

    /// How far the last note's loop is from the pitch asked for, cents
    /// (`1200 log₂(played / asked)`): 0 tuned, up to ~75 untuned (the
    /// page's readout for the tuning toggle); a piano note's strings'
    /// mean. `None` before any note.
    #[must_use]
    pub fn latest_detune(&self) -> Option<f64> {
        let voice = self.latest.and_then(|slot| self.pool.get(slot))?;
        let pitch = match voice.model {
            Model::Loop => voice.string.pitch(),
            Model::Waveguide => voice.guide.pitch(),
            // The strings' mean, in cents: a pair sits at ±½ cent, so no
            // one string is the note.
            Model::Piano => {
                let string_count = usize_to_f64(voice.piano.len());
                let mean = voice
                    .piano
                    .pitches()
                    .map(|string_pitch| libm::log2(string_pitch / voice.target))
                    .sum::<f64>()
                    / string_count;
                return Some(CENTS_PER_OCTAVE * mean);
            }
        };
        Some(CENTS_PER_OCTAVE * libm::log2(pitch / voice.target))
    }

    /// Appends the last note's loop or waveguide shape to `out` (reserve the
    /// longest to avoid allocating). Nothing before any note.
    pub fn latest_shape(&self, out: &mut Vec<S>) {
        let Some(voice) = self.latest.and_then(|slot| self.pool.get(slot)) else {
            return;
        };
        match voice.model {
            Model::Loop => out.extend(voice.string.samples()),
            Model::Waveguide => out.extend(voice.guide.shape()),
            Model::Piano => {
                if let Some(string) = voice.piano.middle() {
                    out.extend(string.shape());
                }
            }
        }
    }
}

mod strike;
#[cfg(test)]
mod tests;
