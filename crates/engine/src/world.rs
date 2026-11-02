//! [`World<S>`]: particles + forces + integrator, advanced in fixed steps.

use core::fmt;

use crate::{Force, Integrator, Particles, Scalar, Vec2};

/// Invalid `World` configuration.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum ConfigError {
    /// `substeps` must be at least 1.
    ZeroSubsteps,
}

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::ZeroSubsteps => f.write_str("substeps must be at least 1"),
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
        })
    }

    pub fn add_force(&mut self, force: impl Force<S> + 'static) {
        self.forces.push(Box::new(force));
    }

    #[must_use]
    pub const fn substeps(&self) -> u32 {
        self.substeps
    }

    /// Advances by `dt`, split into `substeps` equal substeps of `dt / substeps`.
    pub fn step(&mut self, dt: S) {
        let h = dt / S::from_f64(f64::from(self.substeps));
        for _ in 0..self.substeps {
            self.substep(h);
        }
    }

    fn substep(&mut self, h: S) {
        self.integrator.substep(
            &self.forces,
            &mut self.particles,
            &mut self.acc,
            &mut self.acc_next,
            h,
        );
    }
}
