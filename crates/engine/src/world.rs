//! [`World<S>`]: particles + forces + constraints, advanced in fixed steps
//! by an integrator or, with constraints, a solver
//! (`docs/06-constraints.md`).

mod config_error;
mod constraints;
mod drag;
mod ground;
mod pockets;
mod table;

use core::num::NonZeroU32;

pub use config_error::ConfigError;
use constraints::{Collision, Constraints};

use crate::collision::{Pocket, Segment, Statics, count_tunnels};
use crate::integrate::VerletScratch;
use crate::table::Table;
pub use drag::Grab;

use crate::{Baumgarte, Mass, ParticleId, Radius, Restitution, StaticId, TimeStep, Wall};
use crate::{
    DistanceConstraint, Force, Integrator, Order, Particles, Scalar, Solver, Stabilization, Vec2,
};

/// A simulation: particles, the forces acting on them, and how to integrate.
/// Setters take effect from the next step.
pub struct World<S: Scalar> {
    /// Crate-visible only: outside the engine no particle can be replaced or
    /// removed, so every constraint keeps naming one that exists.
    pub(crate) particles: Particles<S>,
    forces: Vec<Box<dyn Force<S>>>,
    integrator: Integrator,
    substeps: NonZeroU32,
    /// Scratch, here and not in `Particles`: forces borrow the particles
    /// immutably while writing into it.
    accelerations: Vec<Vec2<S>>,
    /// Velocity Verlet's accelerations at the new positions.
    next_accelerations: Vec<Vec2<S>>,
    /// Velocity Verlet's start-of-substep velocities.
    start_velocities: Vec<Vec2<S>>,
    /// With any constraints, the solver steps instead of `integrator`.
    constraints: Constraints<S>,
    /// The ground's height, m, if any (`world/ground.rs`).
    ground: Option<S>,
    walls: Vec<Wall<S>>,
    segments: Vec<Segment<S>>,
    restitution: Restitution<S>,
    table: Option<Table<S>>,
    /// Each particle's spin about the horizontal axes, `(ω_x, ω_y)`, rad/s,
    /// aligned with the particles; only a table moves it.
    spin: Vec<Vec2<S>>,
    /// On by default (`docs/09-billiards.md`, "Tunneling").
    speculative: bool,
    tunnels: Option<TunnelCount<S>>,
    pockets: Vec<Pocket<S>>,
    potted: Vec<(ParticleId, usize)>,
}

struct TunnelCount<S> {
    count: u64,
    starting_positions: Vec<Vec2<S>>,
    pairs: Vec<(usize, usize)>,
}

impl<S: Scalar> World<S> {
    #[must_use]
    pub fn new(integrator: Integrator, substeps: NonZeroU32) -> Self {
        Self {
            particles: Particles::new(),
            forces: Vec::new(),
            integrator,
            substeps,
            accelerations: Vec::new(),
            next_accelerations: Vec::new(),
            start_velocities: Vec::new(),
            constraints: Constraints::new(Baumgarte::default()),
            ground: None,
            walls: Vec::new(),
            segments: Vec::new(),
            restitution: Restitution::INELASTIC,
            table: None,
            spin: Vec::new(),
            speculative: true,
            tunnels: None,
            pockets: Vec::new(),
            potted: Vec::new(),
        }
    }

    pub fn add_wall(&mut self, wall: Wall<S>) {
        self.walls.push(wall);
    }

    pub fn add_segment(&mut self, segment: Segment<S>) {
        self.segments.push(segment);
    }

    #[must_use]
    pub fn segments(&self) -> &[Segment<S>] {
        &self.segments
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) fn walls(&self) -> &[Wall<S>] {
        &self.walls
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) const fn restitution(&self) -> Restitution<S> {
        self.restitution
    }

    pub const fn set_restitution(&mut self, restitution: Restitution<S>) {
        self.restitution = restitution;
    }

    /// Whether any wall, segment or circle exists; such a world is stepped
    /// by the solver (`docs/08-collision.md`, "Who steps").
    #[must_use]
    pub fn collides(&self) -> bool {
        !self.walls.is_empty() || !self.segments.is_empty() || self.particles.max_radius() > S::ZERO
    }

    #[must_use]
    pub const fn particles(&self) -> &Particles<S> {
        &self.particles
    }

    pub fn add_particle(
        &mut self,
        position: Vec2<S>,
        velocity: Vec2<S>,
        mass: Mass<S>,
    ) -> ParticleId {
        self.particles.add(position, velocity, mass)
    }

    pub fn add_circle(
        &mut self,
        position: Vec2<S>,
        velocity: Vec2<S>,
        mass: Mass<S>,
        radius: Radius<S>,
    ) -> ParticleId {
        self.particles.add_circle(position, velocity, mass, radius)
    }

    pub fn add_static(&mut self, position: Vec2<S>) -> StaticId {
        self.particles.add_static(position)
    }

    pub fn velocities_mut(&mut self) -> &mut [Vec2<S>] {
        self.particles.velocities_mut()
    }

    #[must_use]
    pub fn set_static_position(&mut self, id: StaticId, position: Vec2<S>) -> bool {
        self.particles.set_static_position(id, position)
    }

    pub fn add_force(&mut self, force: impl Force<S> + 'static) {
        self.forces.push(Box::new(force));
    }

    /// Removes every force; to change one's parameters, clear and re-add.
    pub fn clear_forces(&mut self) {
        self.forces.clear();
    }

    /// Adds a constraint; the [`Solver`] then steps this world.
    ///
    /// # Errors
    /// [`ConfigError::UnknownParticle`] if it names a particle not in this
    /// world.
    pub fn add_constraint(&mut self, constraint: DistanceConstraint<S>) -> Result<(), ConfigError> {
        self.constraints.add(constraint, self.particles.len())
    }

    #[must_use]
    pub fn constraints(&self) -> &[DistanceConstraint<S>] {
        self.constraints.list()
    }

    #[must_use]
    pub const fn solver(&self) -> Solver {
        self.constraints.solver
    }

    /// Resets every λ: one solver's multipliers mean nothing to the other.
    pub fn set_solver(&mut self, solver: Solver) {
        self.constraints.set_solver(solver);
    }

    #[must_use]
    pub const fn baumgarte(&self) -> Baumgarte<S> {
        self.constraints.baumgarte
    }

    /// The impulse solver's β (XPBD ignores it).
    pub const fn set_baumgarte(&mut self, baumgarte: Baumgarte<S>) {
        self.constraints.baumgarte = baumgarte;
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

    pub const fn set_order(&mut self, order: Order) {
        self.constraints.order = order;
    }

    #[must_use]
    pub const fn stabilization(&self) -> Stabilization {
        self.constraints.stabilization
    }

    /// How the impulse solver corrects rod position error (XPBD ignores it).
    pub const fn set_stabilization(&mut self, stabilization: Stabilization) {
        self.constraints.stabilization = stabilization;
    }

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

    /// Safe at any time: no integrator keeps state between steps.
    pub const fn set_integrator(&mut self, integrator: Integrator) {
        self.integrator = integrator;
    }

    /// Advances by `dt`, split into `substeps` equal substeps.
    pub fn step(&mut self, dt: TimeStep<S>) {
        let substep_dt = dt.get() / S::from_f64(f64::from(self.substeps.get()));
        self.potted.clear();
        for _ in 0..self.substeps.get() {
            self.substep(substep_dt);
        }
    }

    /// The integrator steps a world with no constraints and nothing
    /// colliding; otherwise the solver does (`docs/06-constraints.md`). The
    /// ground clamps last, after XPBD derives its velocities, so the next
    /// substep starts from a clamped position *and* velocity.
    fn substep(&mut self, substep_dt: S) {
        if self.constraints.is_empty() && !self.collides() {
            let scratch = VerletScratch {
                accelerations: &mut self.accelerations,
                next_accelerations: &mut self.next_accelerations,
                start_velocities: &mut self.start_velocities,
            };
            self.integrator
                .substep(&self.forces, &mut self.particles, scratch, substep_dt);
        } else {
            if let Some(tunnels) = &mut self.tunnels {
                tunnels.starting_positions.clear();
                tunnels
                    .starting_positions
                    .extend_from_slice(self.particles.positions());
            }
            self.spin.resize(self.particles.len(), Vec2::ZERO);
            let statics = Statics {
                walls: &self.walls,
                segments: &self.segments,
            };
            let collision = self.collides().then(|| Collision {
                statics,
                restitution: self.restitution,
                cloth: self.table.map(|table| (table, self.spin.as_mut_slice())),
                speculative: self.speculative,
            });
            self.constraints.substep(
                &self.forces,
                &mut self.particles,
                &mut self.accelerations,
                collision,
                substep_dt,
            );
            if let Some(tunnels) = &mut self.tunnels {
                let new_tunnels = count_tunnels(
                    &tunnels.starting_positions,
                    &self.particles,
                    statics,
                    &mut tunnels.pairs,
                );
                tunnels.count += u64::from(new_tunnels);
            }
            if !self.pockets.is_empty() {
                self.pot();
            }
        }
        if let Some(ground_y) = self.ground {
            ground::clamp(&mut self.particles, ground_y);
        }
    }
}

#[cfg(test)]
mod tests;
