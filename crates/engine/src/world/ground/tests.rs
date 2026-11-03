use core::num::NonZeroU32;

use super::clamp;
use crate::params::kg;
use crate::{Integrator, Particles, Vec2, World};

const GROUND: f64 = 0.0;

#[test]
fn ground_defaults_to_none_and_reports_what_was_set() {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    assert_eq!(w.ground(), None);
    w.set_ground(Some(-2.0));
    assert_eq!(w.ground(), Some(-2.0));
    w.set_ground(None);
    assert_eq!(w.ground(), None);
}

#[test]
fn clamp_lifts_a_particle_below_and_stops_its_fall_only() {
    let mut p = Particles::new();
    let falling = p.add(Vec2::new(1.0, -0.5), Vec2::new(3.0, -2.0), kg(1.0));
    let rising = p.add(Vec2::new(2.0, -0.5), Vec2::new(-1.0, 4.0), kg(1.0));
    clamp(&mut p, GROUND);
    // Up to the ground; downward velocity gone, sideways kept (no friction).
    assert_eq!(p.pos()[falling.index()], Vec2::new(1.0, GROUND));
    assert_eq!(p.vel()[falling.index()], Vec2::new(3.0, 0.0));
    // Already moving up: only the position changes.
    assert_eq!(p.pos()[rising.index()], Vec2::new(2.0, GROUND));
    assert_eq!(p.vel()[rising.index()], Vec2::new(-1.0, 4.0));
}

#[test]
fn clamp_stops_a_particle_on_the_ground_moving_down() {
    let mut p = Particles::new();
    let _ = p.add(Vec2::new(0.0, GROUND), Vec2::new(0.0, -1.0), kg(1.0));
    clamp(&mut p, GROUND);
    assert_eq!(p.pos()[0], Vec2::new(0.0, GROUND));
    assert_eq!(p.vel()[0], Vec2::ZERO);
}

#[test]
fn clamp_leaves_particles_above_and_static_ones_alone() {
    let mut p = Particles::new();
    let _ = p.add(Vec2::new(0.0, 0.5), Vec2::new(0.0, -1.0), kg(1.0));
    let _ = p.add_static(Vec2::new(0.0, -3.0));
    let before = p.clone();
    clamp(&mut p, GROUND);
    assert_eq!(p.pos(), before.pos());
    assert_eq!(p.vel(), before.vel());
}
