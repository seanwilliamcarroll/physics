//! Integrators: advance velocities and positions by one substep.

use crate::{Force, Particles, Scalar, Vec2};

/// How a substep turns accelerations into motion. An enum, not a trait: the
/// set is closed, and velocity Verlet's second force evaluation lives in
/// `substep`.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Integrator {
    /// `v += a h; x += v h`: first order, but symplectic: energy error
    /// stays bounded instead of drifting.
    SymplecticEuler,
    /// `x += v h; v += a h`: first order and not symplectic: on an orbit,
    /// energy grows every step.
    ExplicitEuler,
    /// `x += v h + ½ a h²; a' = a(x, v + a h); v += ½ (a + a') h`. Second
    /// order (symplectic for forces of position alone).
    ///
    /// The second evaluation sees a predicted velocity `v + a h`, not the
    /// old `v`: with the old one a velocity-reading force (the springs'
    /// dampers) is off by `~ c a h` and Verlet falls to first order. It is
    /// not cached for the next substep: positions change in between (ground
    /// clamp, drag anchor).
    VelocityVerlet,
}

impl Integrator {
    pub const ALL: [Self; 3] = [
        Self::SymplecticEuler,
        Self::ExplicitEuler,
        Self::VelocityVerlet,
    ];

    /// Advances `particles` by `time_step`. The scratch buffers are `World`'s,
    /// reused across substeps. Static particles never move.
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
                // Divide by ONE + ONE: exact, and no from_f64.
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
                // Second evaluation at the predicted velocity; keep the start's.
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

/// Velocity Verlet's scratch: both evaluations' accelerations and the start's velocities.
pub(crate) struct VerletScratch<'a, S> {
    pub(crate) acc: &'a mut Vec<Vec2<S>>,
    pub(crate) acc_next: &'a mut Vec<Vec2<S>>,
    pub(crate) vel_start: &'a mut Vec<Vec2<S>>,
}

/// `v += a h`, for dynamic particles only.
pub(crate) fn kick<S: Scalar>(particles: &mut Particles<S>, acc: &[Vec2<S>], time_step: S) {
    for ((vel, &accel), &inv_mass) in particles.vel.iter_mut().zip(acc).zip(&particles.inv_mass) {
        if inv_mass != S::ZERO {
            *vel += accel * time_step;
        }
    }
}

/// `x += (v + v_pseudo) h`, for dynamic particles only: the split impulse
/// solver's drift (only the real velocity is kept).
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

/// `x += v h`, for dynamic particles only: a static one never moves, even
/// with a velocity (`vel_mut` can set one).
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
