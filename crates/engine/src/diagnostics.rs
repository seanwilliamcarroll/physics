//! Physical measurements of a [`Particles`] set, shared by tests and demo
//! plots (`docs/04-testing.md`). Static particles (`inverse_mass = 0`) are
//! excluded; mass is `1 / inverse_mass`, fine for once-per-frame readouts.

use crate::{Constraint, PairwiseGravity, Particles, Scalar, UniformGravity, Vec2};

fn dynamic<S: Scalar>(particles: &Particles<S>) -> impl Iterator<Item = (Vec2<S>, S)> + '_ {
    particles
        .velocities()
        .iter()
        .zip(particles.inverse_mass())
        .filter(|&(_, &inverse_mass)| inverse_mass != S::ZERO)
        .map(|(&vel, &inverse_mass)| (vel, inverse_mass))
}

/// Total linear momentum `Σ m v`.
pub fn momentum<S: Scalar>(particles: &Particles<S>) -> Vec2<S> {
    dynamic(particles).fold(Vec2::ZERO, |total, (vel, inverse_mass)| {
        total + vel / inverse_mass
    })
}

/// Total kinetic energy `Σ ½ m |v|²`, computed as `|v|² / (2 w)`.
#[must_use]
pub fn kinetic_energy<S: Scalar>(particles: &Particles<S>) -> S {
    // `w + w` rather than `from_f64(2.0) * w`: exact, and no conversion.
    dynamic(particles).fold(S::ZERO, |total, (vel, inverse_mass)| {
        total + vel.length_sq() / (inverse_mass + inverse_mass)
    })
}

/// Rotational kinetic energy `Σ ½ I |ω|²`, `I = (2/5) m R²`, over the
/// balls (moving circles) in `particles` with spins `spin` (`World::spin`).
#[must_use]
pub fn rotational_energy<S: Scalar>(particles: &Particles<S>, spin: &[Vec2<S>]) -> S {
    let five = S::from_f64(5.0);
    particles
        .inverse_mass()
        .iter()
        .zip(particles.radius())
        .zip(spin)
        .filter(|((inverse_mass, radius), _)| **inverse_mass != S::ZERO && **radius != S::ZERO)
        // ½ (2/5) m R² |ω|² = m R² |ω|² / 5.
        .fold(
            S::ZERO,
            |total, ((inverse_mass, radius), angular_velocity)| {
                total + *radius * *radius * angular_velocity.length_sq() / (five * *inverse_mass)
            },
        )
}

/// Mass-weighted mean position `Σ m x / Σ m` of the dynamic particles, or
/// `None` if there are none.
#[must_use]
pub fn center_of_mass<S: Scalar>(particles: &Particles<S>) -> Option<Vec2<S>> {
    let (weighted, total_mass) = particles
        .positions()
        .iter()
        .zip(particles.inverse_mass())
        .filter(|&(_, &inverse_mass)| inverse_mass != S::ZERO)
        .fold(
            (Vec2::ZERO, S::ZERO),
            |(sum_moment, sum_mass), (&x, &inverse_mass)| {
                (
                    sum_moment + x / inverse_mass,
                    sum_mass + S::ONE / inverse_mass,
                )
            },
        );
    (total_mass != S::ZERO).then(|| weighted / total_mass)
}

/// Gravitational potential energy `Σ_{i<j} −G mᵢ mⱼ / √(|r|² + ε²)`: the
/// Plummer potential whose gradient is [`PairwiseGravity`]'s force. A
/// coincident pair with ε = 0 is skipped (its potential is −∞).
#[must_use]
pub fn gravity_potential<S: Scalar>(particles: &Particles<S>, gravity: &PairwiseGravity<S>) -> S {
    let bodies: Vec<(Vec2<S>, S)> = particles
        .positions()
        .iter()
        .zip(particles.inverse_mass())
        .filter(|&(_, &inverse_mass)| inverse_mass != S::ZERO)
        .map(|(&x, &inverse_mass)| (x, S::ONE / inverse_mass))
        .collect();
    let mut total = S::ZERO;
    let mut remaining = bodies.as_slice();
    while let Some((&(x_i, mass_i), tail)) = remaining.split_first() {
        for &(x_j, mass_j) in tail {
            let distance_sq = (x_j - x_i).length_sq() + gravity.softening_sq();
            if distance_sq != S::ZERO {
                total -= gravity.gravitational_constant() * mass_i * mass_j / distance_sq.sqrt();
            }
        }
        remaining = tail;
    }
    total
}

/// [`kinetic_energy`] + [`gravity_potential`]: its drift measures an
/// integrator's error.
#[must_use]
pub fn total_energy<S: Scalar>(particles: &Particles<S>, gravity: &PairwiseGravity<S>) -> S {
    kinetic_energy(particles) + gravity_potential(particles, gravity)
}

/// Potential energy in uniform gravity, `Σ m (−g · x)`, J: zero at the
/// origin, so `m g h` with `h` the height above it.
#[must_use]
pub fn uniform_gravity_potential<S: Scalar>(
    particles: &Particles<S>,
    gravity: &UniformGravity<S>,
) -> S {
    particles
        .positions()
        .iter()
        .zip(particles.inverse_mass())
        .filter(|&(_, &inverse_mass)| inverse_mass != S::ZERO)
        .fold(S::ZERO, |total, (&x, &inverse_mass)| {
            total - gravity.acceleration().dot(x) / inverse_mass
        })
}

/// Max and RMS of `|C|` over `constraints`, in the constraint's units (m
/// for a rod: how far it is stretched or compressed). `None` with no
/// constraints; one whose bodies aren't in `particles` is skipped.
#[must_use]
pub fn constraint_error<S: Scalar, C: Constraint<S>>(
    particles: &Particles<S>,
    constraints: &[C],
) -> Option<(S, S)> {
    let (mut max_error, mut sum_sq, mut count) = (S::ZERO, S::ZERO, S::ZERO);
    for constraint in constraints {
        let [first, second] = constraint.bodies();
        let (Some(&first_x), Some(&second_x)) = (
            particles.positions().get(first.index()),
            particles.positions().get(second.index()),
        ) else {
            continue;
        };
        let error = constraint.evaluate(first_x, second_x).0.abs();
        if error > max_error {
            max_error = error;
        }
        sum_sq += error * error;
        // Counting in S avoids a usize-to-float cast; exact far beyond
        // any constraint count we'll have (2^24 in f32).
        count += S::ONE;
    }
    (count > S::ZERO).then(|| (max_error, (sum_sq / count).sqrt()))
}

/// Elastic energy stored in compliant constraints, `Σ ½ C² / α` over those
/// with `α > 0`, J (a spring of stiffness `1/α` stretched by `C`). Rigid
/// constraints store none. Missing bodies are skipped.
#[must_use]
pub fn constraint_potential<S: Scalar, C: Constraint<S>>(
    particles: &Particles<S>,
    constraints: &[C],
) -> S {
    let half = S::ONE / (S::ONE + S::ONE);
    constraints.iter().fold(S::ZERO, |total, constraint| {
        let alpha = constraint.compliance();
        let [first, second] = constraint.bodies();
        match (
            alpha > S::ZERO,
            particles.positions().get(first.index()),
            particles.positions().get(second.index()),
        ) {
            (true, Some(&first_x), Some(&second_x)) => {
                let (value, _) = constraint.evaluate(first_x, second_x);
                total + half * value * value / alpha
            }
            _ => total,
        }
    })
}

#[cfg(test)]
mod tests;
