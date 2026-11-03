//! [`World<S>`]: particles + forces + constraints, advanced in fixed steps
//! by an integrator or, with constraints, a solver
//! (`docs/06-constraints.md`).

use core::fmt;
use core::num::NonZeroU32;

use crate::solver::Step;
use crate::{Constraint, DistanceConstraint, Force, Integrator, Particles, Scalar, Solver, Vec2};

/// Invalid `World` configuration.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum ConfigError {
    /// `substeps` must be at least 1.
    ZeroSubsteps,
    /// A softening length ε must be `≥ 0` (not negative, not NaN); see
    /// [`crate::Softening`].
    InvalidSoftening,
    /// A mass must be positive and finite, with a finite inverse; see
    /// [`crate::Mass`].
    InvalidMass,
    /// A constraint names a particle this world doesn't have (e.g. it was
    /// built from another world's particles).
    UnknownParticle,
}

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::ZeroSubsteps => f.write_str("substeps must be at least 1"),
            Self::InvalidSoftening => f.write_str("softening must be at least 0 (and not NaN)"),
            Self::InvalidMass => {
                f.write_str("mass must be positive and finite, with a finite inverse")
            }
            Self::UnknownParticle => f.write_str("constraint names a particle not in this world"),
        }
    }
}

impl std::error::Error for ConfigError {}

/// A simulation: particles, the forces acting on them, and how to integrate.
pub struct World<S: Scalar> {
    pub particles: Particles<S>,
    forces: Vec<Box<dyn Force<S>>>,
    integrator: Integrator,
    substeps: u32,
    /// Per-substep acceleration scratch, reused to avoid allocating each
    /// step. Lives here, not in `Particles`: forces borrow the particles
    /// immutably while writing into this buffer.
    acc: Vec<Vec2<S>>,
    /// Second scratch buffer: velocity Verlet's accelerations at the new
    /// positions.
    acc_next: Vec<Vec2<S>>,
    /// Rods etc. With any present, `solver` steps instead of `integrator`.
    constraints: Vec<DistanceConstraint<S>>,
    /// One multiplier per constraint, same order: the solver's state.
    lambda: Vec<S>,
    solver: Solver,
    /// Gauss–Seidel passes over the constraints per substep.
    iterations: NonZeroU32,
    /// Scratch: positions at the start of a substep (XPBD).
    prev: Vec<Vec2<S>>,
}

impl<S: Scalar> World<S> {
    /// An empty world.
    ///
    /// # Errors
    /// [`ConfigError::ZeroSubsteps`] if `substeps` is 0.
    pub fn new(integrator: Integrator, substeps: u32) -> Result<Self, ConfigError> {
        if substeps == 0 {
            return Err(ConfigError::ZeroSubsteps);
        }
        Ok(Self {
            particles: Particles::new(),
            forces: Vec::new(),
            integrator,
            substeps,
            acc: Vec::new(),
            acc_next: Vec::new(),
            constraints: Vec::new(),
            lambda: Vec::new(),
            solver: Solver::Xpbd,
            iterations: NonZeroU32::MIN,
            prev: Vec::new(),
        })
    }

    pub fn add_force(&mut self, force: impl Force<S> + 'static) {
        self.forces.push(Box::new(force));
    }

    /// Removes every force; particles keep their state. To change a
    /// force's parameters (e.g. softening), clear and re-add: mutating a
    /// `Box<dyn Force>` in place would need downcasting or a setter on
    /// every force.
    pub fn clear_forces(&mut self) {
        self.forces.clear();
    }

    /// Adds a constraint; from the next step, the [`Solver`] steps this
    /// world.
    ///
    /// # Errors
    /// [`ConfigError::UnknownParticle`] if it names a particle this world
    /// doesn't have (built from another world's particles). Nothing is
    /// added then.
    pub fn add_constraint(&mut self, c: DistanceConstraint<S>) -> Result<(), ConfigError> {
        let n = self.particles.len();
        if c.bodies().iter().any(|id| id.index() >= n) {
            return Err(ConfigError::UnknownParticle);
        }
        self.constraints.push(c);
        self.lambda.push(S::ZERO);
        Ok(())
    }

    #[must_use]
    pub fn constraints(&self) -> &[DistanceConstraint<S>] {
        &self.constraints
    }

    #[must_use]
    pub const fn solver(&self) -> Solver {
        self.solver
    }

    /// Takes effect from the next step. Resets every λ: one solver's
    /// multipliers mean nothing to the other.
    pub fn set_solver(&mut self, solver: Solver) {
        self.solver = solver;
        self.lambda.fill(S::ZERO);
    }

    #[must_use]
    pub const fn iterations(&self) -> NonZeroU32 {
        self.iterations
    }

    pub const fn set_iterations(&mut self, iterations: NonZeroU32) {
        self.iterations = iterations;
    }

    /// The type makes 0 unrepresentable, so unlike [`World::new`] there's
    /// nothing to report.
    pub const fn set_substeps(&mut self, substeps: NonZeroU32) {
        self.substeps = substeps.get();
    }

    #[must_use]
    pub const fn substeps(&self) -> u32 {
        self.substeps
    }

    #[must_use]
    pub const fn integrator(&self) -> Integrator {
        self.integrator
    }

    /// Switches integrators; takes effect from the next step. Safe at any
    /// time: no integrator keeps state between steps (velocity Verlet
    /// recomputes its accelerations every substep).
    pub const fn set_integrator(&mut self, integrator: Integrator) {
        self.integrator = integrator;
    }

    /// Advances by `dt`, split into `substeps` equal substeps of `dt / substeps`.
    pub fn step(&mut self, dt: S) {
        let h = dt / S::from_f64(f64::from(self.substeps));
        for _ in 0..self.substeps {
            self.substep(h);
        }
    }

    /// No constraints: the integrator, exactly as before M3. With
    /// constraints: the solver owns the whole substep, and the integrator
    /// setting is ignored (`docs/06-constraints.md`).
    fn substep(&mut self, h: S) {
        if self.constraints.is_empty() {
            self.integrator.substep(
                &self.forces,
                &mut self.particles,
                &mut self.acc,
                &mut self.acc_next,
                h,
            );
            return;
        }
        let step = Step {
            forces: &self.forces,
            particles: &mut self.particles,
            constraints: &self.constraints,
            lambda: &mut self.lambda,
            acc: &mut self.acc,
            prev: &mut self.prev,
            iterations: self.iterations,
        };
        match self.solver {
            Solver::Xpbd => step.xpbd(h),
        }
    }
}

#[cfg(test)]
mod tests;
