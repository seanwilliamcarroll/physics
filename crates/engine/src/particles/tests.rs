use super::{ParticleId, Particles};
use crate::params::kg;
use crate::{Radius, Vec2};

#[test]
fn starts_empty() {
    let particles = Particles::<f64>::new();
    assert_eq!(particles.len(), 0);
    assert!(particles.is_empty());
}

#[test]
fn add_stores_inverse_mass() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::new(1.0, 2.0), Vec2::new(3.0, 4.0), kg(4.0));
    assert_eq!(particles.len(), 1);
    assert_eq!(particles.pos(), &[Vec2::new(1.0, 2.0)]);
    assert_eq!(particles.vel(), &[Vec2::new(3.0, 4.0)]);
    assert_eq!(particles.inv_mass(), &[0.25]);
}

#[test]
fn add_static_has_zero_inverse_mass_and_velocity() {
    let mut particles = Particles::<f32>::new();
    particles.add_static(Vec2::new(5.0, 6.0));
    assert_eq!(particles.pos(), &[Vec2::new(5.0, 6.0)]);
    assert_eq!(particles.vel(), &[Vec2::ZERO]);
    assert_eq!(particles.inv_mass(), &[0.0]);
}

#[test]
fn vel_mut_edits_in_place() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    particles.vel_mut()[0] = Vec2::new(7.0, 0.0);
    assert_eq!(particles.vel(), &[Vec2::new(7.0, 0.0)]);
}

#[test]
fn ids_are_sequential_slot_indices() {
    let mut particles = Particles::<f64>::new();
    let first = particles.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let pin = particles.add_static(Vec2::new(2.0, 0.0));
    let last = particles.add(Vec2::new(3.0, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!([first.index(), pin.index(), last.index()], [0, 1, 2]);
    assert_eq!(
        particles.pos().get(last.index()),
        Some(&Vec2::new(3.0, 0.0))
    );
    assert_eq!(particles.inv_mass().get(pin.index()), Some(&0.0));
}

#[test]
fn ids_compare_by_slot() {
    let mut particles = Particles::<f64>::new();
    let first = particles.add_static(Vec2::ZERO);
    let second = particles.add_static(Vec2::ZERO);
    assert_ne!(first, second);
    assert_eq!(first.id(), ParticleId(0));
}

#[test]
fn circles_have_a_radius_and_points_have_none() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    particles.add_static(Vec2::ZERO);
    assert_eq!(
        (particles.radius(), particles.max_radius()),
        (&[0.0, 0.0][..], 0.0)
    );
    let radius_of = |meters| Radius::new(meters).unwrap();
    particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), radius_of(0.1));
    particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), radius_of(0.3));
    particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), radius_of(0.2));
    assert_eq!(particles.radius(), &[0.0, 0.0, 0.1, 0.3, 0.2]);
    assert_eq!(particles.max_radius(), 0.3);
}

#[test]
fn popping_the_largest_circle_recomputes_the_max() {
    let mut particles = Particles::<f64>::new();
    let radius_of = |meters| Radius::new(meters).unwrap();
    particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), radius_of(0.1));
    let big = particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), radius_of(0.5));
    assert!(particles.pop_if_last(big));
    assert_eq!(
        (particles.radius(), particles.max_radius()),
        (&[0.1][..], 0.1)
    );
}

#[test]
fn is_empty_is_false_once_a_particle_is_added() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!particles.is_empty());
}

#[test]
fn nearest_dynamic_compares_squared_distances_within_the_radius() {
    let mut particles = Particles::<f64>::new();
    // 2.8 m away (d² = 7.84) inside a 3 m radius (r² = 9): found. Testing
    // against 2r = 6 or r/r = 1 instead of r² would miss it.
    let far = particles.add(Vec2::new(2.8, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!(particles.nearest_dynamic(Vec2::ZERO, 3.0), Some(far));
    assert_eq!(particles.nearest_dynamic(Vec2::ZERO, 2.7), None);
}

#[test]
fn nearest_dynamic_breaks_a_tie_by_the_first_added() {
    let mut particles = Particles::<f64>::new();
    let first = particles.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let _ = particles.add(Vec2::new(-1.0, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!(particles.nearest_dynamic(Vec2::ZERO, 2.0), Some(first));
}

/// Re-forming a slot with a larger radius raises the largest radius (the
/// broadphase's cell).
#[test]
fn a_larger_body_raises_the_largest_radius() {
    let mut particles = Particles::<f64>::new();
    let _ = particles.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), Radius::new(0.1).unwrap());
    assert!(particles.set_body(0, Vec2::ZERO, 1.0, 0.3));
    assert_eq!(particles.max_radius(), 0.3);
}
