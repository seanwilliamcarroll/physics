//! [`pool_table`], [`pool_rack`], [`pool_break`]: a 9-ft pool table
//! (`docs/09-billiards.md`). Seen from above: no in-plane gravity; `g`
//! enters through the cloth.

use core::num::NonZeroU32;

use super::shared::{mass, radius};
use crate::collision::{Pocket, Segment};
use crate::{
    ConfigError, Integrator, ParticleId, Restitution, Scalar, Solver, Table, UnitVec2, Vec2, World,
};

/// The playing surface inside the cushion noses, m (WPA §5): x along the
/// length, centred on the origin.
pub const POOL_LENGTH: f64 = 2.54;
pub const POOL_WIDTH: f64 = 1.27;
/// A ball: 57.15 mm across (WPA §16), 0.17 kg (the top of WPA's 156–170 g,
/// our choice).
pub const POOL_BALL_RADIUS: f64 = 0.028_575;
pub const POOL_BALL_MASS: f64 = 0.17;
/// The cloth (`docs/09-billiards.md`: Alciatore, via secondary sources).
pub const POOL_MU_SLIDE: f64 = 0.2;
pub const POOL_MU_ROLL: f64 = 0.01;
pub const POOL_G: f64 = 9.81;
/// Restitution, ball–ball (Alciatore) and ball–cushion (our choice in a
/// 0.7–0.98 spread).
pub const POOL_E_BALL: f64 = 0.94;
pub const POOL_E_CUSHION: f64 = 0.8;
/// Pocket mouths, lip to lip: the middle of WPA §9's ranges (corner
/// 114.3–117.5 mm, side 127.0–130.2 mm).
pub const POOL_CORNER_MOUTH: f64 = 0.1159;
pub const POOL_SIDE_MOUTH: f64 = 0.1286;
/// The fastest cue ball, m/s (our choice: above a hard break).
pub const POOL_MAX_SPEED: f64 = 12.0;
/// The cue ball: [`pool_rack`]'s first particle.
pub const POOL_CUE: ParticleId = ParticleId(0);
/// Ball numbers by rack position (apex first, row by row): the 1 at the
/// apex, the 8 in the middle of the third row, a solid and a stripe in
/// the back corners (8-ball). Particle `k + 1` is `POOL_RACK[k]`.
pub const POOL_RACK: [u8; 15] = [1, 9, 2, 10, 8, 3, 11, 4, 12, 6, 7, 14, 5, 13, 15];

/// The jaws' cut angles, degrees (WPA §9): the cushion face turns this far
/// short of straight on into the pocket.
const CORNER_CUT_DEG: f64 = 142.0;
const SIDE_CUT_DEG: f64 = 104.0;
/// Each jaw's length, m (our choice: deep enough to lead a ball into the
/// pocket's sensor).
const JAW_LENGTH: f64 = 0.06;

const HEAD_SPOT: (f64, f64) = (-POOL_LENGTH / 4.0, 0.0);
const FOOT_SPOT: (f64, f64) = (POOL_LENGTH / 4.0, 0.0);

/// The empty table: the cloth, 6 rails and 12 jaws as segments, 6
/// pockets. Ball–ball restitution is the world's; cushions carry theirs.
///
/// # Errors
/// [`ConfigError::InvalidTable`] if a constant doesn't fit `S` (never, for
/// `f32` and `f64`).
pub fn pool_table<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
) -> Result<World<S>, ConfigError> {
    let to_scalar = S::from_f64;
    let table = Table::new(
        to_scalar(POOL_MU_SLIDE),
        to_scalar(POOL_MU_ROLL),
        to_scalar(POOL_G),
    )
    .ok_or(ConfigError::InvalidTable)?;
    let ball_restitution =
        Restitution::new(to_scalar(POOL_E_BALL)).ok_or(ConfigError::InvalidTable)?;
    let cushion_restitution =
        Restitution::new(to_scalar(POOL_E_CUSHION)).ok_or(ConfigError::InvalidTable)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.set_solver(solver);
    world.set_restitution(ball_restitution);
    world.set_table(Some(table));
    let (half_length, half_width) = (POOL_LENGTH / 2.0, POOL_WIDTH / 2.0);
    // A corner mouth is a 45° line across the corner, `POOL_CORNER_MOUTH`
    // long: its points sit `mouth / √2` back along each rail.
    let corner_setback = POOL_CORNER_MOUTH / 2.0_f64.sqrt();
    let half_side_mouth = POOL_SIDE_MOUTH / 2.0;
    let corner_turn = (180.0 - CORNER_CUT_DEG).to_radians();
    let side_turn = (180.0 - SIDE_CUT_DEG).to_radians();
    let mut add_segment = |from: (f64, f64), to: (f64, f64)| {
        world.add_segment(Segment::new(
            Vec2::new(to_scalar(from.0), to_scalar(from.1)),
            Vec2::new(to_scalar(to.0), to_scalar(to.1)),
            cushion_restitution,
        ));
    };
    for sign_y in [1.0, -1.0] {
        // Long rails, either side of the side pocket.
        add_segment(
            (-half_length + corner_setback, sign_y * half_width),
            (-half_side_mouth, sign_y * half_width),
        );
        add_segment(
            (half_side_mouth, sign_y * half_width),
            (half_length - corner_setback, sign_y * half_width),
        );
        for sign_x in [1.0, -1.0] {
            // A jaw leaves its point turned outward from the rail by
            // 180° − cut, toward the pocket.
            let (turn_sin, turn_cos) = (corner_turn.sin(), corner_turn.cos());
            add_segment(
                (sign_x * (half_length - corner_setback), sign_y * half_width),
                (
                    sign_x * (half_length - corner_setback + turn_cos * JAW_LENGTH),
                    sign_y * (half_width + turn_sin * JAW_LENGTH),
                ),
            );
            add_segment(
                (sign_x * half_length, sign_y * (half_width - corner_setback)),
                (
                    sign_x * (half_length + turn_sin * JAW_LENGTH),
                    sign_y * (half_width - corner_setback + turn_cos * JAW_LENGTH),
                ),
            );
            let (turn_sin, turn_cos) = (side_turn.sin(), side_turn.cos());
            add_segment(
                (sign_x * half_side_mouth, sign_y * half_width),
                (
                    sign_x * (half_side_mouth - turn_cos * JAW_LENGTH),
                    sign_y * (half_width + turn_sin * JAW_LENGTH),
                ),
            );
        }
    }
    for sign_x in [1.0, -1.0] {
        // Short rails.
        add_segment(
            (sign_x * half_length, -half_width + corner_setback),
            (sign_x * half_length, half_width - corner_setback),
        );
    }
    // Pockets (our choice): a corner's sensor centred on the table's
    // corner, reaching the mouth's midpoint; a side's a ball's radius
    // behind the mouth, as wide as it.
    let mut add_pocket = |x: f64, y: f64, pocket_radius: f64| -> Result<(), ConfigError> {
        let pocket = Pocket::new(
            Vec2::new(to_scalar(x), to_scalar(y)),
            to_scalar(pocket_radius),
        )
        .ok_or(ConfigError::InvalidTable)?;
        world.add_pocket(pocket);
        Ok(())
    };
    for sign_y in [1.0, -1.0] {
        add_pocket(
            -half_length,
            sign_y * half_width,
            corner_setback / 2.0_f64.sqrt(),
        )?;
        add_pocket(
            0.0,
            sign_y * (half_width + POOL_BALL_RADIUS),
            half_side_mouth,
        )?;
        add_pocket(
            half_length,
            sign_y * half_width,
            corner_setback / 2.0_f64.sqrt(),
        )?;
    }
    Ok(world)
}

/// The table with the cue ball (particle 0) on the head spot and 15 balls
/// racked, touching, apex on the foot spot (particles 1–15, numbered as
/// [`POOL_RACK`]), all at rest.
///
/// # Errors
/// As [`pool_table`]; [`ConfigError::InvalidMass`] or
/// [`ConfigError::InvalidRadius`] likewise.
pub fn pool_rack<S: Scalar>(solver: Solver, substeps: NonZeroU32) -> Result<World<S>, ConfigError> {
    let mut world = pool_table(solver, substeps)?;
    let (ball_mass, ball_radius) = (mass(POOL_BALL_MASS)?, radius(POOL_BALL_RADIUS)?);
    let at = |x: f64, y: f64| Vec2::new(S::from_f64(x), S::from_f64(y));
    world.add_circle(
        at(HEAD_SPOT.0, HEAD_SPOT.1),
        Vec2::ZERO,
        ball_mass,
        ball_radius,
    );
    // Rows a ball's diameter apart along y, √3 R apart along x.
    let diameter = 2.0 * POOL_BALL_RADIUS;
    let row_step = 3.0_f64.sqrt() * POOL_BALL_RADIUS;
    for row in 0..5_u8 {
        for position_in_row in 0..=row {
            let (row, position_in_row) = (f64::from(row), f64::from(position_in_row));
            world.add_circle(
                at(
                    FOOT_SPOT.0 + row * row_step,
                    (position_in_row - row / 2.0) * diameter,
                ),
                Vec2::ZERO,
                ball_mass,
                ball_radius,
            );
        }
    }
    Ok(world)
}

/// The rack, broken: the cue ball struck at `speed` m/s straight at the
/// apex, its tip `tip` radii above centre (0 a stun, 0.4 natural roll,
/// negative draw; `docs/09-billiards.md`, "The cue").
///
/// # Errors
/// [`ConfigError::InvalidShot`] for a speed that isn't `≥ 0` and finite or
/// `|tip| > 0.5`; otherwise as [`pool_rack`].
pub fn pool_break<S: Scalar>(
    solver: Solver,
    substeps: NonZeroU32,
    speed: f64,
    tip: f64,
) -> Result<World<S>, ConfigError> {
    if !(speed >= 0.0 && speed.is_finite() && tip.abs() <= 0.5) {
        return Err(ConfigError::InvalidShot);
    }
    let mut world = pool_rack(solver, substeps)?;
    let tip = S::from_f64(tip * POOL_BALL_RADIUS);
    world.strike(POOL_CUE, UnitVec2::X, S::from_f64(speed), tip);
    Ok(world)
}

#[cfg(test)]
mod tests;
