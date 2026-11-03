//! [`double_pendulum`]: two rods end to end, the chaos demo (M4).

use core::num::NonZeroU32;

use super::pendulum::pendulum_gravity;
use super::shared::mass;
use crate::{ConfigError, DistanceConstraint, Integrator, Scalar, Solver, Vec2, World};

/// Length of each rod of [`double_pendulum`], m: the
/// [`PENDULUM_LENGTH`](super::PENDULUM_LENGTH) of the single pendulum,
/// so the two scenes share a scale.
pub const DOUBLE_PENDULUM_LENGTH: f64 = 1.0;

/// Mass of each bob of [`double_pendulum`], kg: the single pendulum's
/// [`PENDULUM_MASS`](super::PENDULUM_MASS). Equal masses and lengths are
/// the textbook double pendulum, chaotic when released horizontal.
pub const DOUBLE_PENDULUM_MASS: f64 = 1.0;

/// Where [`double_pendulum`] is released from (both rods in a line, at
/// rest). Fixed starts rather than an angle: an arbitrary angle needs
/// `sin`/`cos`, whose last bits differ by platform, and the golden hashes
/// must match on wasm; both starts here need only `sqrt`.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum DoublePendulumStart {
    /// Both rods level with the pin (+x): the textbook start. Two copies
    /// 1e-9 m apart take 23.8 s to separate by 1 cm (M4.4, impulse with
    /// 20 substeps): chaotic, but slow to show.
    Horizontal,
    /// Both rods at 135° from straight down (up and to the right, 45°
    /// above level): more energy, so faster divergence, 11.1 s for the same
    /// 1e-9 m. The demo's default. Direction `(√½, √½)`.
    Raised,
}

/// A double pendulum: a static pin at the origin, a bob of
/// [`DOUBLE_PENDULUM_MASS`] at the end of each of two rigid rods of
/// [`DOUBLE_PENDULUM_LENGTH`], laid out in a line from `start` and released
/// from rest under [`pendulum_gravity`]. Stepped by `solver` with
/// `substeps` per step.
///
/// `offset` (m) moves the tip's starting position perpendicular to the
/// rods (counterclockwise), so the second rod starts at an angle of about
/// `offset / L` to the first and its rest length becomes `√(L² + offset²)`
/// (`L` to first order). Two copies `1e-9` apart are the chaos demo.
/// Divergence grows exponentially, so 1e-9 m → 1 cm takes about 16
/// e-foldings (ln 10⁷): seconds-long, whatever the start; on a log plot the
/// growth is visible from t = 0.
/// Not checked: a non-finite offset gives a non-finite world, as a
/// non-finite `speed_ratio` does for [`orbit`](super::orbit).
///
/// # Errors
/// Only if the fixed configuration were invalid (it isn't).
pub fn double_pendulum<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    start: DoublePendulumStart,
    offset: f64,
) -> Result<World<S>, ConfigError> {
    let l = DOUBLE_PENDULUM_LENGTH;
    let m = mass(DOUBLE_PENDULUM_MASS)?;
    let vec = |x: f64, y: f64| Vec2::new(S::from_f64(x), S::from_f64(y));
    let mut w = World::new(Integrator::SymplecticEuler, substeps);
    w.add_force(pendulum_gravity());
    let pin = w.particles.add_static(Vec2::ZERO);
    // Unit direction of the rods, and its counterclockwise perpendicular.
    let (dx, dy) = match start {
        DoublePendulumStart::Horizontal => (1.0, 0.0),
        DoublePendulumStart::Raised => {
            let h = 0.5_f64.sqrt();
            (h, h)
        }
    };
    let elbow = w.particles.add(vec(l * dx, l * dy), Vec2::ZERO, m);
    let tip = w.particles.add(
        vec(2.0 * l * dx - offset * dy, 2.0 * l * dy + offset * dx),
        Vec2::ZERO,
        m,
    );
    for (a, b) in [(pin, elbow), (elbow, tip)] {
        let rod =
            DistanceConstraint::between(&w.particles, a, b).ok_or(ConfigError::UnknownParticle)?;
        w.add_constraint(rod)?;
    }
    w.set_solver(solver);
    Ok(w)
}

#[cfg(test)]
mod tests;
