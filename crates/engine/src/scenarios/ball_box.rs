//! [`ball_box`]: balls bouncing in a closed box under gravity (M6).

use core::num::NonZeroU32;

use math::convert::usize_to_f64;

use super::pendulum::pendulum_gravity;
use super::shared::{mass, radius};
use crate::rng::SplitMix64;
use crate::{ConfigError, Integrator, Restitution, Scalar, Solver, UnitVec2, Vec2, Wall, World};

/// Half the box's inside width, m: walls at `x = ±1`.
pub const BOX_HALF_WIDTH: f64 = 1.0;
/// The box's inside height, m: floor at `y = 0`, ceiling at `y = 2`.
pub const BOX_HEIGHT: f64 = 2.0;
/// Every ball's radius, m.
pub const BOX_BALL_RADIUS: f64 = 0.08;
/// Every ball's mass, kg.
pub const BOX_BALL_MASS: f64 = 1.0;
/// Initial velocity components are uniform in `±BOX_SPEED`, m/s.
pub const BOX_SPEED: f64 = 2.0;
/// Default ball count for [`ball_box`].
pub const BOX_BALLS: usize = 20;

/// The starting layout: a grid of `BOX_COLUMNS` × `BOX_ROWS` slots
/// `BOX_SLOT` m apart, the lowest row `BOX_FIRST_ROW` m up, each ball
/// nudged by up to `BOX_JITTER` m so the box doesn't start symmetric. Slots
/// leave 4 cm between balls, more than twice the jitter, so nothing starts
/// overlapping.
const BOX_COLUMNS: usize = 10;
const BOX_ROWS: usize = 6;
const BOX_SLOT: f64 = 0.2;
const BOX_FIRST_ROW: f64 = 0.3;
const BOX_JITTER: f64 = 0.01;

/// The most balls [`ball_box`] places (more are clamped to this).
pub const BOX_MAX_BALLS: usize = BOX_COLUMNS * BOX_ROWS;

/// `n` balls ([`BOX_BALL_RADIUS`], [`BOX_BALL_MASS`]) in a closed box (four
/// walls: floor, ceiling, sides) under [`pendulum_gravity`], with seeded
/// random velocities. Elastic ([`Restitution::ELASTIC`]); the page's
/// slider changes it. Walls push, so momentum isn't conserved here; the
/// showcase is energy (`docs/08-collision.md`).
///
/// `n` above [`BOX_MAX_BALLS`] is clamped (a slider at its end shouldn't
/// fail).
///
/// # Errors
/// [`ConfigError::InvalidMass`] or [`ConfigError::InvalidRadius`] if a
/// scene constant doesn't fit `S` (never, for `f32` and `f64`).
pub fn ball_box<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    n: usize,
    seed: u64,
) -> Result<World<S>, ConfigError> {
    let m = mass(BOX_BALL_MASS)?;
    let r = radius(BOX_BALL_RADIUS)?;
    let mut w = World::new(Integrator::SymplecticEuler, substeps);
    w.set_solver(solver);
    w.set_restitution(Restitution::ELASTIC);
    w.add_force(pendulum_gravity());
    let (half, top) = (S::from_f64(BOX_HALF_WIDTH), S::from_f64(BOX_HEIGHT));
    w.add_wall(Wall::through(Vec2::ZERO, UnitVec2::Y));
    w.add_wall(Wall::through(Vec2::new(S::ZERO, top), -UnitVec2::Y));
    w.add_wall(Wall::through(Vec2::new(-half, S::ZERO), UnitVec2::X));
    w.add_wall(Wall::through(Vec2::new(half, S::ZERO), -UnitVec2::X));
    let mut rng = SplitMix64::new(seed);
    for slot in 0..n.min(BOX_MAX_BALLS) {
        let (col, row) = (
            usize_to_f64(slot % BOX_COLUMNS),
            usize_to_f64(slot / BOX_COLUMNS),
        );
        let x = -BOX_HALF_WIDTH + BOX_SLOT * (col + 0.5) + rng.range(-BOX_JITTER, BOX_JITTER);
        let y = BOX_FIRST_ROW + BOX_SLOT * row + rng.range(-BOX_JITTER, BOX_JITTER);
        let v = (
            rng.range(-BOX_SPEED, BOX_SPEED),
            rng.range(-BOX_SPEED, BOX_SPEED),
        );
        w.particles.add_circle(
            Vec2::new(S::from_f64(x), S::from_f64(y)),
            Vec2::new(S::from_f64(v.0), S::from_f64(v.1)),
            m,
            r,
        );
    }
    Ok(w)
}
