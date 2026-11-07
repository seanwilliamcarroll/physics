//! The hammer (`docs/14-piano.md`, "The hammer"): a mass on a nonlinear
//! felt spring, `F = K c^p` while the felt is compressed by `c`, striking
//! a string of wave impedance `Z`.
//!
//! Physical units throughout (m, kg, N, s): the string's displacement is
//! in metres, so the string's energy can be checked against the hammer's.
//!
//! **Coupling.** The force acts at a junction on the string. A point force
//! moves the string there at `F / 2Z` (half each way), so each wave the
//! force launches carries displacement `I / 2Z`, `I = ∫F dt` the impulse so
//! far, and the junction's displacement is the incoming waves plus `I / 2Z`.
//! After contact `I` stays constant: the step it launched travels out,
//! reflects inverted at the ends, and cancels.
//!
//! **Energy-conserving, implicit.** Each sample the hammer moves by the
//! midpoint rule, and the felt's force over the sample is its potential's
//! difference quotient (a discrete gradient):
//! `F̄ = (V(c₁) − V(c₀)) / (c₁ − c₀)`, `V(c) = K c^(p+1) / (p+1)`. Then the
//! hammer's kinetic energy plus the felt's potential changes by exactly
//! the work done on the string. The new compression is linear in `F̄`
//! (the hammer slows, the string gives), so `c₁ = c_free − a F̄(c₁)` has
//! one root, found by a safeguarded Newton iteration. Both simpler
//! schemes failed in a prototype: explicit (the force a sample late) put
//! up to 16× the hammer's momentum into the string, and backward Euler
//! lost 30–50 % of the energy of an elastic bounce to numerical damping.
//!
//! **Re-contact.** The near end's reflection can kick the string away from
//! a hammer still flying forward (several contact pulses in one blow, in
//! the treble); the hammer stays a free mass until it moves away from the
//! string, then retires.

mod contact;
#[cfg(test)]
mod fit;
mod keys;
mod table;

pub use contact::contact_time;
pub use keys::{
    FORTISSIMO, MAX_VELOCITY, PIANISSIMO, SPREAD, STRIKE, contact_target, exponent, impedance,
    mezzo_forte,
};

/// The rate the hammers were fitted at, Hz.
pub const FITTED_AT: f64 = 48_000.0;

/// Each key's hammer: the smooth fit (`fit.rs`, done offline, as fitting
/// all 88 takes seconds; `regenerate_the_table` redoes it), its exponent
/// from `keys`. `None` off the keyboard (MIDI 21 to 108).
#[must_use]
pub fn felt(midi: u8) -> Option<Felt> {
    if !(table::FIRST..=table::LAST).contains(&midi) {
        return None;
    }
    let t = keys::key_coordinate(midi);
    let cubic = |c: &[f64]| c.iter().rev().fold(0.0, |acc, &a| acc * t + a);
    Some(Felt {
        mass: libm::exp(cubic(&table::MASS)),
        stiffness: libm::exp(cubic(&table::STIFFNESS)),
        exponent: keys::exponent(midi),
    })
}

/// A hammer's mass `M` (kg), its felt's stiffness `K` (N/mᵖ) and exponent
/// `p`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Felt {
    pub mass: f64,
    pub stiffness: f64,
    pub exponent: f64,
}

/// Newton iterations for a sample's compression, at most (it converges in
/// a few; a fixed limit keeps it deterministic and bounded).
const ITERATIONS: u32 = 40;
/// Relative change (or bracket width) at which the compression is solved.
const TOLERANCE: f64 = 1e-12;
/// Compressions closer than this (relative) use the potential's slope at
/// their midpoint, not the difference quotient (which would cancel).
const CLOSE: f64 = 1e-6;

/// A hammer in flight, from the moment it touches the string at
/// `velocity` m/s.
#[derive(Copy, Clone, Debug)]
pub struct Hammer {
    felt: Felt,
    /// `1 / 2Z`, m per N·s: the displacement a unit impulse launches.
    admittance: f64,
    dt: f64,
    /// How the compression falls per newton of this sample's force,
    /// `dt² / 2M + dt / 2Z`.
    give: f64,
    position: f64,
    velocity: f64,
    impulse: f64,
    force: f64,
    /// This sample's felt compression, m (negative when apart).
    compression: f64,
    retired: bool,
}

impl Hammer {
    /// A hammer with `felt` striking a string of impedance `z` (kg/s) at
    /// `velocity` (m/s), stepped at `fs` Hz; `None` for values that aren't
    /// positive and finite, or a velocity above [`MAX_VELOCITY`].
    #[must_use]
    pub fn new(felt: Felt, z: f64, fs: f64, velocity: f64) -> Option<Self> {
        let ok = |x: f64| x > 0.0 && x.is_finite();
        let valid = [felt.mass, felt.stiffness, felt.exponent, z, fs, velocity]
            .into_iter()
            .all(ok);
        if !valid || velocity > MAX_VELOCITY {
            return None;
        }
        let dt = 1.0 / fs;
        let admittance = 1.0 / (2.0 * z);
        Some(Self {
            felt,
            admittance,
            dt,
            give: 0.5 * dt * dt / felt.mass + dt * admittance,
            position: 0.0,
            velocity,
            impulse: 0.0,
            force: 0.0,
            compression: 0.0,
            retired: false,
        })
    }

    /// One sample. `incoming` is the displacement the string's incoming
    /// waves bring to the junction this sample; returns `I / 2Z`, the
    /// displacement each launched wave carries (to add to both).
    pub fn step(&mut self, incoming: f64) -> f64 {
        if self.retired {
            return self.launched();
        }
        // The compression if the felt pushed nothing this sample.
        let free = self.position + self.velocity * self.dt - (incoming + self.launched());
        let before = self.compression;
        let after = solve_compression(free, before, self.felt, self.give, self.force);
        self.force = mean_force(after, before, self.felt);
        self.compression = after;
        self.impulse += self.force * self.dt;
        let slowed = self.velocity - self.force / self.felt.mass * self.dt;
        self.position += f64::midpoint(self.velocity, slowed) * self.dt;
        self.velocity = slowed;
        if self.force <= 0.0 && self.velocity < 0.0 {
            self.retired = true;
        }
        self.launched()
    }

    /// The displacement each launched wave carries, `I / 2Z`.
    #[must_use]
    pub fn launched(&self) -> f64 {
        self.impulse * self.admittance
    }

    /// This sample's force (its mean over the sample), N.
    #[must_use]
    pub const fn force(&self) -> f64 {
        self.force
    }

    /// This sample's felt compression, m (negative when apart).
    #[must_use]
    pub const fn compression(&self) -> f64 {
        self.compression
    }

    /// Whether the hammer has left the string for good.
    #[must_use]
    pub const fn retired(&self) -> bool {
        self.retired
    }

    /// Test-only: the hammer's velocity, m/s (negative once it rebounds).
    #[cfg(test)]
    #[must_use]
    pub(crate) const fn velocity(&self) -> f64 {
        self.velocity
    }

    /// The hammer's kinetic energy, J.
    #[must_use]
    pub fn energy(&self) -> f64 {
        0.5 * self.felt.mass * self.velocity * self.velocity
    }
}

/// The felt's potential energy at compression `c`, J.
fn potential(c: f64, felt: Felt) -> f64 {
    let c = c.max(0.0);
    felt.stiffness * libm::pow(c, felt.exponent + 1.0) / (felt.exponent + 1.0)
}

/// The felt's force at compression `c`, `V′(c)`, N.
fn spring(c: f64, felt: Felt) -> f64 {
    felt.stiffness * libm::pow(c.max(0.0), felt.exponent)
}

/// The felt's mean force from compression `c0` to `c1`: the potential's
/// difference quotient (its slope at the midpoint when they're close).
/// Rises with `c1` (the potential is convex).
fn mean_force(c1: f64, c0: f64, felt: Felt) -> f64 {
    let scale = c1.abs().max(c0.abs());
    if (c1 - c0).abs() <= CLOSE * scale {
        spring(f64::midpoint(c1, c0), felt)
    } else {
        (potential(c1, felt) - potential(c0, felt)) / (c1 - c0)
    }
}

/// How the mean force changes with `c1`.
fn mean_force_slope(c1: f64, c0: f64, felt: Felt) -> f64 {
    let scale = c1.abs().max(c0.abs());
    if (c1 - c0).abs() <= CLOSE * scale {
        // Half the spring's own slope, `V″ / 2`, at the midpoint.
        let mid = f64::midpoint(c1, c0).max(0.0);
        0.5 * felt.stiffness * felt.exponent * libm::pow(mid, felt.exponent - 1.0)
    } else {
        (spring(c1, felt) - mean_force(c1, c0, felt)) / (c1 - c0)
    }
}

/// The new compression `c` with `c = free − give · F̄(c, before)`: the left
/// side rises in `c` faster than the right falls, so there's one root,
/// at most `free` and at least `free − give · V′(max(free, before))`.
/// Newton's step where it stays in the bracket, bisection where it
/// doesn't, from the compression the last sample's force `guess` would
/// give.
fn solve_compression(free: f64, before: f64, felt: Felt, give: f64, guess: f64) -> f64 {
    if free <= 0.0 && before <= 0.0 {
        return free;
    }
    let (mut lo, mut hi) = (free - give * spring(free.max(before), felt), free);
    let mut c = (free - give * guess).clamp(lo, hi);
    for _ in 0..ITERATIONS {
        let h = c - free + give * mean_force(c, before, felt);
        if h > 0.0 {
            hi = c;
        } else {
            lo = c;
        }
        let next = c - h / (1.0 + give * mean_force_slope(c, before, felt));
        let previous = c;
        c = if next > lo && next < hi {
            next
        } else {
            f64::midpoint(lo, hi)
        };
        // Newton closes in from one side, so test the step, not the
        // bracket.
        let scale = c.abs().max(free.abs());
        let settled = (c - previous).abs() <= TOLERANCE * scale || hi - lo <= TOLERANCE * scale;
        if settled {
            break;
        }
    }
    c
}

#[cfg(test)]
mod tests;
