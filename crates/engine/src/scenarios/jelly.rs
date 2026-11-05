//! [`jelly`]: a grid of particles joined by structural, shear and bend
//! springs, realized as force-based springs or as compliant constraints
//! (M5; `docs/07-soft-bodies.md`).

use core::num::NonZeroU32;

use super::pendulum::pendulum_gravity;
use super::shared::mass;
use crate::{
    Compliance, ConfigError, Damping, DistanceConstraint, Integrator, ParticleId, Scalar, Solver,
    Spring, SpringForce, Stiffness, Vec2, World,
};

/// Default grid, particles per side: 64 particles, ~300 springs with bend.
pub const JELLY_COLS: usize = 8;
pub const JELLY_ROWS: usize = 8;

/// Distance between grid neighbors, m: an 8 × 8 jelly is 0.7 m across.
pub const JELLY_SPACING: f64 = 0.1;

/// Total mass, kg, shared equally by the particles: fixed, so the grid
/// size changes resolution, not weight.
pub const JELLY_MASS: f64 = 1.0;

/// Height of the jelly's bottom row above the ground at release, m.
pub const JELLY_DROP: f64 = 0.5;

/// Height of the ground, m (`World::set_ground`).
pub const JELLY_GROUND: f64 = 0.0;

/// Which pairs a spring joins.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum SpringKind {
    /// Horizontal and vertical neighbors: the shape.
    Structural,
    /// Both diagonals of each cell: resists shearing.
    Shear,
    /// Neighbors two apart, horizontally and vertically: resists folding.
    Bend,
}

/// A jelly before it's a world: particle positions (row-major, bottom row
/// first) and the pairs to join, in `f64`, so the setup is compiled once
/// whatever the scalar type.
#[derive(Clone, Debug, PartialEq)]
pub struct SpringNetwork {
    pub positions: Vec<(f64, f64)>,
    /// `(a, b, kind)`, indices into `positions`.
    pub pairs: Vec<(usize, usize, SpringKind)>,
}

impl SpringNetwork {
    /// A `cols` × `rows` grid, [`JELLY_SPACING`] apart, centered on x = 0
    /// with its bottom row at `bottom`.
    #[must_use]
    pub fn grid(cols: usize, rows: usize, bottom: f64) -> Self {
        let idx = |i: usize, j: usize| j * cols + i;
        #[expect(
            clippy::cast_precision_loss,
            reason = "grid sizes are tiny next to 2^53, so the conversion is exact"
        )]
        let half_width = cols.saturating_sub(1) as f64 * JELLY_SPACING / 2.0;
        let mut positions = Vec::with_capacity(cols * rows);
        let mut pairs = Vec::new();
        for j in 0..rows {
            for i in 0..cols {
                #[expect(
                    clippy::cast_precision_loss,
                    reason = "grid indices are tiny next to 2^53, so the conversion is exact"
                )]
                let (x, y) = (
                    i as f64 * JELLY_SPACING - half_width,
                    bottom + j as f64 * JELLY_SPACING,
                );
                positions.push((x, y));
                let mut join = |di: usize, dj: usize, kind| {
                    if i + di < cols && j + dj < rows {
                        pairs.push((idx(i, j), idx(i + di, j + dj), kind));
                    }
                };
                join(1, 0, SpringKind::Structural);
                join(0, 1, SpringKind::Structural);
                join(1, 1, SpringKind::Shear);
                join(2, 0, SpringKind::Bend);
                join(0, 2, SpringKind::Bend);
                if i >= 1 && j + 1 < rows {
                    pairs.push((idx(i, j), idx(i - 1, j + 1), SpringKind::Shear));
                }
            }
        }
        Self { positions, pairs }
    }
}

/// How a jelly's springs are enforced: the three panels of the M5 page.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum JellyBody {
    /// Force-based springs (`SpringForce`), stepped by symplectic Euler:
    /// unstable past a critical stiffness.
    Springs,
    /// Compliant `DistanceConstraint`s, stepped by `solver`: stable at any
    /// stiffness, rigid included.
    Constraints(Solver),
}

/// A jelly world, and for [`JellyBody::Springs`] a copy of its spring force
/// (for energy readouts and live stiffness: `World` keeps forces as `dyn`).
pub struct Jelly<S: Scalar> {
    pub world: World<S>,
    pub springs: Option<SpringForce<S>>,
}

/// A `cols` × `rows` jelly of [`JELLY_MASS`] dropped from [`JELLY_DROP`]
/// onto a ground at [`JELLY_GROUND`], under standard gravity, with springs
/// of stiffness `k` (N/m) and damping `c` (N·s/m) on every pair, enforced
/// as `body` says, `substeps` per step.
///
/// `k` is parsed per realization: force springs need `0 < k < ∞`;
/// constraints take `k > 0` including `∞`, which is rigid (`α = 1/k = 0`).
///
/// # Errors
/// [`ConfigError::InvalidStiffness`] or [`ConfigError::InvalidDamping`]
/// for values the realization can't take; [`ConfigError::InvalidMass`]
/// for an empty grid (no mass to share).
pub fn jelly<S: Scalar>(
    body: JellyBody,
    substeps: NonZeroU32,
    cols: usize,
    rows: usize,
    k: f64,
    c: f64,
) -> Result<Jelly<S>, ConfigError> {
    let net = SpringNetwork::grid(cols, rows, JELLY_DROP);
    #[expect(
        clippy::cast_precision_loss,
        reason = "particle counts are tiny next to 2^53, so the conversion is exact"
    )]
    let m = mass::<S>(JELLY_MASS / net.positions.len() as f64)?;
    let damping = Damping::new(S::from_f64(c)).ok_or(ConfigError::InvalidDamping)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.add_force(pendulum_gravity());
    world.set_ground(Some(S::from_f64(JELLY_GROUND)));
    let ids: Vec<ParticleId> = net
        .positions
        .iter()
        .map(|&(x, y)| world.particles.add(Vec2::from_f64(x, y), Vec2::ZERO, m))
        .collect();
    let ends = |a: usize, b: usize| Some((*ids.get(a)?, *ids.get(b)?));
    let springs = match body {
        JellyBody::Springs => {
            let stiffness = Stiffness::new(S::from_f64(k)).ok_or(ConfigError::InvalidStiffness)?;
            let springs = net
                .pairs
                .iter()
                .filter_map(|&(a, b, _)| {
                    let (a, b) = ends(a, b)?;
                    Spring::between(&world.particles, a, b, stiffness, damping)
                })
                .collect();
            let force = SpringForce::new(springs);
            world.add_force(force.clone());
            Some(force)
        }
        JellyBody::Constraints(solver) => {
            let alpha = compliance_for::<S>(k)?;
            for &(a, b, _) in &net.pairs {
                let Some((a, b)) = ends(a, b) else { continue };
                let rod = DistanceConstraint::between(&world.particles, a, b)
                    .ok_or(ConfigError::UnknownParticle)?
                    .with_compliance(alpha)
                    .with_damping(damping);
                world.add_constraint(rod)?;
            }
            world.set_solver(solver);
            None
        }
    };
    Ok(Jelly { world, springs })
}

/// `α = 1/k` for constraints: `k = ∞` is rigid (α = 0); `k ≤ 0` or NaN is
/// rejected.
///
/// # Errors
/// [`ConfigError::InvalidStiffness`] unless `k > 0`.
pub fn compliance_for<S: Scalar>(k: f64) -> Result<Compliance<S>, ConfigError> {
    // `k > 0` is false for NaN too, so NaN is rejected here.
    let positive = k > 0.0;
    if !positive {
        return Err(ConfigError::InvalidStiffness);
    }
    Compliance::new(S::from_f64(1.0 / k)).ok_or(ConfigError::InvalidStiffness)
}

#[cfg(test)]
mod tests;
