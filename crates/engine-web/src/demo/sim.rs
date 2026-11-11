//! [`Sim`]: a world plus what the demo must remember about its force.

use engine::diagnostics::{
    constraint_error, constraint_potential, kinetic_energy, total_energy, uniform_gravity_potential,
};
use engine::scenarios::{cluster, cluster_gravity, collapse, compliance_for, disk, newtonian};
use engine::{
    BarnesHut, ConfigError, Damping, Grab, OpeningAngle, PairwiseGravity, Scalar, Softening,
    SpringForce, Stiffness, UniformGravity, World,
};

use super::codes::GravityScene;

/// The force a scene runs under, as far as the demo needs to know it:
/// energy readouts need the exact force, and `World` owns its forces as
/// `dyn Force`, so it can't hand one back. One enum rather than optional
/// fields, so a θ can only exist next to the pairwise gravity it
/// approximates.
pub(super) enum SceneForce<S> {
    /// No energy readout (the fountain: no uniform-gravity potential for a
    /// scene that teleports particles anyway).
    Unmeasured,
    /// Pairwise gravity (orbit, M2 scenes). With `theta`, the world runs
    /// Barnes–Hut approximating `exact`; energy is still read out exactly,
    /// so the readout shows what the approximation costs.
    Pairwise {
        exact: PairwiseGravity<S>,
        theta: Option<OpeningAngle<S>>,
    },
    /// No force at all (the break, in free space): energy is kinetic.
    Free,
    /// A billiards table (M7): no force in the plane; energy is kinetic
    /// plus the balls' spin.
    Table,
    /// Uniform gravity (the pendulum).
    Uniform(UniformGravity<S>),
    /// A jelly: uniform gravity, and for the force-based realization a
    /// copy of its springs (for readouts and live stiffness; the
    /// constraint realization keeps its springs as constraints).
    Jelly {
        gravity: UniformGravity<S>,
        springs: Option<SpringForce<S>>,
    },
}

/// A world and its [`SceneForce`].
pub(super) struct Sim<S: Scalar> {
    pub(super) world: World<S>,
    force: SceneForce<S>,
}

impl<S: Scalar> Sim<S> {
    pub(super) const fn plain(world: World<S>) -> Self {
        Self {
            world,
            force: SceneForce::Unmeasured,
        }
    }

    pub(super) const fn free(world: World<S>) -> Self {
        Self {
            world,
            force: SceneForce::Free,
        }
    }

    pub(super) const fn on_table(world: World<S>) -> Self {
        Self {
            world,
            force: SceneForce::Table,
        }
    }

    pub(super) const fn with_uniform(world: World<S>, uniform: UniformGravity<S>) -> Self {
        Self {
            world,
            force: SceneForce::Uniform(uniform),
        }
    }

    pub(super) const fn with_gravity(world: World<S>, exact: PairwiseGravity<S>) -> Self {
        Self {
            world,
            force: SceneForce::Pairwise { exact, theta: None },
        }
    }

    /// Makes the world's force match a pairwise scene's `exact` and
    /// `theta`. Such a scene has no other force, so clearing loses nothing.
    fn install(world: &mut World<S>, exact: PairwiseGravity<S>, theta: Option<OpeningAngle<S>>) {
        world.clear_forces();
        match theta {
            None => world.add_force(exact),
            Some(t) => world.add_force(BarnesHut::approximating(&exact, t)),
        }
    }

    /// Runs a pairwise scene as Barnes–Hut with opening angle `theta`.
    /// `false`, changing nothing, for any other scene.
    pub(super) fn set_theta(&mut self, theta: OpeningAngle<S>) -> bool {
        let SceneForce::Pairwise { exact, theta: t } = &mut self.force else {
            return false;
        };
        *t = Some(theta);
        Self::install(&mut self.world, *exact, *t);
        true
    }

    /// Replaces a pairwise scene's gravity with one of softening `eps`,
    /// keeping θ. `false`, changing nothing, for any other scene.
    pub(super) fn set_softening(&mut self, eps: Softening<S>) -> bool {
        let SceneForce::Pairwise { exact, theta } = &mut self.force else {
            return false;
        };
        *exact = newtonian(eps);
        Self::install(&mut self.world, *exact, *theta);
        true
    }

    pub(super) const fn with_jelly(
        world: World<S>,
        gravity: UniformGravity<S>,
        springs: Option<SpringForce<S>>,
    ) -> Self {
        Self {
            world,
            force: SceneForce::Jelly { gravity, springs },
        }
    }

    /// The ends of a jelly's force springs (empty for every other scene),
    /// for the links buffer.
    pub(super) fn spring_ends(&self) -> Vec<[engine::ParticleId; 2]> {
        match &self.force {
            SceneForce::Jelly {
                springs: Some(f), ..
            } => f.springs().iter().map(engine::Spring::ends).collect(),
            _ => Vec::new(),
        }
    }

    /// A jelly's spring stiffness `k` (N/m), live: the force realization
    /// rebuilds its springs (`0 < k < ∞`); the constraint realization
    /// updates every rod but `grab`'s (`k > 0`, ∞ is rigid). `false`,
    /// changing nothing, for a value the realization can't take or a
    /// scene that isn't a jelly.
    pub(super) fn set_stiffness(&mut self, k: f64, grab: Option<&Grab>) -> bool {
        let SceneForce::Jelly { gravity, springs } = &mut self.force else {
            return false;
        };
        if let Some(force) = springs {
            let Some(stiffness) = Stiffness::new(S::from_f64(k)) else {
                return false;
            };
            *force = force.with_stiffness(stiffness);
            reinstall(&mut self.world, *gravity, force);
        } else {
            let Ok(alpha) = compliance_for::<S>(k) else {
                return false;
            };
            return self
                .world
                .update_constraints(grab, |c| c.with_compliance(alpha))
                .is_ok();
        }
        true
    }

    /// A jelly's damping `c` (N·s/m), live, as [`Sim::set_stiffness`].
    pub(super) fn set_damping(&mut self, c: f64, grab: Option<&Grab>) -> bool {
        let SceneForce::Jelly { gravity, springs } = &mut self.force else {
            return false;
        };
        let Some(damping) = Damping::new(S::from_f64(c)) else {
            return false;
        };
        if let Some(force) = springs {
            *force = force.with_damping(damping);
            reinstall(&mut self.world, *gravity, force);
        } else {
            return self
                .world
                .update_constraints(grab, |rod| rod.with_damping(damping))
                .is_ok();
        }
        true
    }

    /// Total energy under the scene's exact force, or `None`.
    pub(super) fn energy(&self) -> Option<f64> {
        let p = self.world.particles();
        match &self.force {
            SceneForce::Unmeasured => None,
            SceneForce::Free => Some(kinetic_energy(p).to_f64()),
            SceneForce::Table => {
                let spin = engine::table::rotational_energy(p, self.world.spin());
                Some((kinetic_energy(p) + spin).to_f64())
            }
            SceneForce::Jelly { gravity, springs } => {
                let elastic = springs.as_ref().map_or_else(
                    || constraint_potential(p, self.world.constraints()),
                    |s| s.potential(p),
                );
                Some((kinetic_energy(p) + uniform_gravity_potential(p, gravity) + elastic).to_f64())
            }
            SceneForce::Pairwise { exact, .. } => Some(total_energy(p, exact).to_f64()),
            SceneForce::Uniform(u) => {
                Some((kinetic_energy(p) + uniform_gravity_potential(p, u)).to_f64())
            }
        }
    }

    /// θ if Barnes–Hut is on.
    #[cfg(test)]
    pub(super) const fn theta(&self) -> Option<OpeningAngle<S>> {
        match self.force {
            SceneForce::Pairwise { theta, .. } => theta,
            SceneForce::Unmeasured
            | SceneForce::Free
            | SceneForce::Table
            | SceneForce::Uniform(_)
            | SceneForce::Jelly { .. } => None,
        }
    }

    /// Max |C| over the world's constraints, m; `None` without any.
    /// Max |C| over the world's constraints, m, leaving out the last
    /// `skip` (a drag rod, whose stretch is the user's pull, not error);
    /// `None` without any left.
    pub(super) fn constraint_error(&self, skip: usize) -> Option<f64> {
        let all = self.world.constraints();
        let kept = all
            .get(..all.len().saturating_sub(skip))
            .unwrap_or_default();
        constraint_error(self.world.particles(), kept).map(|(max, _)| max.to_f64())
    }
}

/// `scene`'s world, with its gravity.
pub(super) fn gravity_scene<S: Scalar>(
    scene: GravityScene,
    n: usize,
    seed: u64,
) -> Result<Sim<S>, ConfigError> {
    let world = match scene {
        GravityScene::Cluster => cluster(n, seed)?,
        GravityScene::Disk => disk(n, seed)?,
        GravityScene::Collapse => collapse(n, seed)?,
    };
    Ok(Sim::with_gravity(world, cluster_gravity()?))
}

/// Replaces a force jelly's forces with `gravity` and the updated
/// `springs` (M2's softening pattern: forces are rebuilt, not edited).
fn reinstall<S: Scalar>(
    world: &mut World<S>,
    gravity: UniformGravity<S>,
    springs: &SpringForce<S>,
) {
    world.clear_forces();
    world.add_force(gravity);
    world.add_force(springs.clone());
}
