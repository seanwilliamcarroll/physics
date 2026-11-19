//! The hammer (`docs/14-piano.md`, "The hammer"): a mass on a nonlinear
//! felt spring, `F = K c^p`, striking a string of wave impedance `Z`; stepped
//! implicitly, conserving energy. Units: m, kg, N, s.

// `contact` and `fit` are offline tools for regenerating `table`.
#[cfg(test)]
mod contact;
#[cfg(test)]
mod fit;
mod keys;
mod table;

#[cfg(test)]
use contact::contact_time;
#[cfg(test)]
use keys::SPREAD;
pub(crate) use keys::mezzo_forte;
pub use keys::{FORTISSIMO, MAX_VELOCITY, PIANISSIMO, STRIKE, contact_target, exponent, impedance};

#[cfg(test)]
const FITTED_AT: f64 = 48_000.0;

/// Each key's hammer, from the smooth fit in `table`. `None` off the
/// keyboard (MIDI 21 to 108).
#[must_use]
pub fn felt(midi: u8) -> Option<Felt> {
    if !(table::FIRST..=table::LAST).contains(&midi) {
        return None;
    }
    let key_coordinate = keys::key_coordinate(midi);
    let cubic = |coefficients: &[f64]| {
        coefficients
            .iter()
            .rev()
            .fold(0.0, |sum, &coefficient| sum * key_coordinate + coefficient)
    };
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

/// Newton iteration limit per sample: a fixed bound keeps it deterministic.
const ITERATIONS: u32 = 40;
/// Relative change (or bracket width) at which the compression is solved.
const TOLERANCE: f64 = 1e-12;
/// Compressions closer than this (relative) use the potential's slope at
/// their midpoint, not the difference quotient (which would cancel).
const CLOSE: f64 = 1e-6;

#[derive(Copy, Clone, Debug)]
pub struct Hammer {
    felt: Felt,
    /// `1 / 2Z`, m per N·s: the displacement a unit impulse launches.
    admittance: f64,
    time_step: f64,
    /// How the compression falls per newton of this sample's force,
    /// `dt² / 2M + dt / 2Z`.
    give: f64,
    position: f64,
    velocity: f64,
    impulse: f64,
    force: f64,
    compression: f64,
    retired: bool,
}

impl Hammer {
    /// `string_impedance` in kg/s, `velocity` in m/s. `None` for values that
    /// aren't positive and finite, or a velocity above [`MAX_VELOCITY`].
    #[must_use]
    pub fn new(felt: Felt, string_impedance: f64, sample_rate: f64, velocity: f64) -> Option<Self> {
        let ok = |x: f64| x > 0.0 && x.is_finite();
        let valid = [
            felt.mass,
            felt.stiffness,
            felt.exponent,
            string_impedance,
            sample_rate,
            velocity,
        ]
        .into_iter()
        .all(ok);
        if !valid || velocity > MAX_VELOCITY {
            return None;
        }
        let time_step = 1.0 / sample_rate;
        let admittance = 1.0 / (2.0 * string_impedance);
        Some(Self {
            felt,
            admittance,
            time_step,
            give: 0.5 * time_step * time_step / felt.mass + time_step * admittance,
            position: 0.0,
            velocity,
            impulse: 0.0,
            force: 0.0,
            compression: 0.0,
            retired: false,
        })
    }

    /// One sample. `incoming` is the displacement the string's waves bring
    /// to the junction; returns `I / 2Z`, what each launched wave carries.
    pub fn step(&mut self, incoming: f64) -> f64 {
        if self.retired {
            return self.launched();
        }
        // The compression if the felt pushed nothing this sample.
        let free = self.position + self.velocity * self.time_step - (incoming + self.launched());
        let before = self.compression;
        let after = solve_compression(free, before, self.felt, self.give, self.force);
        self.force = mean_force(after, before, self.felt);
        self.compression = after;
        self.impulse += self.force * self.time_step;
        let slowed = self.velocity - self.force / self.felt.mass * self.time_step;
        self.position += f64::midpoint(self.velocity, slowed) * self.time_step;
        self.velocity = slowed;
        if self.force <= 0.0 && self.velocity < 0.0 {
            self.retired = true;
        }
        self.launched()
    }

    #[must_use]
    pub fn launched(&self) -> f64 {
        self.impulse * self.admittance
    }

    #[must_use]
    pub const fn force(&self) -> f64 {
        self.force
    }

    #[must_use]
    pub const fn compression(&self) -> f64 {
        self.compression
    }

    #[must_use]
    pub const fn retired(&self) -> bool {
        self.retired
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) const fn velocity(&self) -> f64 {
        self.velocity
    }

    #[must_use]
    pub fn energy(&self) -> f64 {
        0.5 * self.felt.mass * self.velocity * self.velocity
    }
}

fn potential(compression: f64, felt: Felt) -> f64 {
    let compression = compression.max(0.0);
    felt.stiffness * libm::pow(compression, felt.exponent + 1.0) / (felt.exponent + 1.0)
}

fn spring(compression: f64, felt: Felt) -> f64 {
    felt.stiffness * libm::pow(compression.max(0.0), felt.exponent)
}

/// The felt's mean force from `before` to `after`: the potential's
/// difference quotient (its midpoint slope when they're close).
fn mean_force(after: f64, before: f64, felt: Felt) -> f64 {
    let scale = after.abs().max(before.abs());
    if (after - before).abs() <= CLOSE * scale {
        spring(f64::midpoint(after, before), felt)
    } else {
        (potential(after, felt) - potential(before, felt)) / (after - before)
    }
}

fn mean_force_slope(after: f64, before: f64, felt: Felt) -> f64 {
    let scale = after.abs().max(before.abs());
    if (after - before).abs() <= CLOSE * scale {
        // Half the spring's own slope, `V″ / 2`, at the midpoint.
        let midpoint = f64::midpoint(after, before).max(0.0);
        0.5 * felt.stiffness * felt.exponent * libm::pow(midpoint, felt.exponent - 1.0)
    } else {
        (spring(after, felt) - mean_force(after, before, felt)) / (after - before)
    }
}

/// The new compression `c` with `c = free − give · F̄(c, before)`: the left
/// side rises faster than the right falls, so the one root lies in
/// `[free − give · V′(max(free, before)), free]`. Newton's step inside the
/// bracket, bisection outside; `guess` is the last sample's force.
fn solve_compression(free: f64, before: f64, felt: Felt, give: f64, guess: f64) -> f64 {
    if free <= 0.0 && before <= 0.0 {
        return free;
    }
    let (mut lower, mut upper) = (free - give * spring(free.max(before), felt), free);
    let mut compression = (free - give * guess).clamp(lower, upper);
    for _ in 0..ITERATIONS {
        let residual = compression - free + give * mean_force(compression, before, felt);
        if residual > 0.0 {
            upper = compression;
        } else {
            lower = compression;
        }
        let newton =
            compression - residual / (1.0 + give * mean_force_slope(compression, before, felt));
        let previous = compression;
        compression = if newton > lower && newton < upper {
            newton
        } else {
            f64::midpoint(lower, upper)
        };
        // Newton closes in from one side, so test the step, not the
        // bracket.
        let scale = compression.abs().max(free.abs());
        let settled = (compression - previous).abs() <= TOLERANCE * scale
            || upper - lower <= TOLERANCE * scale;
        if settled {
            break;
        }
    }
    compression
}

#[cfg(test)]
mod tests;
