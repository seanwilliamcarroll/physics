use core::num::NonZeroU32;

use crate::params::kg;
use crate::scenarios::pendulum_gravity;
use crate::{Compliance, Integrator, Vec2, World};

/// k = 1/α = 1000 N/m: a firm pull for kilogram-scale bodies.
const SOFT: f64 = 1e-3;

fn world_with_two_bobs() -> World<f64> {
    let mut w = World::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let _ = w.particles.add_static(Vec2::ZERO);
    let _ = w.particles.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let _ = w.particles.add(Vec2::new(3.0, 0.0), Vec2::ZERO, kg(1.0));
    w
}

#[test]
fn grab_picks_the_nearest_dynamic_particle_within_radius() {
    let mut w = world_with_two_bobs();
    let soft = Compliance::new(SOFT).unwrap();
    // Nearest overall is the static pin at the origin: not grabbable.
    let g = w.grab(Vec2::new(0.4, 0.0), 1.0, soft).unwrap();
    assert_eq!(g.particle().index(), 1);
    assert_eq!((w.particles.len(), w.constraints().len()), (4, 1));
    assert_eq!(w.release(g), Ok(()));
    // Nothing dynamic within the radius: no grab, no change.
    assert!(w.grab(Vec2::new(2.0, 5.0), 1.0, soft).is_none());
    assert_eq!((w.particles.len(), w.constraints().len()), (3, 0));
}

#[test]
fn drag_pulls_the_particle_and_release_restores_the_world() {
    let mut w = world_with_two_bobs();
    w.add_force(pendulum_gravity());
    let g = w
        .grab(Vec2::new(3.0, 0.0), 0.5, Compliance::new(SOFT).unwrap())
        .unwrap();
    w.drag(&g, Vec2::new(3.0, 2.0));
    for _ in 0..60 {
        w.step(1.0 / 60.0);
    }
    // Held near the anchor against gravity (sag m g α ≈ 1 cm at k = 1000).
    let bob = w.particles.pos()[2];
    assert!((bob - Vec2::new(3.0, 2.0)).length() < 0.05, "{bob:?}");
    let before = w.particles.pos()[..3].to_vec();
    assert_eq!(w.release(g), Ok(()));
    assert_eq!((w.particles.len(), w.constraints().len()), (3, 0));
    assert_eq!(
        w.particles.pos(),
        before.as_slice(),
        "release moves nothing"
    );
}

#[test]
fn release_refuses_once_something_newer_was_added() {
    let mut w = world_with_two_bobs();
    let g = w.grab(Vec2::new(1.0, 0.0), 0.5, Compliance::RIGID).unwrap();
    let _ = w.particles.add_static(Vec2::new(9.0, 9.0));
    let g = w
        .release(g)
        .expect_err("popping would remove the newer particle");
    assert_eq!(w.particles.len(), 5);
    // Remove the newer particle, and the returned grab releases fine.
    assert!(w.particles.pop_if_last(crate::ParticleId(4)));
    assert_eq!(w.release(g), Ok(()));
}

#[test]
fn only_static_particles_can_be_moved() {
    let mut w = world_with_two_bobs();
    let pin = crate::ParticleId(0);
    let bob = crate::ParticleId(1);
    assert!(w.particles.set_static_position(pin, Vec2::new(0.0, 1.0)));
    assert!(!w.particles.set_static_position(bob, Vec2::new(0.0, 1.0)));
    assert!(
        !w.particles
            .set_static_position(crate::ParticleId(99), Vec2::ZERO)
    );
    assert_eq!(w.particles.pos()[0], Vec2::new(0.0, 1.0));
}

#[test]
fn update_constraints_skips_the_held_grabs_rod() {
    use crate::scenarios::{JellyBody, jelly};
    use crate::{Constraint, Solver};
    let mut j = jelly::<f64>(
        JellyBody::Constraints(Solver::Xpbd),
        NonZeroU32::MIN,
        3,
        3,
        100.0,
        0.0,
    )
    .unwrap();
    let w = &mut j.world;
    let rods = w.constraints().len();
    let g = w
        .grab(w.particles.pos()[4], 0.05, Compliance::new(SOFT).unwrap())
        .unwrap();
    let stiff = Compliance::new(1e-6).unwrap();
    w.update_constraints(Some(&g), |c| c.with_compliance(stiff));
    let all = w.constraints();
    assert!(
        all[..rods]
            .iter()
            .all(|c| c.compliance().to_bits() == 1e-6_f64.to_bits()),
        "jelly rods updated"
    );
    assert_eq!(
        all[rods].compliance().to_bits(),
        SOFT.to_bits(),
        "drag rod kept its own stiffness"
    );
    assert_eq!(w.release(g), Ok(()));
}
