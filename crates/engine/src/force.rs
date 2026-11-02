//! Force generators: anything that contributes acceleration each substep.

use crate::{Particles, Scalar, Vec2};

/// A source of acceleration.
///
/// Called once per substep through `dyn Force<S>`. The indirect call is
/// negligible next to the O(n) or O(n²) loop inside each impl
/// (`docs/02-core-types.md`, "Decision: `dyn Force<S>`").
pub trait Force<S: Scalar> {
    /// Adds this force's acceleration into `acc` (one entry per particle,
    /// zeroed by the world before the first force runs). Must add, never
    /// overwrite, so multiple forces combine.
    ///
    /// Accelerations, not forces: static particles (`inv_mass = 0`) are
    /// skipped without ever dividing by a mass.
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]);
}

/// The same acceleration `g` for every dynamic particle (e.g. `(0, -9.81)` m/s²).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct UniformGravity<S> {
    g: Vec2<S>,
}

impl<S: Scalar> UniformGravity<S> {
    #[must_use]
    pub const fn new(g: Vec2<S>) -> Self {
        Self { g }
    }
}

impl<S: Scalar> Force<S> for UniformGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        for (a, &w) in acc.iter_mut().zip(p.inv_mass()) {
            if w != S::ZERO {
                *a += self.g;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{Force, UniformGravity};
    use crate::{Particles, Vec2};

    #[test]
    fn uniform_gravity_accelerates_dynamic_particles_only() {
        let mut p = Particles::<f64>::new();
        p.add(Vec2::ZERO, Vec2::ZERO, 2.0);
        p.add_static(Vec2::ZERO);
        let mut acc = vec![Vec2::ZERO; p.len()];

        UniformGravity::new(Vec2::new(0.0, -9.81)).accumulate(&p, &mut acc);

        // Mass-independent: an acceleration, not a force.
        assert_eq!(acc, [Vec2::new(0.0, -9.81), Vec2::ZERO]);
    }

    #[test]
    fn forces_add_into_acc_rather_than_overwrite() {
        let mut p = Particles::<f64>::new();
        p.add(Vec2::ZERO, Vec2::ZERO, 1.0);
        let mut acc = vec![Vec2::new(1.0, 0.0)];

        UniformGravity::new(Vec2::new(0.0, -2.0)).accumulate(&p, &mut acc);

        assert_eq!(acc, [Vec2::new(1.0, -2.0)]);
    }
}
