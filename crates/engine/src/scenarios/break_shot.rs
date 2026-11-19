//! [`break_shot`]: a cue ball into a racked triangle, in free space.

use core::num::NonZeroU32;

use math::convert::usize_to_f64;

use super::shared::{mass, radius};
use crate::{ConfigError, Integrator, Restitution, Scalar, Solver, Vec2, World};

/// Every ball's radius, m.
pub const BREAK_BALL_RADIUS: f64 = 0.05;
/// Every ball's mass, kg.
pub const BREAK_BALL_MASS: f64 = 1.0;
/// The cue ball's speed, m/s (+x).
pub const BREAK_SPEED: f64 = 5.0;
/// Rows of the rack: 1 + 2 + 3 + 4 = 10 balls, apex toward the cue ball.
pub const BREAK_ROWS: usize = 4;
/// The cue ball starts this far left of the apex ball's center, m.
pub const BREAK_CUE_DISTANCE: f64 = 0.5;

/// A cue ball at [`BREAK_SPEED`] into a triangle of [`BREAK_ROWS`] rows of
/// balls `gap` m apart (0: touching), with no gravity and no walls: nothing
/// outside pushes, so total momentum is conserved (to rounding) through
/// every collision (`docs/08-collision.md`). Elastic. Touching, the cue
/// ball's impact meets simultaneous contacts; with gaps, a ball meets two
/// at once.
///
/// # Errors
/// [`ConfigError::InvalidMass`] or [`ConfigError::InvalidRadius`] if a
/// scenario constant doesn't fit `S` (never, for `f32` and `f64`).
pub fn break_shot<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    gap: f64,
) -> Result<World<S>, ConfigError> {
    let ball_mass = mass(BREAK_BALL_MASS)?;
    let ball_radius = radius(BREAK_BALL_RADIUS)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.set_solver(solver);
    world.set_restitution(Restitution::ELASTIC);
    world.particles.add_circle(
        Vec2::new(S::from_f64(-BREAK_CUE_DISTANCE), S::ZERO),
        Vec2::new(S::from_f64(BREAK_SPEED), S::ZERO),
        ball_mass,
        ball_radius,
    );
    // Neighbors form equilateral triangles of side `2r + gap`: balls that
    // far apart along y, rows `√3 (r + gap/2)` apart along x. `sqrt` is
    // correctly rounded, so this is deterministic on every platform.
    let side = 2.0 * BREAK_BALL_RADIUS + gap;
    let row_step = 3.0_f64.sqrt() * side / 2.0;
    for row in 0..BREAK_ROWS {
        for position_in_row in 0..=row {
            let (x, y) = (
                usize_to_f64(row) * row_step,
                (usize_to_f64(position_in_row) - usize_to_f64(row) / 2.0) * side,
            );
            world.particles.add_circle(
                Vec2::new(S::from_f64(x), S::from_f64(y)),
                Vec2::ZERO,
                ball_mass,
                ball_radius,
            );
        }
    }
    Ok(world)
}

#[cfg(test)]
mod tests;
