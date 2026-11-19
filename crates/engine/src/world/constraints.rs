//! [`Constraints`]: a world's constraints and everything the solvers keep
//! about them (`docs/06-constraints.md`).

use core::num::NonZeroU32;

use super::ConfigError;
use crate::collision::Statics;
use crate::solver::{Contacts, Step};
use crate::table::Table;
use crate::{
    Baumgarte, Constraint, DistanceConstraint, Force, Order, Particles, Restitution, Scalar,
    Solver, Stabilization, Vec2,
};

/// The constraints, one λ per constraint (same order), and the solver
/// settings. Grouped so `World` holds one field for all of it, and so the
/// invariants live in one place: `lambda` always matches `list` in
/// length, and switching solver always resets it.
pub(super) struct Constraints<S> {
    list: Vec<DistanceConstraint<S>>,
    lambda: Vec<S>,
    pub(super) solver: Solver,
    /// Gauss–Seidel passes over the constraints per substep.
    pub(super) iterations: NonZeroU32,
    pub(super) order: Order,
    pub(super) stabilization: Stabilization,
    /// The impulse solver's β; kept across solver switches.
    pub(super) baumgarte: Baumgarte<S>,
    /// XPBD's start-of-substep positions, or split impulses'
    /// pseudo-velocities.
    scratch: Vec<Vec2<S>>,
    contacts: Contacts<S>,
}

impl<S: Scalar> Constraints<S> {
    pub(super) const fn new(baumgarte: Baumgarte<S>) -> Self {
        Self {
            list: Vec::new(),
            lambda: Vec::new(),
            solver: Solver::Xpbd,
            iterations: NonZeroU32::MIN,
            order: Order::Forward,
            baumgarte,
            scratch: Vec::new(),
            stabilization: Stabilization::Split,
            contacts: Contacts::new(),
        }
    }

    pub(super) fn add(
        &mut self,
        constraint: DistanceConstraint<S>,
        particle_count: usize,
    ) -> Result<(), ConfigError> {
        if constraint
            .bodies()
            .iter()
            .any(|id| id.index() >= particle_count)
        {
            return Err(ConfigError::UnknownParticle);
        }
        self.list.push(constraint);
        self.lambda.push(S::ZERO);
        Ok(())
    }

    /// Removes the constraint at `index` (and its λ) if it is the last one
    /// added; `false` otherwise (only the latest add can be undone).
    pub(super) fn pop_if_last(&mut self, index: usize) -> bool {
        if index + 1 != self.list.len() {
            return false;
        }
        self.list.pop();
        self.lambda.pop();
        true
    }

    /// Replaces every constraint but the one at `skip` with `change` of
    /// itself, if `change` keeps every one's bodies (so each still names
    /// particles that exist, and λ stays aligned); otherwise changes
    /// nothing. Two passes, so a refusal leaves no constraint half-updated:
    /// `change` is called twice per constraint, so it should be pure.
    pub(super) fn update(
        &mut self,
        skip: Option<usize>,
        change: impl Fn(DistanceConstraint<S>) -> DistanceConstraint<S>,
    ) -> Result<(), ConfigError> {
        let others = || {
            self.list
                .iter()
                .enumerate()
                .filter(|&(index, _)| Some(index) != skip)
        };
        if others().any(|(_, constraint)| change(*constraint).bodies() != constraint.bodies()) {
            return Err(ConfigError::ChangedBodies);
        }
        for (index, constraint) in self.list.iter_mut().enumerate() {
            if Some(index) != skip {
                *constraint = change(*constraint);
            }
        }
        Ok(())
    }

    pub(super) fn list(&self) -> &[DistanceConstraint<S>] {
        &self.list
    }

    pub(super) fn is_empty(&self) -> bool {
        self.list.is_empty()
    }

    pub(super) fn set_solver(&mut self, solver: Solver) {
        self.solver = solver;
        self.lambda.fill(S::ZERO);
        self.contacts.clear();
    }

    pub(super) fn substep(
        &mut self,
        forces: &[Box<dyn Force<S>>],
        particles: &mut Particles<S>,
        accelerations: &mut Vec<Vec2<S>>,
        collision: Option<Collision<'_, S>>,
        substep_dt: S,
    ) {
        let collides = collision.is_some();
        let Collision {
            statics,
            restitution,
            cloth,
            speculative,
        } = collision.unwrap_or(Collision {
            statics: Statics::NONE,
            restitution: Restitution::INELASTIC,
            cloth: None,
            speculative: true,
        });
        if !collides {
            self.contacts.clear();
        }
        let step = Step {
            forces,
            particles,
            constraints: &self.list,
            lambda: &mut self.lambda,
            acc: accelerations,
            scratch: &mut self.scratch,
            iterations: self.iterations,
            order: self.order,
            stabilization: self.stabilization,
            baumgarte: self.baumgarte,
            collides,
            contacts: &mut self.contacts,
            statics,
            restitution,
            cloth,
            speculative,
        };
        match self.solver {
            Solver::Xpbd => step.xpbd(substep_dt),
            Solver::Impulse => step.impulse(substep_dt),
        }
    }
}

pub(super) struct Collision<'a, S> {
    pub(super) statics: Statics<'a, S>,
    pub(super) restitution: Restitution<S>,
    /// The cloth and every particle's spin, if the world has a table.
    pub(super) cloth: Option<(Table<S>, &'a mut [Vec2<S>])>,
    pub(super) speculative: bool,
}
