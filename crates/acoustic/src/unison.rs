//! [`Unison`]: one key's strings (`docs/14-piano.md`, "String groups"):
//! 1, 2 or 3 stiff strings tuned a little apart, each struck by its own
//! copy of the key's hammer, uncoupled, their forces on the bridge summed.
//!
//! **A hammer per string.** At impact the strings are identical, and a
//! cent of detuning barely changes them during a 1–4 ms contact, so `N`
//! hammers of mass `M` on `N` strings behave like one of `N M` on all of
//! them: the fitted hammer is a hammer *per string*, and the contact times
//! stay the tested ones.

use crate::dispersion::Dispersion;
use crate::hammer::{self, Hammer, STRIKE};
use crate::measure::CENTS_PER_OCTAVE;
use crate::{Decay, LOWEST_HZ, Scalar, Voicing, Waveguide};
use math::convert::{f64_to_usize, usize_to_f64};

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

/// String `index`'s tuning of `count`, cents from the note: symmetric, so
/// the group's mean is the note (−½, ½ for two; −1, 0, 1 for three).
#[must_use]
pub fn offset(index: usize, count: usize) -> f64 {
    let (index, count) = (usize_to_f64(index), usize_to_f64(count));
    (index - (count - 1.0) / 2.0) * DETUNE_CENTS
}

/// One key's strings, struck. [`MAX_STRINGS`] strings are allocated up
/// front, sized for [`LOWEST_HZ`], so re-striking for any key never
/// allocates; `active` of them sound.
#[derive(Clone, Debug)]
pub struct Unison<S> {
    strings: Vec<Waveguide<S>>,
    active: usize,
    /// Each string's last bridge output (its force needs the change).
    previous: [S; MAX_STRINGS],
    /// `2 Z fs`: an arriving wave's displacement change per sample to the
    /// force on the bridge, N per m.
    force_scale: S,
    string_impedance: f64,
    sample_rate: f64,
}

impl<S: Scalar> Unison<S> {
    /// Silent strings at `sample_rate` Hz with room for any key (A0's
    /// loop); `None` for a rate that can't play A0.
    #[must_use]
    pub fn with_capacity(sample_rate: f64) -> Option<Self> {
        let probe = Voicing {
            tuned: true,
            decay: Decay::Loss(1.0),
            inharmonicity: 0.0,
        };
        let capacity = f64_to_usize(libm::ceil(sample_rate / LOWEST_HZ)).unwrap_or(0);
        let string = Waveguide::with_capacity(sample_rate, LOWEST_HZ, probe, capacity)?;
        Some(Self {
            strings: vec![string; MAX_STRINGS],
            active: 0,
            previous: [S::ZERO; MAX_STRINGS],
            force_scale: S::ZERO,
            // Until struck: `restrike` sets the key's.
            string_impedance: 1.0,
            sample_rate,
        })
    }

    /// Key `midi`'s strings at `sample_rate` Hz, voiced by `voicing` (its
    /// pitch is the key's, equal-tempered; each string detuned by
    /// [`offset`]), struck at `velocity` m/s; the dispersion designed here
    /// (milliseconds: voices use a stored design instead). `None` off the
    /// keyboard or for settings the strings or hammer can't take.
    #[must_use]
    pub fn new(sample_rate: f64, midi: u8, voicing: Voicing, velocity: f64) -> Option<Self> {
        let mut unison = Self::with_capacity(sample_rate)?;
        let design = voicing.design(sample_rate, crate::piano::frequency(midi));
        unison
            .restrike(midi, voicing, design.as_ref(), velocity)
            .then_some(unison)
    }

    /// Re-strings these strings for key `midi` with `voicing` and the
    /// stored dispersion `design`, and strikes them at `velocity` m/s,
    /// without allocating. `false`, **changing nothing** (a ringing note
    /// keeps ringing), off the keyboard or for a velocity the hammer can't
    /// take: both are checked before the strings are touched. (Strings
    /// that can't be restrung, which no key on the keyboard asks for, are
    /// left silent.)
    pub(crate) fn restrike(
        &mut self,
        midi: u8,
        voicing: Voicing,
        design: Option<&Dispersion>,
        velocity: f64,
    ) -> bool {
        let Some(felt) = hammer::felt(midi) else {
            return false;
        };
        let string_impedance = hammer::impedance(midi);
        // One hammer for every string of the key: the same felt, impedance
        // and speed.
        let Some(hammer) = Hammer::new(felt, string_impedance, self.sample_rate, velocity) else {
            return false;
        };
        self.active = 0;
        let fundamental_hz = crate::piano::frequency(midi);
        let count = strings(midi);
        for (index, string) in self.strings.iter_mut().take(count).enumerate() {
            let tuned_hz = fundamental_hz * libm::exp2(offset(index, count) / CENTS_PER_OCTAVE);
            let restrung = string.restring_designed(self.sample_rate, tuned_hz, voicing, design);
            if !(restrung && string.strike(hammer, 1.0 - STRIKE)) {
                return false;
            }
        }
        self.active = count;
        self.previous = [S::ZERO; MAX_STRINGS];
        self.force_scale = S::from_f64(2.0 * string_impedance * self.sample_rate);
        self.string_impedance = string_impedance;
        true
    }

    /// The release: every string's damper (see [`Waveguide::damp`]).
    pub fn damp(&mut self, decay_time_60db: f64, ramp: core::num::NonZeroUsize) {
        for string in self.strings.iter_mut().take(self.active) {
            string.damp(decay_time_60db, ramp);
        }
    }

    /// How many strings sound.
    #[must_use]
    pub fn len(&self) -> usize {
        self.active
    }

    /// Before any strike (or after a refused one).
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.active == 0
    }

    /// Each string's pitch, Hz.
    pub fn pitches(&self) -> impl Iterator<Item = f64> + '_ {
        self.strings.iter().take(self.active).map(Waveguide::pitch)
    }

    /// The hammers, one per string.
    pub fn hammers(&self) -> impl Iterator<Item = &Hammer> + '_ {
        self.strings
            .iter()
            .take(self.active)
            .filter_map(Waveguide::hammer)
    }

    /// The middle string (the one in tune), for the page to draw.
    pub(crate) fn middle(&self) -> Option<&Waveguide<S>> {
        self.strings
            .get(self.active / 2)
            .filter(|_| self.active > 0)
    }

    /// The strings' energy, J (see [`Waveguide::energy`]).
    #[must_use]
    pub fn energy(&self) -> f64 {
        self.strings
            .iter()
            .take(self.active)
            .map(|string| string.energy(self.string_impedance, self.sample_rate))
            .sum()
    }

    /// The next sample: the strings' summed force on the bridge, N.
    pub fn next_sample(&mut self) -> S {
        let mut sum = S::ZERO;
        let strings = self.strings.iter_mut().take(self.active);
        for (string, previous) in strings.zip(self.previous.iter_mut()) {
            let output = string.step();
            sum += self.force_scale * (output - *previous);
            *previous = output;
        }
        sum
    }

    /// Fills `out` with the next samples.
    pub fn render(&mut self, out: &mut [S]) {
        for sample in out {
            *sample = self.next_sample();
        }
    }
}

#[cfg(test)]
mod tests;
