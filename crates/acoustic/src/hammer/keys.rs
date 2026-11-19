//! The hammer and string along the keyboard: **our choices**
//! (`docs/14-piano.md`), except the contact times' ends and spread, which
//! are measured (Askenfelt).

/// Where the hammer strikes, from the nut: an eighth of the length.
pub const STRIKE: f64 = 0.125;

const A0: f64 = 21.0;
const C4: f64 = 60.0;
const C8: f64 = 108.0;

/// The string's wave impedance `Z = √(T μ)`, kg/s, at A0, C4 and C8: about
/// 750 N and a wound 0.13 kg/m in the bass, plain 1 mm and 0.8 mm wire at
/// C4 and C8. Log-linear between.
const IMPEDANCE: (f64, f64, f64) = (10.0, 2.2, 1.7);

/// The felt's exponent, bass to treble (inside the measured 2.2–3.5).
const EXPONENT: (f64, f64) = (2.3, 3.0);

/// Contact time at mezzo-forte, s, at A0 and C8: about 4 ms in the bass,
/// under 1 ms in the highest treble (measured); log-linear between (ours).
const CONTACT: (f64, f64) = (4.0e-3, 0.8e-3);

/// The hammer's speed at pp and ff, m/s (ours); mf is their geometric mean.
pub const PIANISSIMO: f64 = 0.5;
pub const FORTISSIMO: f64 = 5.0;

/// The fastest strike a [`Hammer`](super::Hammer) accepts, m/s: twice ff
/// (ours). Without a bound, a huge speed launched waves past `f32`'s range
/// and the next sample's `∞ − ∞` panicked in the solver.
pub const MAX_VELOCITY: f64 = 2.0 * FORTISSIMO;

/// Contact at pp over contact at ff: "about ±20 % from p to ff" (measured)
/// read as 1.2 / 0.8.
#[cfg(test)]
pub(super) const SPREAD: f64 = 1.5;

fn along(midi: u8, from: f64, to: f64) -> f64 {
    ((f64::from(midi) - from) / (to - from)).clamp(0.0, 1.0)
}

pub(crate) fn key_coordinate(midi: u8) -> f64 {
    let (middle, half_span) = (f64::midpoint(A0, C8), 0.5 * (C8 - A0));
    (f64::from(midi) - middle) / half_span
}

fn geometric(from: f64, to: f64, fraction: f64) -> f64 {
    from * libm::pow(to / from, fraction)
}

#[must_use]
pub fn impedance(midi: u8) -> f64 {
    let (bass, middle, treble) = IMPEDANCE;
    if f64::from(midi) <= C4 {
        geometric(bass, middle, along(midi, A0, C4))
    } else {
        geometric(middle, treble, along(midi, C4, C8))
    }
}

#[must_use]
pub fn exponent(midi: u8) -> f64 {
    let (bass, treble) = EXPONENT;
    bass + (treble - bass) * along(midi, A0, C8)
}

#[must_use]
pub fn contact_target(midi: u8) -> f64 {
    geometric(CONTACT.0, CONTACT.1, along(midi, A0, C8))
}

#[must_use]
pub(crate) fn mezzo_forte() -> f64 {
    libm::sqrt(PIANISSIMO * FORTISSIMO)
}
