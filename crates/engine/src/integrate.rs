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
    /// cautionary tale.
    ExplicitEuler,
    /// `x += v h + ½ a h²; a' = a(x, v + a h); v += ½ (a + a') h`. Second
    /// order; for forces of position alone also symplectic and
    /// time-reversible in exact arithmetic, and exact for constant
    /// acceleration.
    ///
    /// **The second evaluation sees a predicted velocity**, `v + a h`, not
    /// the old `v`: a force that reads velocity (the springs' dampers) needs
    /// the end of step's, which isn't known yet. With the old one, damping
    /// is off by `c (v' − v) ~ c a h` and Verlet falls to **first order**
    /// (a damped spring 100× less accurate, the error halving, not
    /// quartering, with `h`); predicted, it's off by `O(h²)`. Forces of
    /// position alone never read it.
    ///
    /// Two force evaluations per substep, and the second is **not cached**
    /// for the next substep's first: positions change between substeps (the
    /// ground clamp runs after every one, and a drag moves its anchor), and
    /// the next substep's velocities differ from the predicted ones.
    VelocityVerlet,
}

impl Integrator {
    /// Every integrator, for tests and side-by-side demos.
    pub const ALL: [Self; 3] = [
        Self::SymplecticEuler,
        Self::ExplicitEuler,
        Self::VelocityVerlet,
    ];

    /// Advances `particles` by `time_step`. The scratch buffers are owned by
    /// `World` (reused, so no allocation per substep); `acc_next` and
    /// `vel_start` are only used by velocity Verlet. Static particles
    /// (`inv_mass = 0`) never move, whatever their velocity.
    pub(crate) fn substep<S: Scalar>(
        self,
        forces: &[Box<dyn Force<S>>],
        particles: &mut Particles<S>,
        scratch: VerletScratch<'_, S>,
        time_step: S,
    ) {
        let VerletScratch {
            acc,
            acc_next,
            vel_start,
        } = scratch;
        evaluate(forces, particles, acc);
        match self {
            Self::SymplecticEuler => {
                kick(particles, acc, time_step);
                drift(particles, time_step);
            }
            Self::ExplicitEuler => {
                drift(particles, time_step);
                kick(particles, acc, time_step);
            }
            Self::VelocityVerlet => {
                // Half the step by dividing by ONE + ONE: exact, and no from_f64.
                let half_step = time_step / (S::ONE + S::ONE);
                let dynamic = particles
                    .inv_mass
                    .iter()
                    .map(|&inv_mass| inv_mass != S::ZERO);
                for (((x, &vel), &accel), is_dynamic) in particles
                    .pos
                    .iter_mut()
                    .zip(&particles.vel)
                    .zip(acc.iter())
                    .zip(dynamic)
                {
                    if is_dynamic {
                        *x += vel * time_step + accel * (time_step * half_step);
                    }
                }
                // The second evaluation is at the predicted velocity
                // `v + a h` (see the variant); the start's kept for the
                // update.
                vel_start.clear();
                vel_start.extend_from_slice(&particles.vel);
                kick(particles, acc, time_step);
                evaluate(forces, particles, acc_next);
                let dynamic = particles
                    .inv_mass
                    .iter()
                    .map(|&inv_mass| inv_mass != S::ZERO);
                let accelerations = acc.iter().zip(acc_next.iter());
                for (((vel, &start_vel), (&accel_start, &accel_end)), is_dynamic) in particles
                    .vel
                    .iter_mut()
                    .zip(vel_start.iter())
                    .zip(accelerations)
                    .zip(dynamic)
                {
                    if is_dynamic {
                        *vel = start_vel + (accel_start + accel_end) * half_step;
                    }
                }
            }
        }
    }
}

/// Fills `acc` with every force's acceleration at the current positions.
pub(crate) fn evaluate<S: Scalar>(
    forces: &[Box<dyn Force<S>>],
    particles: &Particles<S>,
    acc: &mut Vec<Vec2<S>>,
) {
    acc.clear();
    acc.resize(particles.len(), Vec2::ZERO);
    for force in forces {
        force.accumulate(particles, acc);
    }
}

/// Velocity Verlet's scratch, owned by `World`: this substep's
/// accelerations, the second evaluation's, and the start's velocities.
pub(crate) struct VerletScratch<'a, S> {
    pub(crate) acc: &'a mut Vec<Vec2<S>>,
    pub(crate) acc_next: &'a mut Vec<Vec2<S>>,
    pub(crate) vel_start: &'a mut Vec<Vec2<S>>,
}

/// `v += a h`, for dynamic particles only: a static particle
/// (`inv_mass = 0`) keeps its velocity whatever a force wrote for it.
pub(crate) fn kick<S: Scalar>(particles: &mut Particles<S>, acc: &[Vec2<S>], time_step: S) {
    for ((vel, &accel), &inv_mass) in particles.vel.iter_mut().zip(acc).zip(&particles.inv_mass) {
        if inv_mass != S::ZERO {
            *vel += accel * time_step;
        }
    }
}

/// `x += (v + v_pseudo) h`, for dynamic particles only: the split impulse
/// solver's drift, by the real and the pseudo-velocity (only the real one
/// is kept). Same rule as [`drift`]: a static never moves.
pub(crate) fn drift_split<S: Scalar>(
    particles: &mut Particles<S>,
    pseudo: &[Vec2<S>],
    time_step: S,
) {
    let moving = particles.vel.iter().zip(pseudo).zip(&particles.inv_mass);
    for (x, ((&vel, &pseudo_vel), &inv_mass)) in particles.pos.iter_mut().zip(moving) {
        if inv_mass != S::ZERO {
            *x += (vel + pseudo_vel) * time_step;
        }
    }
}

/// `x += v h`, for dynamic particles only: a static one never moves,
/// whatever its velocity (`vel_mut` can set one), so "static" holds in every
/// stepper by construction, not by every force skipping statics.
pub(crate) fn drift<S: Scalar>(particles: &mut Particles<S>, time_step: S) {
    for ((x, &vel), &inv_mass) in particles
        .pos
        .iter_mut()
        .zip(&particles.vel)
        .zip(&particles.inv_mass)
    {
        if inv_mass != S::ZERO {
            *x += vel * time_step;
        }
    }
}
