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
mod tests {
    use super::{center_of_mass, gravity_potential, kinetic_energy, momentum, total_energy};
    use crate::PairwiseGravity;
    use crate::{Particles, Vec2};

    fn two_dynamic_one_static() -> Particles<f64> {
        let mut p = Particles::new();
        p.add(Vec2::ZERO, Vec2::new(3.0, 4.0), 2.0); // |v|² = 25
        p.add(Vec2::ZERO, Vec2::new(-1.0, 0.5), 4.0);
        p.add_static(Vec2::new(9.0, 9.0));
        p
    }

    #[test]
    fn momentum_sums_m_v_over_dynamic_particles() {
        // 2*(3,4) + 4*(-1,0.5) = (6,8) + (-4,2) = (2,10)
        assert_eq!(momentum(&two_dynamic_one_static()), Vec2::new(2.0, 10.0));
    }

    #[test]
    fn kinetic_energy_sums_half_m_v_squared() {
        // ½*2*25 + ½*4*1.25 = 25 + 2.5
        assert_eq!(kinetic_energy(&two_dynamic_one_static()), 27.5);
    }

    #[test]
    fn static_particles_contribute_nothing_even_if_moving() {
        // A static particle with velocity (set via vel_mut) has infinite mass
        // in principle; it must be skipped, not divided by zero.
        let mut p = Particles::<f64>::new();
        p.add_static(Vec2::ZERO);
        p.vel_mut()[0] = Vec2::new(1.0, 1.0);
        assert_eq!(momentum(&p), Vec2::ZERO);
        assert_eq!(kinetic_energy(&p), 0.0);
    }

    #[test]
    fn empty_is_zero() {
        let p = Particles::<f32>::new();
        assert_eq!(momentum(&p), Vec2::ZERO);
        assert_eq!(kinetic_energy(&p), 0.0);
    }

    #[test]
    fn center_of_mass_is_mass_weighted_and_skips_static() {
        let mut p = Particles::<f64>::new();
        p.add(Vec2::new(0.0, 0.0), Vec2::ZERO, 1.0);
        p.add(Vec2::new(4.0, 2.0), Vec2::ZERO, 3.0); // (0*1 + 4*3)/4 = 3
        p.add_static(Vec2::new(100.0, 100.0));
        assert_eq!(center_of_mass(&p), Some(Vec2::new(3.0, 1.5)));
    }

    #[test]
    fn center_of_mass_is_none_without_dynamic_particles() {
        let mut p = Particles::<f32>::new();
        assert_eq!(center_of_mass(&p), None);
        p.add_static(Vec2::new(1.0, 1.0));
        assert_eq!(center_of_mass(&p), None);
    }

    const G: f64 = 6.674_30e-11;

    #[test]
    fn potential_of_a_pair_is_the_softened_plummer_form() {
        let (m1, m2, d, eps) = (1.0e10, 3.0e10, 2.0, 0.1);
        let mut p = Particles::new();
        p.add(Vec2::ZERO, Vec2::ZERO, m1);
        p.add(Vec2::new(d, 0.0), Vec2::ZERO, m2);
        let u = gravity_potential(&p, &PairwiseGravity::new(G, eps));
        let expect = -G * m1 * m2 / (d * d + eps * eps).sqrt();
        assert!(
            (u - expect).abs() <= 1e-12 * expect.abs(),
            "{u} vs {expect}"
        );
    }

    #[test]
    fn potential_sums_every_pair_once() {
        // Three unit-ish bodies at the corners of a 3-4-5 triangle,
        // unsoftened: U = -G m² (1/3 + 1/4 + 1/5).
        let m = 1.0e10;
        let mut p = Particles::new();
        for (x, y) in [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)] {
            p.add(Vec2::new(x, y), Vec2::ZERO, m);
        }
        let u = gravity_potential(&p, &PairwiseGravity::new(G, 0.0));
        let expect = -G * m * m * (1.0 / 3.0 + 1.0 / 4.0 + 1.0 / 5.0);
        assert!(
            (u - expect).abs() <= 1e-12 * expect.abs(),
            "{u} vs {expect}"
        );
    }

    #[test]
    fn potential_skips_static_and_coincident_unsoftened_pairs() {
        let g = PairwiseGravity::new(G, 0.0);
        let mut p = Particles::new();
        p.add(Vec2::ZERO, Vec2::ZERO, 1.0e10);
        p.add_static(Vec2::new(1.0, 0.0));
        assert_eq!(gravity_potential(&p, &g), 0.0);
        p.add(Vec2::ZERO, Vec2::ZERO, 1.0e10); // coincident with body 0
        assert!(gravity_potential(&p, &g).is_finite());
        assert_eq!(gravity_potential(&p, &g), 0.0);
    }

    #[test]
    fn total_energy_is_kinetic_plus_potential() {
        let g = PairwiseGravity::new(G, 0.1);
        let p = two_dynamic_one_static();
        let sum = kinetic_energy(&p) + gravity_potential(&p, &g);
        assert_eq!(total_energy(&p, &g).to_bits(), sum.to_bits());
    }
}
