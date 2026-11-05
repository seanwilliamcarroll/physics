//! [`Unison`]: one key's strings (`docs/14-piano.md`, "String groups"):
//! 1, 2 or 3 stiff strings tuned a little apart, each struck by its own
//! copy of the key's hammer, uncoupled, their forces on the bridge summed.
//!
//! **A hammer per string.** At impact the strings are identical, and a
//! cent of detuning barely changes them during a 1–4 ms contact, so `N`
//! hammers of mass `M` on `N` strings behave like one of `N M` on all of
//! them: the fitted hammer (section 3) is a hammer *per string*, and the
//! contact times stay the tested ones.

use crate::hammer::{self, Hammer, STRIKE};
use crate::{Scalar, Voicing, Waveguide};

/// The most strings a key has.
pub const MAX_STRINGS: usize = 3;

/// The highest key with one string (E1) and with two (G♯2), MIDI: **our
/// choice**, near where pianos change from one wound string to two, and
/// from two to three.
const LAST_SINGLE: u8 = 28;
const LAST_PAIR: u8 = 44;

/// How far apart neighboring strings are tuned, cents (**our choice**, "a
/// couple of cents" across a group), spread symmetrically about the note.
pub const DETUNE_CENTS: f64 = 1.0;

/// How many strings `midi` has.
#[must_use]
pub const fn strings(midi: u8) -> usize {
    if midi <= LAST_SINGLE {
        1
    } else if midi <= LAST_PAIR {
        2
    } else {
        3
    }
}

/// String `i`'s tuning of `n`, cents from the note: symmetric, so the
/// group's mean is the note (−½, ½ for two; −1, 0, 1 for three).
#[must_use]
pub fn offset(i: usize, n: usize) -> f64 {
    #[expect(clippy::cast_precision_loss, reason = "at most 3 strings")]
    let (i, n) = (i as f64, n as f64);
    (i - (n - 1.0) / 2.0) * DETUNE_CENTS
}

/// One key's strings, struck.
#[derive(Clone, Debug)]
pub struct Unison<S> {
    strings: Vec<Waveguide<S>>,
    /// Each string's last bridge output (its force needs the change).
    previous: [S; MAX_STRINGS],
    /// `2 Z fs`: an arriving wave's displacement change per sample to the
    /// force on the bridge, N per m.
    force_scale: S,
    z: f64,
    fs: f64,
}

impl<S: Scalar> Unison<S> {
    /// Key `midi`'s strings at `fs` Hz, voiced by `voicing` (its pitch is
    /// the key's, equal-tempered; each string detuned by [`offset`]),
    /// struck at `velocity` m/s. `None` off the keyboard or for settings
    /// the strings or hammer can't take.
    #[must_use]
    pub fn new(fs: f64, midi: u8, voicing: Voicing, velocity: f64) -> Option<Self> {
        let felt = hammer::felt(midi)?;
        let z = hammer::impedance(midi);
        let f0 = 440.0 * libm::pow(2.0, (f64::from(midi) - 69.0) / 12.0);
        let n = strings(midi);
        let strings = (0..n)
            .map(|i| {
                let mut s =
                    Waveguide::new(fs, f0 * libm::pow(2.0, offset(i, n) / 1200.0), voicing)?;
                s.strike(Hammer::new(felt, z, fs, velocity)?, 1.0 - STRIKE)
                    .then_some(s)
            })
            .collect::<Option<Vec<_>>>()?;
        Some(Self {
            strings,
            previous: [S::ZERO; MAX_STRINGS],
            force_scale: S::from_f64(2.0 * z * fs),
            z,
            fs,
        })
    }

    /// How many strings sound.
    #[must_use]
    pub fn len(&self) -> usize {
        self.strings.len()
    }

    /// Never: a key has at least one string.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.strings.is_empty()
    }

    /// Each string's pitch, Hz.
    pub fn pitches(&self) -> impl Iterator<Item = f64> + '_ {
        self.strings.iter().map(Waveguide::pitch)
    }

    /// The hammers, one per string.
    pub fn hammers(&self) -> impl Iterator<Item = &Hammer> + '_ {
        self.strings.iter().filter_map(Waveguide::hammer)
    }

    /// The strings' energy, J (see [`Waveguide::energy`]).
    #[must_use]
    pub fn energy(&self) -> f64 {
        self.strings.iter().map(|s| s.energy(self.z, self.fs)).sum()
    }

    /// The next sample: the strings' summed force on the bridge, N.
    pub fn next_sample(&mut self) -> S {
        let mut sum = S::ZERO;
        for (s, previous) in self.strings.iter_mut().zip(self.previous.iter_mut()) {
            let y = s.step();
            sum += self.force_scale * (y - *previous);
            *previous = y;
        }
        sum
    }

    /// Fills `out` with the next samples.
    pub fn render(&mut self, out: &mut [S]) {
        for x in out {
            *x = self.next_sample();
        }
    }
}

#[cfg(test)]
mod tests;
