//! Physical measurements of a [`Particles`] set, shared by tests and demo
//! plots so both measure exactly the same thing (`docs/04-testing.md`).
//!
//! Static particles (`inv_mass = 0`) are excluded: their mass is infinite in
//! principle. Mass is recovered as `1 / inv_mass`, a division per particle;
//! fine for once-per-frame readouts, which is what these are for.

use crate::{Particles, Scalar, Vec2};

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

#[cfg(test)]
mod tests {
    use super::{kinetic_energy, momentum};
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
}
