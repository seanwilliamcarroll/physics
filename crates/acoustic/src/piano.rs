//! The piano's keys (`docs/14-piano.md`): each key's voicing, and the
//! table of dispersion designs the voices strike from. Designing takes
//! milliseconds, so all 88 are designed once, and the decay is a fixed curve
//! per key (a design depends on it).

use crate::dispersion::Dispersion;
use crate::{Decay, Voicing, inharmonicity};

pub const FIRST_KEY: u8 = 21;
pub const LAST_KEY: u8 = 108;
const KEYS: usize = (LAST_KEY - FIRST_KEY + 1) as usize;

/// The fundamental's decay, s, at A0 and C8, geometric between: **our
/// choice**, not measured.
const DECAY: (f64, f64) = (20.0, 1.5);

#[must_use]
pub fn t60(midi: u8) -> f64 {
    let fraction =
        (f64::from(midi.clamp(FIRST_KEY, LAST_KEY) - FIRST_KEY)) / f64::from(LAST_KEY - FIRST_KEY);
    DECAY.0 * libm::pow(DECAY.1 / DECAY.0, fraction)
}

#[must_use]
pub fn frequency(midi: u8) -> f64 {
    440.0 * libm::exp2((f64::from(midi) - 69.0) / 12.0)
}

/// Key `midi`'s voicing: tuned, its decay, and its stiffness if `stiff`.
#[must_use]
pub fn voicing(midi: u8, stiff: bool) -> Voicing {
    Voicing {
        tuned: true,
        decay: Decay::T60(t60(midi)),
        inharmonicity: if stiff { inharmonicity(midi) } else { 0.0 },
    }
}

/// Every key's dispersion design at one sample rate; a key's strings share
/// it (a cent of detuning is far inside its accuracy).
#[derive(Clone, Debug)]
pub(crate) struct Designs {
    designs: Vec<Option<Dispersion>>,
}

impl Designs {
    pub(crate) fn new(sample_rate: f64) -> Self {
        let designs = (FIRST_KEY..=LAST_KEY)
            .map(|key| voicing(key, true).design(sample_rate, frequency(key)))
            .collect();
        Self { designs }
    }

    /// Key `midi`'s design: `None` off the keyboard, or where the key has
    /// no cascade (too few partials in the band, at the very top).
    pub(crate) fn get(&self, midi: u8) -> Option<&Dispersion> {
        let index = usize::from(midi.checked_sub(FIRST_KEY)?);
        self.designs.get(index)?.as_ref()
    }

    #[cfg(test)]
    pub(crate) fn designed(&self) -> usize {
        self.designs
            .iter()
            .filter(|design| design.is_some())
            .count()
    }
}

const _: () = assert!(KEYS == 88);

#[cfg(test)]
mod tests;
