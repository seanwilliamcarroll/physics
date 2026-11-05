//! [`Unison`]: one key's strings (`docs/14-piano.md`, "String groups"):
//! 1, 2 or 3 stiff strings tuned a little apart, each struck by its own
//! copy of the key's hammer, uncoupled, their forces on the bridge summed.
//!
//! **A hammer per string.** At impact the strings are identical, and a
//! cent of detuning barely changes them during a 1–4 ms contact, so `N`
//! hammers of mass `M` on `N` strings behave like one of `N M` on all of
//! them: the fitted hammer (section 3) is a hammer *per string*, and the
//! contact times stay the tested ones.

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

/// String `i`'s tuning of `n`, cents from the note: symmetric, so the
/// group's mean is the note (−½, ½ for two; −1, 0, 1 for three).
#[must_use]
pub fn offset(i: usize, n: usize) -> f64 {
    let (i, n) = (usize_to_f64(i), usize_to_f64(n));
    (i - (n - 1.0) / 2.0) * DETUNE_CENTS
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
    z: f64,
    fs: f64,
}

impl<S: Scalar> Unison<S> {
    /// Silent strings at `fs` Hz with room for any key (A0's loop);
    /// `None` for a rate that can't play A0.
    #[must_use]
    pub fn with_capacity(fs: f64) -> Option<Self> {
        let probe = Voicing {
            tuned: true,
            decay: Decay::Loss(1.0),
            inharmonicity: 0.0,
        };
        let cap = f64_to_usize(libm::ceil(fs / LOWEST_HZ)).unwrap_or(0);
        let string = Waveguide::with_capacity(fs, LOWEST_HZ, probe, cap)?;
        Some(Self {
            strings: vec![string; MAX_STRINGS],
            active: 0,
            previous: [S::ZERO; MAX_STRINGS],
            force_scale: S::ZERO,
            // Until struck: `restrike` sets the key's.
            z: 1.0,
            fs,
        })
    }

    /// Key `midi`'s strings at `fs` Hz, voiced by `voicing` (its pitch is
    /// the key's, equal-tempered; each string detuned by [`offset`]),
    /// struck at `velocity` m/s; the dispersion designed here (milliseconds:
    /// voices use a stored design instead). `None` off the keyboard or for
    /// settings the strings or hammer can't take.
    #[must_use]
    pub fn new(fs: f64, midi: u8, voicing: Voicing, velocity: f64) -> Option<Self> {
        let mut u = Self::with_capacity(fs)?;
        let design = voicing.design(fs, crate::piano::frequency(midi));
        u.restrike(midi, voicing, design.as_ref(), velocity)
            .then_some(u)
    }

    /// Re-strings these strings for key `midi` with `voicing` and the
    /// stored dispersion `design`, and strikes them at `velocity` m/s,
    /// without allocating. `false`, leaving them silent, off the keyboard
    /// or for settings the strings or hammer can't take.
    pub(crate) fn restrike(
        &mut self,
        midi: u8,
        voicing: Voicing,
        design: Option<&Dispersion>,
        velocity: f64,
    ) -> bool {
        self.active = 0;
        let Some(felt) = hammer::felt(midi) else {
            return false;
        };
        let z = hammer::impedance(midi);
        let f0 = crate::piano::frequency(midi);
        let n = strings(midi);
        for (i, s) in self.strings.iter_mut().take(n).enumerate() {
            let tuned = f0 * libm::exp2(offset(i, n) / CENTS_PER_OCTAVE);
            let Some(h) = Hammer::new(felt, z, self.fs, velocity) else {
                return false;
            };
            if !(s.restring_designed(self.fs, tuned, voicing, design) && s.strike(h, 1.0 - STRIKE))
            {
                return false;
            }
        }
        self.active = n;
        self.previous = [S::ZERO; MAX_STRINGS];
        self.force_scale = S::from_f64(2.0 * z * self.fs);
        self.z = z;
        true
    }

    /// The release: every string's damper (see [`Waveguide::damp`]).
    pub fn damp(&mut self, t60: f64) {
        for s in self.strings.iter_mut().take(self.active) {
            s.damp(t60);
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
            .map(|s| s.energy(self.z, self.fs))
            .sum()
    }

    /// The next sample: the strings' summed force on the bridge, N.
    pub fn next_sample(&mut self) -> S {
        let mut sum = S::ZERO;
        let strings = self.strings.iter_mut().take(self.active);
        for (s, previous) in strings.zip(self.previous.iter_mut()) {
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
