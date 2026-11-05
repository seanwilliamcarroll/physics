//! The piano's keys (`docs/14-piano.md`): each key's voicing, and the
//! table of dispersion designs the voices strike from.
//!
//! Designing a key's dispersion takes milliseconds, far past a render
//! block, so the piano designs all 88 once (`Designs::new`, when the
//! synth first plays the piano) and every note on looks its key up. A
//! design depends on the loop lowpass's stretch, which the decay sets, so
//! the piano's decay is a fixed curve per key, not a setting.

use crate::dispersion::Dispersion;
use crate::{Decay, Voicing, inharmonicity};

/// The keyboard, MIDI: A0 to C8.
pub const FIRST_KEY: u8 = 21;
pub const LAST_KEY: u8 = 108;
const KEYS: usize = (LAST_KEY - FIRST_KEY + 1) as usize;

/// The fundamental's decay, s, at A0 and at C8: **our choice**, a long bass
/// falling to a short treble as on a piano (geometric between), not a
/// measured curve.
const DECAY: (f64, f64) = (20.0, 1.5);

/// Key `midi`'s fundamental decay time, s (clamped to the keyboard).
#[must_use]
pub fn t60(midi: u8) -> f64 {
    let t =
        (f64::from(midi.clamp(FIRST_KEY, LAST_KEY) - FIRST_KEY)) / f64::from(LAST_KEY - FIRST_KEY);
    DECAY.0 * libm::pow(DECAY.1 / DECAY.0, t)
}

/// Key `midi`'s equal-tempered pitch, Hz (A4 = 440).
#[must_use]
pub fn frequency(midi: u8) -> f64 {
    440.0 * libm::exp2((f64::from(midi) - 69.0) / 12.0)
}

/// How key `midi`'s strings are voiced: tuned, its decay, and its stiffness
/// (`stiff`), or none (A2's ideal string, the page's toggle).
#[must_use]
pub fn voicing(midi: u8, stiff: bool) -> Voicing {
    Voicing {
        tuned: true,
        decay: Decay::T60(t60(midi)),
        inharmonicity: if stiff { inharmonicity(midi) } else { 0.0 },
    }
}

/// Every key's dispersion design at one sample rate. A key's strings,
/// detuned by a cent, share it: their tuning allpass absorbs the cent, and
/// the design's partials move by a cent too (far inside its accuracy).
#[derive(Clone, Debug)]
pub(crate) struct Designs {
    designs: Vec<Option<Dispersion>>,
}

impl Designs {
    /// Designs all 88 keys at `fs` Hz (about 200 ms natively).
    pub(crate) fn new(fs: f64) -> Self {
        let designs = (FIRST_KEY..=LAST_KEY)
            .map(|key| voicing(key, true).design(fs, frequency(key)))
            .collect();
        Self { designs }
    }

    /// Key `midi`'s design: `None` off the keyboard, or where the key has
    /// no cascade (too few partials in the band, at the very top).
    pub(crate) fn get(&self, midi: u8) -> Option<&Dispersion> {
        let i = usize::from(midi.checked_sub(FIRST_KEY)?);
        self.designs.get(i)?.as_ref()
    }

    /// How many keys have a cascade.
    #[cfg(test)]
    pub(crate) fn designed(&self) -> usize {
        self.designs.iter().filter(|d| d.is_some()).count()
    }
}

const _: () = assert!(KEYS == 88);

#[cfg(test)]
mod tests;
