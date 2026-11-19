//! Barnes–Hut test worlds and accelerations (`docs/barnes-hut.md`).

use engine::scenarios::{CLUSTER_SOFTENING, GRAVITATIONAL_CONSTANT, cluster};
use engine::{BarnesHut, Force, OpeningAngle, Particles, Scalar, Softening, Vec2, World};

use crate::s;

/// `scenarios::cluster`'s force with `BarnesHut` at opening angle `theta`.
#[must_use]
pub fn cluster_barnes_hut_force<S: Scalar>(theta: f64) -> BarnesHut<S> {
    let softening = Softening::new(s(CLUSTER_SOFTENING)).unwrap();
    BarnesHut::new(
        s(GRAVITATIONAL_CONSTANT),
        softening,
        OpeningAngle::new(s(theta)).unwrap(),
    )
}

/// `scenarios::cluster(body_count, seed)` (same bodies, integrator,
/// substeps), but under Barnes–Hut at `theta` instead of pairwise gravity.
#[must_use]
pub fn cluster_barnes_hut<S: Scalar>(body_count: usize, seed: u64, theta: f64) -> World<S> {
    let mut world = cluster::<S>(body_count, seed).unwrap();
    world.clear_forces();
    world.add_force(cluster_barnes_hut_force::<S>(theta));
    world
}

/// The accelerations `force` alone gives `particles`.
pub fn accelerations<S: Scalar, F: Force<S> + ?Sized>(
    particles: &Particles<S>,
    force: &F,
) -> Vec<Vec2<S>> {
    let mut accelerations = vec![Vec2::ZERO; particles.len()];
    force.accumulate(particles, &mut accelerations);
    accelerations
}
