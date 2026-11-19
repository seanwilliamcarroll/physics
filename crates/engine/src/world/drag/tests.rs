use crate::test_util::time_step;
use core::num::NonZeroU32;

use crate::params::kg;
use crate::scenarios::pendulum_gravity;
use crate::{Compliance, DistanceConstraint, Integrator, ParticleId, Vec2, Wall, World};

/// k = 1/α = 1000 N/m: a firm pull for kilogram-scale bodies.
const SOFT: f64 = 1e-3;

/// A pin, a bob on a rod from it, and a free bob: a constraint world (so a
/// solver steps it and it can be grabbed).
fn world_with_two_bobs() -> World<f64> {
    let mut world = bare_two_bobs();
    let rod = DistanceConstraint::between(&world.particles, ParticleId(0), ParticleId(1));
    world.add_constraint(rod.unwrap()).unwrap();
    world
}

/// The same particles with no constraint: a world the integrator steps.
fn bare_two_bobs() -> World<f64> {
    let mut world = World::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let _ = world.particles.add_static(Vec2::ZERO);
    let _ = world
        .particles
        .add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let _ = world
        .particles
        .add(Vec2::new(3.0, 0.0), Vec2::ZERO, kg(1.0));
    world
}

#[test]
fn grab_picks_the_nearest_dynamic_particle_within_radius() {
    let mut world = world_with_two_bobs();
    let soft = Compliance::new(SOFT).unwrap();
    // Nearest overall is the static pin at the origin: not grabbable.
    let grab = world.grab(Vec2::new(0.4, 0.0), 1.0, soft).unwrap();
    assert_eq!(grab.particle().index(), 1);
    assert_eq!((world.particles.len(), world.constraints().len()), (4, 2));
    assert_eq!(world.release(grab), Ok(()));
    // Nothing dynamic within the radius: no grab, no change.
    assert!(world.grab(Vec2::new(2.0, 5.0), 1.0, soft).is_none());
    assert_eq!((world.particles.len(), world.constraints().len()), (3, 1));
}

#[test]
fn drag_pulls_the_particle_and_release_restores_the_world() {
    let mut world = world_with_two_bobs();
    world.add_force(pendulum_gravity());
    let grab = world
        .grab(Vec2::new(3.0, 0.0), 0.5, Compliance::new(SOFT).unwrap())
        .unwrap();
    world.drag(&grab, Vec2::new(3.0, 2.0));
    for _ in 0..60 {
        world.step(time_step(1.0 / 60.0));
    }
    // Held near the anchor against gravity (sag m g α ≈ 1 cm at k = 1000).
    let bob = world.particles.pos()[2];
    assert!((bob - Vec2::new(3.0, 2.0)).length() < 0.05, "{bob:?}");
    let before = world.particles.pos()[..3].to_vec();
    assert_eq!(world.release(grab), Ok(()));
    assert_eq!((world.particles.len(), world.constraints().len()), (3, 1));
    assert_eq!(
        world.particles.pos(),
        before.as_slice(),
        "release moves nothing"
    );
}

#[test]
fn release_refuses_once_something_newer_was_added() {
    let mut world = world_with_two_bobs();
    let grab = world
        .grab(Vec2::new(1.0, 0.0), 0.5, Compliance::RIGID)
        .unwrap();
    let _ = world.particles.add_static(Vec2::new(9.0, 9.0));
    let grab = world
        .release(grab)
        .expect_err("popping would remove the newer particle");
    assert_eq!(world.particles.len(), 5);
    // Remove the newer particle, and the returned grab releases fine.
    assert!(world.particles.pop_if_last(crate::ParticleId(4)));
    assert_eq!(world.release(grab), Ok(()));
}

#[test]
fn only_static_particles_can_be_moved() {
    // Moving a *dynamic* particle can't be written: `set_static_position`
    // takes a `StaticId`. What's left at run time is a `StaticId` from
    // another world, naming a slot that's dynamic, or missing, here.
    let mut world = bare_two_bobs(); // slots: 0 a pin, 1 and 2 bobs
    let pin = world.add_static(Vec2::new(5.0, 5.0));
    assert!(world.set_static_position(pin, Vec2::new(0.0, 1.0)));
    assert_eq!(world.particles.pos()[pin.index()], Vec2::new(0.0, 1.0));
    let mut other = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    let _ = other.add_static(Vec2::ZERO);
    let foreign = other.add_static(Vec2::ZERO); // slot 1: a bob in `world`
    assert!(
        !world.set_static_position(foreign, Vec2::ZERO),
        "slot 1 is a bob here"
    );
    assert_eq!(
        world.particles.pos()[1],
        Vec2::new(1.0, 0.0),
        "the bob didn't move"
    );
    for _ in 0..3 {
        let _ = other.add_static(Vec2::ZERO);
    }
    let missing = other.add_static(Vec2::ZERO); // slot 5: none in `world`
    assert!(!world.set_static_position(missing, Vec2::ZERO));
}

#[test]
fn update_constraints_skips_the_held_grabs_rod() {
    use crate::scenarios::{JellyBody, jelly};
    use crate::{Constraint, Solver};
    let mut jelly = jelly::<f64>(
        JellyBody::Constraints(Solver::Xpbd),
        NonZeroU32::MIN,
        3,
        3,
        100.0,
        0.0,
    )
    .unwrap();
    let world = &mut jelly.world;
    let rod_count = world.constraints().len();
    let grab = world
        .grab(
            world.particles.pos()[4],
            0.05,
            Compliance::new(SOFT).unwrap(),
        )
        .unwrap();
    let stiff = Compliance::new(1e-6).unwrap();
    assert_eq!(
        world.update_constraints(Some(&grab), |constraint| constraint.with_compliance(stiff)),
        Ok(())
    );
    let all = world.constraints();
    assert!(
        all[..rod_count]
            .iter()
            .all(|constraint| constraint.compliance().to_bits() == 1e-6_f64.to_bits()),
        "jelly rods updated"
    );
    assert_eq!(
        all[rod_count].compliance().to_bits(),
        SOFT.to_bits(),
        "drag rod kept its own stiffness"
    );
    assert_eq!(world.release(grab), Ok(()));
}

/// A world the integrator steps can't be grabbed: the grab's rod would hand
/// it to a solver. Nothing is added.
#[test]
fn an_integrator_world_cant_be_grabbed() {
    let mut world = bare_two_bobs();
    assert!(!world.grabbable());
    assert!(
        world
            .grab(Vec2::new(1.0, 0.0), 1.0, Compliance::RIGID)
            .is_none()
    );
    assert_eq!((world.particles.len(), world.constraints().len()), (3, 0));
}

/// Collisions already put a world in a solver's hands, so it can be grabbed
/// without a constraint of its own.
#[test]
fn a_colliding_world_can_be_grabbed() {
    let mut world = bare_two_bobs();
    world.add_wall(Wall::through(Vec2::new(0.0, -10.0), crate::UnitVec2::Y));
    assert!(world.grabbable());
    let grab = world
        .grab(Vec2::new(1.0, 0.0), 1.0, Compliance::RIGID)
        .unwrap();
    assert_eq!(world.release(grab), Ok(()));
}

/// An update may change a constraint's settings, not which particles it
/// joins: refused, and nothing changes (not even the constraints before the
/// offending one).
#[test]
fn update_constraints_refuses_to_change_bodies() {
    let mut world = world_with_two_bobs();
    let other =
        DistanceConstraint::between(&world.particles, ParticleId(0), ParticleId(2)).unwrap();
    let before = world.constraints().to_vec();
    assert_eq!(
        world.update_constraints(None, |_| other),
        Err(super::ConfigError::ChangedBodies)
    );
    assert_eq!(world.constraints(), before.as_slice());
}
