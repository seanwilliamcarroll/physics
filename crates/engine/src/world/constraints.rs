//! [`Constraints`]: a world's constraints and everything the solvers keep
//! about them (`docs/06-constraints.md`).

use core::num::NonZeroU32;

use super::ConfigError;
use crate::solver::Step;
use crate::{Baumgarte, Constraint, DistanceConstraint, Force, Particles, Scalar, Solver, Vec2};

/// The constraints, one λ per constraint (same order), and the solver
/// settings. Grouped so `World` holds one field for all of it, and so the
/// invariants live in one place: `lambda` always matches `list` in
/// length, and switching solver always resets it.
pub(super) struct Constraints<S> {
    /// Rods etc. With any present, the solver steps instead of the
    /// integrator.
    list: Vec<DistanceConstraint<S>>,
    /// The solver's multipliers.
    lambda: Vec<S>,
    pub(super) solver: Solver,
    /// Gauss–Seidel passes over the constraints per substep.
    pub(super) iterations: NonZeroU32,
    /// The impulse solver's β; kept across solver switches.
    pub(super) baumgarte: Baumgarte<S>,
    /// Scratch: positions at the start of a substep (XPBD).
    prev: Vec<Vec2<S>>,
}

impl<S: Scalar> Constraints<S> {
    pub(super) const fn new(baumgarte: Baumgarte<S>) -> Self {
        Self {
            list: Vec::new(),
            lambda: Vec::new(),
            solver: Solver::Xpbd,
            iterations: NonZeroU32::MIN,
            baumgarte,
            prev: Vec::new(),
        }
    }

    /// Adds `c` if both its bodies are among the `particle_count`
    /// particles.
    pub(super) fn add(
        &mut self,
        c: DistanceConstraint<S>,
        particle_count: usize,
    ) -> Result<(), ConfigError> {
        if c.bodies().iter().any(|id| id.index() >= particle_count) {
            return Err(ConfigError::UnknownParticle);
        }
        self.list.push(c);
        self.lambda.push(S::ZERO);
        Ok(())
    }

    pub(super) fn list(&self) -> &[DistanceConstraint<S>] {
        &self.list
    }

    pub(super) fn is_empty(&self) -> bool {
        self.list.is_empty()
    }

    /// Resets every λ: one solver's multipliers mean nothing to the other.
    pub(super) fn set_solver(&mut self, solver: Solver) {
        self.solver = solver;
        self.lambda.fill(S::ZERO);
    }

    /// One substep of length `h` by the current solver.
    pub(super) fn substep(
        &mut self,
        forces: &[Box<dyn Force<S>>],
        particles: &mut Particles<S>,
        acc: &mut Vec<Vec2<S>>,
        h: S,
    ) {
        let step = Step {
            forces,
            particles,
            constraints: &self.list,
            lambda: &mut self.lambda,
            acc,
            prev: &mut self.prev,
            iterations: self.iterations,
            baumgarte: self.baumgarte,
        };
        match self.solver {
            Solver::Xpbd => step.xpbd(h),
            Solver::Impulse => step.impulse(h),
        }
    }
}
