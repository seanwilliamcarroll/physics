//! [`Constraints`]: a world's constraints and everything the solvers keep
//! about them (`docs/06-constraints.md`).

use core::num::NonZeroU32;

use super::ConfigError;
use crate::collision::Statics;
use crate::solver::{Contacts, Step};
use crate::{
    Baumgarte, Constraint, DistanceConstraint, Force, Order, Particles, Restitution, Scalar,
    Solver, Stabilization, Vec2,
};

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
    /// The order each pass visits the constraints in.
    pub(super) order: Order,
    /// How the impulse solver corrects rigid rods' position error.
    pub(super) stabilization: Stabilization,
    /// The impulse solver's β; kept across solver switches.
    pub(super) baumgarte: Baumgarte<S>,
    /// Scratch: XPBD's start-of-substep positions, or split impulses'
    /// pseudo-velocities.
    scratch: Vec<Vec2<S>>,
    /// This substep's contacts and their multipliers (M6).
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

    /// Replaces every constraint but the one at `skip` with `f` of itself,
    /// if `f` keeps every one's bodies (so each still names particles that
    /// exist, and λ stays aligned); otherwise changes nothing. Two passes,
    /// so a refusal leaves no constraint half-updated: `f` is called twice
    /// per constraint, so it should be pure.
    pub(super) fn update(
        &mut self,
        skip: Option<usize>,
        f: impl Fn(DistanceConstraint<S>) -> DistanceConstraint<S>,
    ) -> Result<(), ConfigError> {
        let others = || {
            self.list
                .iter()
                .enumerate()
                .filter(|&(i, _)| Some(i) != skip)
        };
        if others().any(|(_, c)| f(*c).bodies() != c.bodies()) {
            return Err(ConfigError::ChangedBodies);
        }
        for (i, c) in self.list.iter_mut().enumerate() {
            if Some(i) != skip {
                *c = f(*c);
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

    /// Resets every λ: one solver's multipliers mean nothing to the other.
    pub(super) fn set_solver(&mut self, solver: Solver) {
        self.solver = solver;
        self.lambda.fill(S::ZERO);
        self.contacts.clear();
    }

    /// One substep of length `h` by the current solver. `collision` is
    /// `Some((statics, restitution))` when the world can collide.
    pub(super) fn substep(
        &mut self,
        forces: &[Box<dyn Force<S>>],
        particles: &mut Particles<S>,
        acc: &mut Vec<Vec2<S>>,
        collision: Option<(Statics<'_, S>, Restitution<S>)>,
        h: S,
    ) {
        let (statics, restitution) = collision.unwrap_or((Statics::NONE, Restitution::INELASTIC));
        if collision.is_none() {
            self.contacts.clear();
        }
        let step = Step {
            forces,
            particles,
            constraints: &self.list,
            lambda: &mut self.lambda,
            acc,
            scratch: &mut self.scratch,
            iterations: self.iterations,
            order: self.order,
            stabilization: self.stabilization,
            baumgarte: self.baumgarte,
            collides: collision.is_some(),
            contacts: &mut self.contacts,
            statics,
            restitution,
        };
        match self.solver {
            Solver::Xpbd => step.xpbd(h),
            Solver::Impulse => step.impulse(h),
        }
    }
}
