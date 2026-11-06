//! [`World<S>`]: particles + forces + constraints, advanced in fixed steps
//! by an integrator or, with constraints, a solver
//! (`docs/06-constraints.md`).

mod config_error;
mod constraints;
mod drag;
mod ground;

use core::num::NonZeroU32;

pub use config_error::ConfigError;
use constraints::Constraints;
pub use drag::Grab;

use crate::{Baumgarte, Mass, ParticleId, Radius, Restitution, TimeStep, Wall};
use crate::{
    DistanceConstraint, Force, Integrator, Order, Particles, Scalar, Solver, Stabilization, Vec2,
};

/// A simulation: particles, the forces acting on them, and how to integrate.
pub struct World<S: Scalar> {
    /// Crate-visible only: outside the engine, reads go through
    /// [`particles`](Self::particles) and changes through the world's own
    /// methods, none of which can replace or remove particles, so every
    /// constraint keeps naming particles that exist (checked once, in
    /// [`add_constraint`](Self::add_constraint)).
    pub(crate) particles: Particles<S>,
    forces: Vec<Box<dyn Force<S>>>,
    integrator: Integrator,
    substeps: NonZeroU32,
    /// Per-substep acceleration scratch, reused to avoid allocating each
    /// step. Lives here, not in `Particles`: forces borrow the particles
    /// immutably while writing into this buffer.
    acc: Vec<Vec2<S>>,
    /// Second scratch buffer: velocity Verlet's accelerations at the new
    /// positions.
    acc_next: Vec<Vec2<S>>,
    /// Constraints and the solver state; with any constraints, the solver
    /// steps instead of `integrator`.
    constraints: Constraints<S>,
    /// The ground's height, m, if any: a half-plane clamp after every
    /// substep (`world/ground.rs`).
    ground: Option<S>,
    /// Static half-planes circles collide with (M6).
    walls: Vec<Wall<S>>,
    /// Restitution for every collision (M6: one per world).
    restitution: Restitution<S>,
}

impl<S: Scalar> World<S> {
    /// An empty world, `substeps` per step. Can't fail: the type rules out
    /// zero substeps, and the built-in β is valid by construction.
    #[must_use]
    pub fn new(integrator: Integrator, substeps: NonZeroU32) -> Self {
        Self {
            particles: Particles::new(),
            forces: Vec::new(),
            integrator,
            substeps,
            acc: Vec::new(),
            acc_next: Vec::new(),
            constraints: Constraints::new(Baumgarte::default()),
            ground: None,
            walls: Vec::new(),
            restitution: Restitution::INELASTIC,
        }
    }

    /// Adds a static wall; circles collide with it (`docs/08-collision.md`).
    pub fn add_wall(&mut self, wall: Wall<S>) {
        self.walls.push(wall);
    }

    #[must_use]
    pub fn walls(&self) -> &[Wall<S>] {
        &self.walls
    }

    #[must_use]
    pub const fn restitution(&self) -> Restitution<S> {
        self.restitution
    }

    /// Restitution for every collision, from the next step. A new world's
    /// is [`Restitution::INELASTIC`].
    pub const fn set_restitution(&mut self, e: Restitution<S>) {
        self.restitution = e;
    }

    /// Whether anything can collide: any wall, or any circle (a particle
    /// with a radius). Such a world is stepped by the solver
    /// (`docs/08-collision.md`, "Who steps").
    #[must_use]
    pub fn collides(&self) -> bool {
        !self.walls.is_empty() || self.particles.max_radius() > S::ZERO
    }

    /// The particles, read-only (see the field).
    #[must_use]
    pub const fn particles(&self) -> &Particles<S> {
        &self.particles
    }

    /// Adds a dynamic particle (see [`Particles::add`]).
    pub fn add_particle(&mut self, pos: Vec2<S>, vel: Vec2<S>, mass: Mass<S>) -> ParticleId {
        self.particles.add(pos, vel, mass)
    }

    /// Adds a dynamic circle, which collides (see [`Particles::add_circle`]).
    pub fn add_circle(
        &mut self,
        pos: Vec2<S>,
        vel: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> ParticleId {
        self.particles.add_circle(pos, vel, mass, radius)
    }

    /// Adds an immovable particle (see [`Particles::add_static`]).
    pub fn add_static(&mut self, pos: Vec2<S>) -> ParticleId {
        self.particles.add_static(pos)
    }

    /// Velocities, mutable in place (see [`Particles::vel_mut`]).
    pub fn vel_mut(&mut self) -> &mut [Vec2<S>] {
        self.particles.vel_mut()
    }

    /// Moves a static particle (see [`Particles::set_static_position`]).
    #[must_use]
    pub fn set_static_position(&mut self, id: ParticleId, pos: Vec2<S>) -> bool {
        self.particles.set_static_position(id, pos)
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
        self.constraints.add(c, self.particles.len())
    }

    #[must_use]
    pub fn constraints(&self) -> &[DistanceConstraint<S>] {
        self.constraints.list()
    }

    #[must_use]
    pub const fn solver(&self) -> Solver {
        self.constraints.solver
    }

    /// Takes effect from the next step. Resets every λ: one solver's
    /// multipliers mean nothing to the other.
    pub fn set_solver(&mut self, solver: Solver) {
        self.constraints.set_solver(solver);
    }

    #[must_use]
    pub const fn baumgarte(&self) -> Baumgarte<S> {
        self.constraints.baumgarte
    }

    /// The impulse solver's β, from the next step (XPBD ignores it).
    pub const fn set_baumgarte(&mut self, beta: Baumgarte<S>) {
        self.constraints.baumgarte = beta;
    }

    #[must_use]
    pub const fn iterations(&self) -> NonZeroU32 {
        self.constraints.iterations
    }

    pub const fn set_iterations(&mut self, iterations: NonZeroU32) {
        self.constraints.iterations = iterations;
    }

    #[must_use]
    pub const fn order(&self) -> Order {
        self.constraints.order
    }

    /// The order each solver pass visits the constraints in, from the next
    /// step.
    pub const fn set_order(&mut self, order: Order) {
        self.constraints.order = order;
    }

    #[must_use]
    pub const fn stabilization(&self) -> Stabilization {
        self.constraints.stabilization
    }

    /// How the impulse solver corrects rigid rods' position error, from the
    /// next step (XPBD projects positions directly and ignores it).
    pub const fn set_stabilization(&mut self, stabilization: Stabilization) {
        self.constraints.stabilization = stabilization;
    }

    /// The type makes 0 unrepresentable, so there's nothing to report.
    pub const fn set_substeps(&mut self, substeps: NonZeroU32) {
        self.substeps = substeps;
    }

    #[must_use]
    pub const fn substeps(&self) -> NonZeroU32 {
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

    /// Advances by `dt`, split into `substeps` equal substeps of `dt /
    /// substeps`. A [`TimeStep`] is positive and finite, so time can't run
    /// backward, stand still (XPBD's velocity is `Δx / h`), or turn NaN.
    pub fn step(&mut self, dt: TimeStep<S>) {
        let h = dt.get() / S::from_f64(f64::from(self.substeps.get()));
        for _ in 0..self.substeps.get() {
            self.substep(h);
        }
    }

    /// No constraints: the integrator, exactly as before M3. With
    /// constraints: the solver owns the whole substep, and the integrator
    /// setting is ignored (`docs/06-constraints.md`). Then the ground, if
    /// any, clamps the result: after the stepper, so it applies to all of
    /// them alike, and after XPBD derives its velocities, so the next
    /// substep starts from a clamped position *and* velocity.
    fn substep(&mut self, h: S) {
        let collision = self
            .collides()
            .then_some((self.walls.as_slice(), self.restitution));
        if self.constraints.is_empty() && collision.is_none() {
            self.integrator.substep(
                &self.forces,
                &mut self.particles,
                &mut self.acc,
                &mut self.acc_next,
                h,
            );
        } else {
            self.constraints.substep(
                &self.forces,
                &mut self.particles,
                &mut self.acc,
                collision,
                h,
            );
        }
        if let Some(y) = self.ground {
            ground::clamp(&mut self.particles, y);
        }
    }
}

#[cfg(test)]
mod tests;
