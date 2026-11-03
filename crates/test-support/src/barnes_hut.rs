//! Barnes–Hut test worlds and accelerations (`docs/barnes-hut.md`).

use engine::scenarios::{CLUSTER_SOFTENING, CLUSTER_SUBSTEPS, GRAVITATIONAL_CONSTANT, cluster};
use engine::{
    BarnesHut, Force, Integrator, OpeningAngle, Particles, Scalar, Softening, Vec2, World,
};

use crate::s;

/// `scenarios::cluster`'s force with `BarnesHut` at opening angle `theta`.
#[must_use]
pub fn cluster_barnes_hut_force<S: Scalar>(theta: f64) -> BarnesHut<S> {
    let eps = Softening::new(s(CLUSTER_SOFTENING)).unwrap();
    BarnesHut::new(
        s(GRAVITATIONAL_CONSTANT),
        eps,
        OpeningAngle::new(s(theta)).unwrap(),
    )
}

/// `scenarios::cluster(n, seed)` (same bodies, integrator, substeps), but
/// under Barnes–Hut at `theta` instead of pairwise gravity.
#[must_use]
pub fn cluster_barnes_hut<S: Scalar>(n: usize, seed: u64, theta: f64) -> World<S> {
    let mut w = World::new(Integrator::SymplecticEuler, CLUSTER_SUBSTEPS).unwrap();
    w.add_force(cluster_barnes_hut_force::<S>(theta));
    w.particles = cluster::<S>(n, seed).unwrap().particles;
    w
}

/// The accelerations `force` alone gives `p`.
pub fn accelerations<S: Scalar, F: Force<S> + ?Sized>(p: &Particles<S>, force: &F) -> Vec<Vec2<S>> {
    let mut acc = vec![Vec2::ZERO; p.len()];
    force.accumulate(p, &mut acc);
    acc
}
