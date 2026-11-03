//! Physical measurements of a [`Particles`] set, shared by tests and demo
//! plots so both measure exactly the same thing (`docs/04-testing.md`).
//!
//! Static particles (`inv_mass = 0`) are excluded: their mass is infinite in
//! principle. Mass is recovered as `1 / inv_mass`, a division per particle;
//! fine for once-per-frame readouts, which is what these are for.

use crate::{PairwiseGravity, Particles, Scalar, Vec2};

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

/// Mass-weighted mean position `Σ m x / Σ m` of the dynamic particles, or
/// `None` if there are none (total mass 0, so the mean is undefined).
///
/// Under internal forces alone (e.g. [`PairwiseGravity`](crate::PairwiseGravity))
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

#[cfg(test)]
mod tests;
