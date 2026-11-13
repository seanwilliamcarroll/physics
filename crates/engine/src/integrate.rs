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
    /// `x += v h + ½ a h²; a' = a(x, v + a h); v += ½ (a + a') h`. Second
    /// order; for forces of position alone also symplectic and
    /// time-reversible in exact arithmetic, and exact for constant
    /// acceleration.
    ///
    /// **The second evaluation sees a predicted velocity**, `v + a h`, not
    /// the old `v`: a force that reads velocity (the springs' dampers) needs
    /// the end of step's, which isn't known yet. With the old one, damping
    /// was off by `c (v' − v) ~ c a h` and Verlet fell to **first order**
    /// (measured, audit after A3: a damped spring 100× less accurate, the
    /// error halving, not quartering, with `h`); predicted, it's off by
    /// `O(h²)` and Verlet stays second order. Forces of position alone never
    /// read it, so for them nothing changes, bit for bit.
    ///
    /// Two force evaluations per substep, and the second is **not cached**
    /// for the next substep's first (they're at the same positions): beyond
    /// simplicity, it would be wrong, since
    /// positions change between substeps (the ground clamp runs after every
    /// one, and a drag moves its anchor between steps), and the next
    /// substep's velocities differ from the predicted ones.
    VelocityVerlet,
}

impl Integrator {
    /// Every integrator, for tests and side-by-side demos.
    pub const ALL: [Self; 3] = [
        Self::SymplecticEuler,
        Self::ExplicitEuler,
        Self::VelocityVerlet,
    ];

    /// Advances `p` by `h`. `acc`, `acc_next` and `vel_start` are scratch
    /// buffers owned by `World` (reused, so no allocation per substep); the
    /// last two are only used by velocity Verlet. Static particles
    /// (`inv_mass = 0`) never move, whatever their velocity.
    pub(crate) fn substep<S: Scalar>(
        self,
        forces: &[Box<dyn Force<S>>],
        p: &mut Particles<S>,
        scratch: VerletScratch<'_, S>,
        h: S,
    ) {
        let VerletScratch {
            acc,
            acc_next,
            vel_start,
        } = scratch;
        evaluate(forces, p, acc);
        match self {
            Self::SymplecticEuler => {
                kick(p, acc, h);
                drift(p, h);
            }
            Self::ExplicitEuler => {
                drift(p, h);
                kick(p, acc, h);
            }
            Self::VelocityVerlet => {
                // `h / 2` by dividing by ONE + ONE: exact, and no from_f64.
                let half_h = h / (S::ONE + S::ONE);
                let dynamic = p.inv_mass.iter().map(|&w| w != S::ZERO);
                for (((x, &v), &a), d) in p.pos.iter_mut().zip(&p.vel).zip(acc.iter()).zip(dynamic)
                {
                    if d {
                        *x += v * h + a * (h * half_h);
                    }
                }
                // The second evaluation at the predicted velocity `v + a h`
                // (see the variant); the start's kept for the update.
                vel_start.clear();
                vel_start.extend_from_slice(&p.vel);
                kick(p, acc, h);
                evaluate(forces, p, acc_next);
                let dynamic = p.inv_mass.iter().map(|&w| w != S::ZERO);
                let accs = acc.iter().zip(acc_next.iter());
                for (((v, &v0), (&a0, &a1)), d) in p
                    .vel
                    .iter_mut()
                    .zip(vel_start.iter())
                    .zip(accs)
                    .zip(dynamic)
                {
                    if d {
                        *v = v0 + (a0 + a1) * half_h;
                    }
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

/// Velocity Verlet's scratch, owned by `World`: this substep's
/// accelerations, the second evaluation's, and the start's velocities.
pub(crate) struct VerletScratch<'a, S> {
    pub(crate) acc: &'a mut Vec<Vec2<S>>,
    pub(crate) acc_next: &'a mut Vec<Vec2<S>>,
    pub(crate) vel_start: &'a mut Vec<Vec2<S>>,
}

/// `v += a h`, for dynamic particles only: a static particle
/// (`inv_mass = 0`) keeps its velocity whatever a force wrote for it.
pub(crate) fn kick<S: Scalar>(p: &mut Particles<S>, acc: &[Vec2<S>], h: S) {
    for ((v, &a), &w) in p.vel.iter_mut().zip(acc).zip(&p.inv_mass) {
        if w != S::ZERO {
            *v += a * h;
        }
    }
}

/// `x += (v + v_pseudo) h`, for dynamic particles only: the split impulse
/// solver's drift, by the real and the pseudo-velocity (only the real one
/// is kept). Its own path once, so a static moved here (audit after A3,
/// found by `a_static_with_a_velocity_stays_put`); now the same rule as
/// [`drift`].
pub(crate) fn drift_split<S: Scalar>(p: &mut Particles<S>, pseudo: &[Vec2<S>], h: S) {
    let moving = p.vel.iter().zip(pseudo).zip(&p.inv_mass);
    for (x, ((&v, &pv), &w)) in p.pos.iter_mut().zip(moving) {
        if w != S::ZERO {
            *x += (v + pv) * h;
        }
    }
}

/// `x += v h`, for dynamic particles only: a static one never moves,
/// whatever its velocity (`vel_mut` can set one), so "static" holds in every
/// stepper by construction, not by every force skipping statics.
pub(crate) fn drift<S: Scalar>(p: &mut Particles<S>, h: S) {
    for ((x, &v), &w) in p.pos.iter_mut().zip(&p.vel).zip(&p.inv_mass) {
        if w != S::ZERO {
            *x += v * h;
        }
    }
}
