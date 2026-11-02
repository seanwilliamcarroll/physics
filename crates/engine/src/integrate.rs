//! Integrators: advance velocities and positions by one substep.

use crate::{Particles, Scalar, Vec2};

/// How a substep turns accelerations into motion.
///
/// An enum rather than a trait: the set is small and closed, and `World`
/// will need to know whether an integrator requires a second force pass
/// (velocity Verlet, M1).
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Integrator {
    /// `v += a h; x += v h`: velocity first, then position with the *new*
    /// velocity. First order, but symplectic: energy error stays bounded
    /// instead of drifting.
    SymplecticEuler,
}

impl Integrator {
    pub(crate) fn substep<S: Scalar>(self, p: &mut Particles<S>, acc: &[Vec2<S>], h: S) {
        match self {
            Self::SymplecticEuler => {
                for (v, &a) in p.vel.iter_mut().zip(acc) {
                    *v += a * h;
                }
                for (x, &v) in p.pos.iter_mut().zip(&p.vel) {
                    *x += v * h;
                }
            }
        }
    }
}
