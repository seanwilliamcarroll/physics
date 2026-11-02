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

/// The same acceleration `g` for every dynamic particle, e.g.
/// `(0, -STANDARD_GRAVITY)` m/s² (see [`crate::scenarios::STANDARD_GRAVITY`]).
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

/// Newtonian gravity between every pair of dynamic particles, softened:
///
/// ```text
/// F_ij = G m_i m_j r / (|r|² + ε²)^(3/2),   r = x_j - x_i
/// ```
///
/// Softening (Plummer) caps the force at short range: without it two close
/// bodies get an enormous kick in one step and fling apart
/// (`docs/02-core-types.md`). O(n²): each pair once.
///
/// Static particles (`inv_mass = 0`) have no defined mass, so they neither
/// pull nor are pulled.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct PairwiseGravity<S> {
    g_const: S,
    /// ε², stored squared: the force only ever uses ε², and squaring makes
    /// a negative ε harmless (`docs/type-invariants.md`).
    softening_sq: S,
}

impl<S: Scalar> PairwiseGravity<S> {
    /// `g_const`: the gravitational constant in the scene's units (SI:
    /// [`crate::scenarios::GRAVITATIONAL_CONSTANT`]). `softening`: ε in
    /// meters; 0 is allowed (pure 1/r², what M2 demonstrates blowing up).
    #[must_use]
    pub fn new(g_const: S, softening: S) -> Self {
        Self {
            g_const,
            softening_sq: softening * softening,
        }
    }

    #[must_use]
    pub const fn g_const(&self) -> S {
        self.g_const
    }

    #[must_use]
    pub const fn softening_sq(&self) -> S {
        self.softening_sq
    }
}

impl<S: Scalar> Force<S> for PairwiseGravity<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        // Masses once per call: n divisions here instead of n² in the pair
        // loop. Static particles get mass 0, so they exert no pull.
        let bodies: Vec<(Vec2<S>, S, S)> = p
            .pos()
            .iter()
            .zip(p.inv_mass())
            .map(|(&x, &w)| (x, if w == S::ZERO { S::ZERO } else { S::ONE / w }, w))
            .collect();

        // Each pair once (i < j), without indexing: take the first body,
        // pair it with every later one, continue with the rest.
        // `mem::take` moves the slice out so its tail can replace it.
        let mut acc_rest = acc;
        let mut body_rest = bodies.as_slice();
        while let (Some((a_i, acc_tail)), Some((&(x_i, m_i, w_i), body_tail))) = (
            core::mem::take(&mut acc_rest).split_first_mut(),
            body_rest.split_first(),
        ) {
            for (a_j, &(x_j, m_j, w_j)) in acc_tail.iter_mut().zip(body_tail) {
                let r = x_j - x_i;
                let d_sq = r.length_sq() + self.softening_sq;
                if d_sq == S::ZERO {
                    // Coincident and unsoftened: no direction; skip, not 0/0.
                    continue;
                }
                // One force vector per pair, applied +/-: equal and
                // opposite by construction. Accelerations are F * w, so a
                // static body (w = 0) isn't moved.
                let f = r * (self.g_const * m_i * m_j / (d_sq * d_sq.sqrt()));
                *a_i += f * w_i;
                *a_j -= f * w_j;
            }
            acc_rest = acc_tail;
            body_rest = body_tail;
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

    mod pairwise {
        use super::super::{Force, PairwiseGravity};
        use crate::{Particles, Vec2};

        const G: f64 = 6.674_30e-11;

        fn accel(p: &Particles<f64>, g: &PairwiseGravity<f64>) -> Vec<Vec2<f64>> {
            let mut acc = vec![Vec2::ZERO; p.len()];
            g.accumulate(p, &mut acc);
            acc
        }

        #[test]
        fn two_bodies_feel_equal_and_opposite_forces() {
            let (m1, m2, d, eps) = (1.0e10, 3.0e10, 2.0, 0.1);
            let mut p = Particles::new();
            p.add(Vec2::ZERO, Vec2::ZERO, m1);
            p.add(Vec2::new(d, 0.0), Vec2::ZERO, m2);
            let a = accel(&p, &PairwiseGravity::new(G, eps));

            // Newton's third law: m1 a1 = -m2 a2.
            let (f1, f2) = (a[0] * m1, a[1] * m2);
            assert!(
                (f1 + f2).length() <= 1e-12 * f1.length(),
                "{f1:?} vs {f2:?}"
            );
            // Magnitude of the softened (Plummer) force on body 1, toward body 2.
            let expect = G * m2 * d / (d * d + eps * eps).powf(1.5);
            assert!(
                (a[0].x - expect).abs() <= 1e-12 * expect,
                "{} vs {expect}",
                a[0].x
            );
            assert_eq!(a[0].y, 0.0);
        }

        #[test]
        fn negative_softening_acts_like_positive() {
            // Stored as eps^2, so the sign can't matter.
            let mut p = Particles::new();
            p.add(Vec2::ZERO, Vec2::ZERO, 1.0e10);
            p.add(Vec2::new(1.0, 0.0), Vec2::ZERO, 1.0e10);
            assert_eq!(
                accel(&p, &PairwiseGravity::new(G, -0.2)),
                accel(&p, &PairwiseGravity::new(G, 0.2))
            );
        }

        #[test]
        fn static_particles_neither_pull_nor_are_pulled() {
            let mut p = Particles::new();
            p.add(Vec2::ZERO, Vec2::ZERO, 1.0e10);
            p.add_static(Vec2::new(1.0, 0.0));
            assert_eq!(
                accel(&p, &PairwiseGravity::new(G, 0.1)),
                [Vec2::ZERO, Vec2::ZERO]
            );
        }

        #[test]
        fn coincident_bodies_without_softening_stay_finite() {
            // eps = 0 (allowed: M2 demos it) and r = 0: no direction, so the
            // pair is skipped rather than producing 0/0 = NaN.
            let mut p = Particles::new();
            p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, 1.0e10);
            p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, 1.0e10);
            assert_eq!(
                accel(&p, &PairwiseGravity::new(G, 0.0)),
                [Vec2::ZERO, Vec2::ZERO]
            );
        }

        #[test]
        fn each_pair_counts_once_and_adds_into_acc() {
            // Three bodies on a line: the middle one feels opposite pulls
            // that cancel; existing acc contents are kept (added to).
            let mut p = Particles::new();
            for x in [-1.0, 0.0, 1.0] {
                p.add(Vec2::new(x, 0.0), Vec2::ZERO, 1.0e10);
            }
            let mut acc: Vec<Vec2<f64>> = vec![Vec2::new(0.0, 5.0); 3];
            PairwiseGravity::new(G, 0.0).accumulate(&p, &mut acc);
            assert!(acc[1].x.abs() <= 1e-15, "{:?}", acc[1]);
            // Untouched bit for bit: pairwise gravity along x adds nothing to y.
            assert!(acc.iter().all(|a| a.y.to_bits() == 5.0_f64.to_bits()));
            assert!(acc[0].x > 0.0 && acc[2].x < 0.0);
        }
    }
}
