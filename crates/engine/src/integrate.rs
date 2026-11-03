//! Integrators: advance velocities and positions by one substep.

use crate::{Force, Particles, Scalar, Vec2};

/// How a substep turns accelerations into motion.
///
/// An enum rather than a trait: the set is small and closed, and velocity
/// Verlet needs a second force evaluation, which `substep` handles here
/// rather than spreading across `World`.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Integrator {
    /// `v += a h; x += v h`: velocity first, then position with the *new*
    /// velocity. First order, but symplectic: energy error stays bounded
    /// instead of drifting.
    SymplecticEuler,
    /// `x += v h; v += a h`: position with the *old* velocity. First order
    /// and not symplectic: on an orbit, energy grows every step. The
    /// cautionary tale (M1's demo).
    ExplicitEuler,
    /// `x += v h + ½ a h²; a' = a(x); v += ½ (a + a') h`. Second order,
    /// symplectic, time-reversible in exact arithmetic; exact for constant
    /// acceleration. Two force evaluations per substep (no cache:
    /// `TASKS.md` M1 decision 2).
    VelocityVerlet,
}

impl Integrator {
    /// Every integrator, for tests and side-by-side demos.
    pub const ALL: [Self; 3] = [
        Self::SymplecticEuler,
        Self::ExplicitEuler,
        Self::VelocityVerlet,
    ];

    /// Advances `p` by `h`. `acc` and `acc_next` are scratch buffers owned
    /// by `World` (reused, so no allocation per substep); `acc_next` is only
    /// used by velocity Verlet.
    pub(crate) fn substep<S: Scalar>(
        self,
        forces: &[Box<dyn Force<S>>],
        p: &mut Particles<S>,
        acc: &mut Vec<Vec2<S>>,
        acc_next: &mut Vec<Vec2<S>>,
        h: S,
    ) {
        evaluate(forces, p, acc);
        match self {
            Self::SymplecticEuler => {
                kick(&mut p.vel, acc, h);
                drift(&mut p.pos, &p.vel, h);
            }
            Self::ExplicitEuler => {
                drift(&mut p.pos, &p.vel, h);
                kick(&mut p.vel, acc, h);
            }
            Self::VelocityVerlet => {
                // `h / 2` by dividing by ONE + ONE: exact, and no from_f64.
                let half_h = h / (S::ONE + S::ONE);
                for ((x, &v), &a) in p.pos.iter_mut().zip(&p.vel).zip(acc.iter()) {
                    *x += v * h + a * (h * half_h);
                }
                evaluate(forces, p, acc_next);
                for ((v, &a0), &a1) in p.vel.iter_mut().zip(acc.iter()).zip(acc_next.iter()) {
                    *v += (a0 + a1) * half_h;
                }
            }
        }
    }
}

/// Fills `acc` with every force's acceleration at the current positions.
pub(crate) fn evaluate<S: Scalar>(
    forces: &[Box<dyn Force<S>>],
    p: &Particles<S>,
    acc: &mut Vec<Vec2<S>>,
) {
    acc.clear();
    acc.resize(p.len(), Vec2::ZERO);
    for force in forces {
        force.accumulate(p, acc);
    }
}

/// `v += a h`.
pub(crate) fn kick<S: Scalar>(vel: &mut [Vec2<S>], acc: &[Vec2<S>], h: S) {
    for (v, &a) in vel.iter_mut().zip(acc) {
        *v += a * h;
    }
}

/// `x += v h`.
pub(crate) fn drift<S: Scalar>(pos: &mut [Vec2<S>], vel: &[Vec2<S>], h: S) {
    for (x, &v) in pos.iter_mut().zip(vel) {
        *x += v * h;
    }
}
