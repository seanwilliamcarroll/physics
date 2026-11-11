//! Physical measurements of a [`Particles`] set, shared by tests and demo
//! plots so both measure exactly the same thing (`docs/04-testing.md`).
//!
//! Static particles (`inv_mass = 0`) are excluded: their mass is infinite in
//! principle. Mass is recovered as `1 / inv_mass`, a division per particle;
//! fine for once-per-frame readouts, which is what these are for.

use crate::{Constraint, PairwiseGravity, Particles, Scalar, UniformGravity, Vec2};

/// Iterates `(velocity, inv_mass)` over dynamic particles only.
fn dynamic<S: Scalar>(p: &Particles<S>) -> impl Iterator<Item = (Vec2<S>, S)> + '_ {
    p.vel()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .map(|(&v, &w)| (v, w))
}

/// Total linear momentum `Σ m v`.
pub fn momentum<S: Scalar>(p: &Particles<S>) -> Vec2<S> {
    dynamic(p).fold(Vec2::ZERO, |acc, (v, w)| acc + v / w)
}

/// Total kinetic energy `Σ ½ m |v|²`, computed as `|v|² / (2 w)`.
#[must_use]
pub fn kinetic_energy<S: Scalar>(p: &Particles<S>) -> S {
    // `w + w` rather than `from_f64(2.0) * w`: exact, and no conversion.
    dynamic(p).fold(S::ZERO, |acc, (v, w)| acc + v.length_sq() / (w + w))
}

/// Rotational kinetic energy `Σ ½ I |ω|²`, `I = (2/5) m R²`, over the
/// balls (moving circles) in `p` with spins `spin` (`World::spin`, M7):
/// a table's energy is this plus [`kinetic_energy`].
#[must_use]
pub fn rotational_energy<S: Scalar>(p: &Particles<S>, spin: &[Vec2<S>]) -> S {
    let five = S::from_f64(5.0);
    p.inv_mass()
        .iter()
        .zip(p.radius())
        .zip(spin)
        .filter(|((w, r), _)| **w != S::ZERO && **r != S::ZERO)
        // ½ (2/5) m R² |ω|² = m R² |ω|² / 5.
        .fold(S::ZERO, |acc, ((w, r), om)| {
            acc + *r * *r * om.length_sq() / (five * *w)
        })
}

/// Mass-weighted mean position `Σ m x / Σ m` of the dynamic particles, or
/// `None` if there are none (total mass 0, so the mean is undefined).
///
/// Under internal forces alone (e.g. [`PairwiseGravity`])
/// it moves in a straight line at `momentum / total mass`.
#[must_use]
pub fn center_of_mass<S: Scalar>(p: &Particles<S>) -> Option<Vec2<S>> {
    let (weighted, total) = p
        .pos()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .fold((Vec2::ZERO, S::ZERO), |(sum_mx, sum_m), (&x, &w)| {
            (sum_mx + x / w, sum_m + S::ONE / w)
        });
    (total != S::ZERO).then(|| weighted / total)
}

/// Gravitational potential energy `Σ_{i<j} −G mᵢ mⱼ / √(|r|² + ε²)` of the
/// dynamic particles under `g`.
///
/// The softened (Plummer) potential is the one whose gradient *is*
/// [`PairwiseGravity`]'s softened force, so `kinetic_energy + this` is
/// exactly conserved by the true dynamics. A mismatched potential would
/// make an energy plot measure the mismatch instead of the integrator.
/// Like the force: static particles are excluded, and a coincident pair
/// with ε = 0 is skipped (its potential is −∞).
#[must_use]
pub fn gravity_potential<S: Scalar>(p: &Particles<S>, g: &PairwiseGravity<S>) -> S {
    let bodies: Vec<(Vec2<S>, S)> = p
        .pos()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .map(|(&x, &w)| (x, S::ONE / w))
        .collect();
    let mut total = S::ZERO;
    let mut rest = bodies.as_slice();
    while let Some((&(x_i, m_i), tail)) = rest.split_first() {
        for &(x_j, m_j) in tail {
            let d_sq = (x_j - x_i).length_sq() + g.softening_sq();
            if d_sq != S::ZERO {
                total -= g.g_const() * m_i * m_j / d_sq.sqrt();
            }
        }
        rest = tail;
    }
    total
}

/// [`kinetic_energy`] + [`gravity_potential`]: conserved by the exact
/// dynamics, so its drift measures an integrator's error.
#[must_use]
pub fn total_energy<S: Scalar>(p: &Particles<S>, g: &PairwiseGravity<S>) -> S {
    kinetic_energy(p) + gravity_potential(p, g)
}

/// Potential energy in uniform gravity, `Σ m (−g · x)`, J: zero at the
/// origin, so `m g h` with `h` the height above it. With [`kinetic_energy`],
/// conserved by a frictionless pendulum: the M3 energy plot.
#[must_use]
pub fn uniform_gravity_potential<S: Scalar>(p: &Particles<S>, g: &UniformGravity<S>) -> S {
    p.pos()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .fold(S::ZERO, |acc, (&x, &w)| acc - g.g().dot(x) / w)
}

/// Max and RMS of `|C|` over `constraints`, in the constraint's units (m
/// for a rod: how far it is stretched or compressed). `None` with no
/// constraints. A constraint whose bodies aren't in `p` is skipped (worlds
/// check ids when constraints are added, so that means a mismatched `p`).
#[must_use]
pub fn constraint_error<S: Scalar, C: Constraint<S>>(
    p: &Particles<S>,
    constraints: &[C],
) -> Option<(S, S)> {
    let (mut max, mut sum_sq, mut count) = (S::ZERO, S::ZERO, S::ZERO);
    for c in constraints {
        let [a, b] = c.bodies();
        let (Some(&xa), Some(&xb)) = (p.pos().get(a.index()), p.pos().get(b.index())) else {
            continue;
        };
        let err = c.evaluate(xa, xb).0.abs();
        if err > max {
            max = err;
        }
        sum_sq += err * err;
        // Counting in S avoids a usize-to-float cast; exact far beyond
        // any constraint count we'll have (2^24 in f32).
        count += S::ONE;
    }
    (count > S::ZERO).then(|| (max, (sum_sq / count).sqrt()))
}

/// Elastic energy stored in compliant constraints, `Σ ½ C² / α` over those
/// with `α > 0`, J (a spring of stiffness `1/α` stretched by `C`). Rigid
/// constraints store none: `C` is held at 0. Constraints whose bodies
/// aren't in `p` are skipped.
#[must_use]
pub fn constraint_potential<S: Scalar, C: Constraint<S>>(p: &Particles<S>, constraints: &[C]) -> S {
    let half = S::ONE / (S::ONE + S::ONE);
    constraints.iter().fold(S::ZERO, |acc, c| {
        let alpha = c.compliance();
        let [a, b] = c.bodies();
        match (
            alpha > S::ZERO,
            p.pos().get(a.index()),
            p.pos().get(b.index()),
        ) {
            (true, Some(&xa), Some(&xb)) => {
                let (value, _) = c.evaluate(xa, xb);
                acc + half * value * value / alpha
            }
            _ => acc,
        }
    })
}

#[cfg(test)]
mod tests;
