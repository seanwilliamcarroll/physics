//! [`Sim`]: a world plus what the demo must remember about its force.

use engine::diagnostics::{
    constraint_error, kinetic_energy, total_energy, uniform_gravity_potential,
};
use engine::scenarios::{cluster, cluster_gravity, collapse, disk, gravity};
use engine::{
    BarnesHut, ConfigError, OpeningAngle, PairwiseGravity, Scalar, Softening, UniformGravity, World,
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
    /// Uniform gravity (the pendulum).
    Uniform(UniformGravity<S>),
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
        *exact = gravity(eps);
        Self::install(&mut self.world, *exact, *theta);
        true
    }

    /// Total energy under the scene's exact force, or `None`.
    pub(super) fn energy(&self) -> Option<f64> {
        let p = &self.world.particles;
        match &self.force {
            SceneForce::Unmeasured => None,
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
            SceneForce::Unmeasured | SceneForce::Uniform(_) => None,
        }
    }

    /// Max |C| over the world's constraints, m; `None` without any.
    pub(super) fn constraint_error(&self) -> Option<f64> {
        constraint_error(&self.world.particles, self.world.constraints())
            .map(|(max, _)| max.to_f64())
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
