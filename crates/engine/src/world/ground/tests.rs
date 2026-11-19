use core::num::NonZeroU32;

use super::clamp;
use crate::params::kg;
use crate::{Integrator, Particles, Vec2, World};

const GROUND: f64 = 0.0;

#[test]
fn ground_defaults_to_none_and_reports_what_was_set() {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(world.ground(), None);
    world.set_ground(Some(-2.0));
    assert_eq!(world.ground(), Some(-2.0));
    world.set_ground(None);
    assert_eq!(world.ground(), None);
}

#[test]
fn clamp_lifts_a_particle_below_and_stops_its_fall_only() {
    let mut particles = Particles::new();
    let falling = particles.add(Vec2::new(1.0, -0.5), Vec2::new(3.0, -2.0), kg(1.0));
    let rising = particles.add(Vec2::new(2.0, -0.5), Vec2::new(-1.0, 4.0), kg(1.0));
    clamp(&mut particles, GROUND);
    // Up to the ground; downward velocity gone, sideways kept (no friction).
    assert_eq!(particles.pos()[falling.index()], Vec2::new(1.0, GROUND));
    assert_eq!(particles.vel()[falling.index()], Vec2::new(3.0, 0.0));
    // Already moving up: only the position changes.
    assert_eq!(particles.pos()[rising.index()], Vec2::new(2.0, GROUND));
    assert_eq!(particles.vel()[rising.index()], Vec2::new(-1.0, 4.0));
}

#[test]
fn clamp_stops_a_particle_on_the_ground_moving_down() {
    let mut particles = Particles::new();
    let _ = particles.add(Vec2::new(0.0, GROUND), Vec2::new(0.0, -1.0), kg(1.0));
    clamp(&mut particles, GROUND);
    assert_eq!(particles.pos()[0], Vec2::new(0.0, GROUND));
    assert_eq!(particles.vel()[0], Vec2::ZERO);
}

#[test]
fn clamp_leaves_particles_above_and_static_ones_alone() {
    let mut particles = Particles::new();
    let _ = particles.add(Vec2::new(0.0, 0.5), Vec2::new(0.0, -1.0), kg(1.0));
    let _ = particles.add_static(Vec2::new(0.0, -3.0));
    let before = particles.clone();
    clamp(&mut particles, GROUND);
    assert_eq!(particles.pos(), before.pos());
    assert_eq!(particles.vel(), before.vel());
}
