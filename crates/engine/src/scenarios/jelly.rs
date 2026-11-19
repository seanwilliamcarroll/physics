//! [`jelly`]: a grid of particles joined by structural, shear and bend
//! springs, realized as force-based springs or as compliant constraints
//! (`docs/07-soft-bodies.md`).

use core::num::NonZeroU32;
use math::convert::usize_to_f64;

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
    /// `(first, second, kind)`, indices into `positions`.
    pub pairs: Vec<(usize, usize, SpringKind)>,
}

impl SpringNetwork {
    /// A `cols` × `rows` grid, [`JELLY_SPACING`] apart, centered on x = 0
    /// with its bottom row at `bottom`.
    #[must_use]
    pub fn grid(cols: usize, rows: usize, bottom: f64) -> Self {
        let index_of = |column: usize, row: usize| row * cols + column;
        let half_width = usize_to_f64(cols.saturating_sub(1)) * JELLY_SPACING / 2.0;
        let mut positions = Vec::with_capacity(cols * rows);
        let mut pairs = Vec::new();
        for row in 0..rows {
            for column in 0..cols {
                let (x, y) = (
                    usize_to_f64(column) * JELLY_SPACING - half_width,
                    bottom + usize_to_f64(row) * JELLY_SPACING,
                );
                positions.push((x, y));
                let mut join = |columns_over: usize, rows_over: usize, kind| {
                    if column + columns_over < cols && row + rows_over < rows {
                        pairs.push((
                            index_of(column, row),
                            index_of(column + columns_over, row + rows_over),
                            kind,
                        ));
                    }
                };
                join(1, 0, SpringKind::Structural);
                join(0, 1, SpringKind::Structural);
                join(1, 1, SpringKind::Shear);
                join(2, 0, SpringKind::Bend);
                join(0, 2, SpringKind::Bend);
                if column >= 1 && row + 1 < rows {
                    pairs.push((
                        index_of(column, row),
                        index_of(column - 1, row + 1),
                        SpringKind::Shear,
                    ));
                }
            }
        }
        Self { positions, pairs }
    }
}

/// How a jelly's springs are enforced.
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
/// of `spring_stiffness` (N/m) and `spring_damping` (N·s/m) on every pair,
/// enforced as `body` says, `substeps` per step.
///
/// `spring_stiffness` is parsed per realization: force springs need
/// `0 < k < ∞`; constraints take `k > 0` including `∞`, which is rigid
/// (`α = 1/k = 0`).
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
    spring_stiffness: f64,
    spring_damping: f64,
) -> Result<Jelly<S>, ConfigError> {
    let network = SpringNetwork::grid(cols, rows, JELLY_DROP);
    let particle_mass = mass::<S>(JELLY_MASS / usize_to_f64(network.positions.len()))?;
    let damping = Damping::new(S::from_f64(spring_damping)).ok_or(ConfigError::InvalidDamping)?;
    let mut world = World::new(Integrator::SymplecticEuler, substeps);
    world.add_force(pendulum_gravity());
    world.set_ground(Some(S::from_f64(JELLY_GROUND)));
    let ids: Vec<ParticleId> = network
        .positions
        .iter()
        .map(|&(x, y)| {
            world
                .particles
                .add(Vec2::from_f64(x, y), Vec2::ZERO, particle_mass)
        })
        .collect();
    let ends = |first: usize, second: usize| Some((*ids.get(first)?, *ids.get(second)?));
    let springs = match body {
        JellyBody::Springs => {
            let stiffness = Stiffness::new(S::from_f64(spring_stiffness))
                .ok_or(ConfigError::InvalidStiffness)?;
            let springs = network
                .pairs
                .iter()
                .filter_map(|&(first, second, _)| {
                    let (first, second) = ends(first, second)?;
                    Spring::between(&world.particles, first, second, stiffness, damping)
                })
                .collect();
            let force = SpringForce::new(springs);
            world.add_force(force.clone());
            Some(force)
        }
        JellyBody::Constraints(solver) => {
            let compliance = compliance_for::<S>(spring_stiffness)?;
            for &(first, second, _) in &network.pairs {
                let Some((first, second)) = ends(first, second) else {
                    continue;
                };
                let rod = DistanceConstraint::between(&world.particles, first, second)
                    .ok_or(ConfigError::UnknownParticle)?
                    .with_compliance(compliance)
                    .with_damping(damping);
                world.add_constraint(rod)?;
            }
            world.set_solver(solver);
            None
        }
    };
    Ok(Jelly { world, springs })
}

/// `α = 1/k` for constraints: `k = ∞` is rigid (α = 0); `k ≤ 0`, NaN, or a
/// `k` so small that `1/k` overflows in `S` (an infinite compliance, which
/// XPBD would turn into NaN) is rejected.
///
/// # Errors
/// [`ConfigError::InvalidStiffness`] unless `k > 0` and `1/k` is finite in
/// `S`.
pub fn compliance_for<S: Scalar>(stiffness: f64) -> Result<Compliance<S>, ConfigError> {
    // `stiffness > 0` is false for NaN too, so NaN is rejected here.
    let positive = stiffness > 0.0;
    if !positive {
        return Err(ConfigError::InvalidStiffness);
    }
    Compliance::new(S::from_f64(1.0 / stiffness)).ok_or(ConfigError::InvalidStiffness)
}

#[cfg(test)]
mod tests;
