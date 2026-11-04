//! [`Voices`]: a fixed pool of strings, played by key
//! (`docs/12-acoustic-foundations.md`, "Voices").

use math::SplitMix64;

use crate::{Excitation, KsString, Scalar, Voicing};

/// How many notes sound at once; the ninth steals the oldest.
pub const VOICES: usize = 8;

/// The lowest note a voice is sized for, Hz: A0, the piano's bottom key.
pub const LOWEST_HZ: f64 = 27.5;

/// Output gain by default: with up to 8 noise-plucked strings at ±1, ¼
/// keeps a chord off the ±1 clamp.
pub const DEFAULT_GAIN: f64 = 0.25;

/// Note off: the fundamental falls 60 dB in about this long, s, instead
/// of stopping dead (a click).
pub const RELEASE_T60: f64 = 0.1;

/// A released voice is free once it's had this many `RELEASE_T60`s (80 dB
/// down: below audibility).
const RELEASE_FREE_FACTOR: f64 = 80.0 / 60.0;

/// One string and what it's playing.
#[derive(Clone, Debug)]
struct Voice<S> {
    string: KsString<S>,
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
}

impl<S: Scalar> Voices<S> {
    /// A silent pool at `fs` Hz with noise seeded by `seed`. `None` if `fs`
    /// can't play [`LOWEST_HZ`] (not positive and finite).
    #[must_use]
    pub fn new(fs: f64, seed: u64) -> Option<Self> {
        let probe = Voicing {
            tuned: true,
            decay: crate::Decay::Loss(1.0),
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
        let voice = Voice {
            string,
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
        })
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
        if !v.string.restring(self.fs, f0, voicing) {
            return false;
        }
        excitation.excite(&mut v.string, &mut self.rng);
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
                v.string.damp(RELEASE_T60);
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
            for s in out.iter_mut() {
                *s += v.string.next_sample();
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
        Some(1200.0 * libm::log2(v.string.pitch() / v.target))
    }

    /// The string last played (what the page draws), if any.
    #[must_use]
    pub fn latest(&self) -> Option<&KsString<S>> {
        self.latest
            .and_then(|i| self.pool.get(i))
            .map(|v| &v.string)
    }
}

#[cfg(test)]
mod tests;
