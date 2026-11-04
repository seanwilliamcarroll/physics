//! [`Voices`]: a fixed pool of strings, played by key
//! (`docs/12-acoustic-foundations.md`, "Voices").

use math::SplitMix64;

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
}

/// One string and what it's playing. Both models are allocated up front,
/// so a note can use either without allocating; `model` says which one
/// this note plays.
#[derive(Clone, Debug)]
struct Voice<S> {
    string: KsString<S>,
    guide: Waveguide<S>,
    model: Model,
    /// MIDI key, while sounding.
    key: Option<u8>,
    /// The pitch asked for, Hz (the string's own pitch differs from it
    /// when the loop is untuned).
    target: f64,
    /// Note-on order: the smallest is the oldest, stolen first.
    started: u64,
    /// Samples left before a released voice is free.
    releasing: Option<u64>,
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
        let cap = libm::ceil(fs / LOWEST_HZ);
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "checked positive and finite by the probe string below"
        )]
        let cap = if cap.is_finite() && cap > 0.0 {
            cap as usize
        } else {
            0
        };
        let string = KsString::with_capacity(fs, LOWEST_HZ, probe, cap)?;
        let guide = Waveguide::with_capacity(fs, LOWEST_HZ, probe, cap)?;
        let voice = Voice {
            string,
            guide,
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
        })
    }

    /// The model new notes play (ringing notes keep theirs).
    pub const fn set_model(&mut self, model: Model) {
        self.model = model;
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
        let f0 = 440.0 * libm::exp2((f64::from(key) - 69.0) / 12.0);
        let slot = self
            .pool
            .iter()
            .position(|v| v.key == Some(key))
            .or_else(|| self.pool.iter().position(|v| v.key.is_none()))
            .or_else(|| {
                self.pool
                    .iter()
                    .enumerate()
                    .min_by_key(|(_, v)| v.started)
                    .map(|(i, _)| i)
            });
        let Some(v) = slot.and_then(|i| self.pool.get_mut(i)) else {
            return false;
        };
        let ok = match self.model {
            Model::Loop => v.string.restring(self.fs, f0, voicing),
            Model::Waveguide => v.guide.restring(self.fs, f0, voicing),
        };
        if !ok {
            return false;
        }
        match self.model {
            Model::Loop => excitation.excite(&mut v.string, &mut self.rng),
            Model::Waveguide => {
                v.guide.set_pickup(self.pickup);
                excitation.excite_waveguide(&mut v.guide, &mut self.rng);
            }
        }
        v.model = self.model;
        self.notes += 1;
        v.key = Some(key);
        v.target = f0;
        v.started = self.notes;
        v.releasing = None;
        self.latest = slot;
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
                }
                #[expect(
                    clippy::cast_possible_truncation,
                    clippy::cast_sign_loss,
                    reason = "a positive, small sample count"
                )]
                let samples = (fs * RELEASE_T60 * RELEASE_FREE_FACTOR) as u64;
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
            }
            if let Some(left) = v.releasing.as_mut() {
                *left = left.saturating_sub(out.len() as u64);
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
    /// page's readout for the tuning toggle). `None` before any note.
    #[must_use]
    pub fn latest_detune(&self) -> Option<f64> {
        let v = self.latest.and_then(|i| self.pool.get(i))?;
        let pitch = match v.model {
            Model::Loop => v.string.pitch(),
            Model::Waveguide => v.guide.pitch(),
        };
        Some(1200.0 * libm::log2(pitch / v.target))
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
        }
    }
}

#[cfg(test)]
mod tests;
