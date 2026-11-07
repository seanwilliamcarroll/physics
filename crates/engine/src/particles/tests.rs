use super::{ParticleId, Particles};
use crate::params::kg;
use crate::{Radius, Vec2};

#[test]
fn starts_empty() {
    let p = Particles::<f64>::new();
    assert_eq!(p.len(), 0);
    assert!(p.is_empty());
}

#[test]
fn add_stores_inverse_mass() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::new(1.0, 2.0), Vec2::new(3.0, 4.0), kg(4.0));
    assert_eq!(p.len(), 1);
    assert_eq!(p.pos(), &[Vec2::new(1.0, 2.0)]);
    assert_eq!(p.vel(), &[Vec2::new(3.0, 4.0)]);
    assert_eq!(p.inv_mass(), &[0.25]);
}

#[test]
fn add_static_has_zero_inverse_mass_and_velocity() {
    let mut p = Particles::<f32>::new();
    p.add_static(Vec2::new(5.0, 6.0));
    assert_eq!(p.pos(), &[Vec2::new(5.0, 6.0)]);
    assert_eq!(p.vel(), &[Vec2::ZERO]);
    assert_eq!(p.inv_mass(), &[0.0]);
}

#[test]
fn vel_mut_edits_in_place() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    p.vel_mut()[0] = Vec2::new(7.0, 0.0);
    assert_eq!(p.vel(), &[Vec2::new(7.0, 0.0)]);
}

#[test]
fn ids_are_sequential_slot_indices() {
    let mut p = Particles::<f64>::new();
    let a = p.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let b = p.add_static(Vec2::new(2.0, 0.0));
    let c = p.add(Vec2::new(3.0, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!([a.index(), b.index(), c.index()], [0, 1, 2]);
    assert_eq!(p.pos().get(c.index()), Some(&Vec2::new(3.0, 0.0)));
    assert_eq!(p.inv_mass().get(b.index()), Some(&0.0));
}

#[test]
fn ids_compare_by_slot() {
    let mut p = Particles::<f64>::new();
    let a = p.add_static(Vec2::ZERO);
    let b = p.add_static(Vec2::ZERO);
    assert_ne!(a, b);
    assert_eq!(a.id(), ParticleId(0));
}

#[test]
fn circles_have_a_radius_and_points_have_none() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    p.add_static(Vec2::ZERO);
    assert_eq!((p.radius(), p.max_radius()), (&[0.0, 0.0][..], 0.0));
    let r = |v| Radius::new(v).unwrap();
    p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), r(0.1));
    p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), r(0.3));
    p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), r(0.2));
    assert_eq!(p.radius(), &[0.0, 0.0, 0.1, 0.3, 0.2]);
    assert_eq!(p.max_radius(), 0.3);
}

#[test]
fn popping_the_largest_circle_recomputes_the_max() {
    let mut p = Particles::<f64>::new();
    let r = |v| Radius::new(v).unwrap();
    p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), r(0.1));
    let big = p.add_circle(Vec2::ZERO, Vec2::ZERO, kg(1.0), r(0.5));
    assert!(p.pop_if_last(big));
    assert_eq!((p.radius(), p.max_radius()), (&[0.1][..], 0.1));
}

// From the full cargo-mutants run: `nearest_dynamic`'s radius test and
// tie-break, and `is_empty`, could change unnoticed.

#[test]
fn is_empty_is_false_once_a_particle_is_added() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    assert!(!p.is_empty());
}

#[test]
fn nearest_dynamic_compares_squared_distances_within_the_radius() {
    let mut p = Particles::<f64>::new();
    // 2.8 m away (d² = 7.84) inside a 3 m radius (r² = 9): found. Testing
    // against 2r = 6 or r/r = 1 instead of r² would miss it.
    let far = p.add(Vec2::new(2.8, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!(p.nearest_dynamic(Vec2::ZERO, 3.0), Some(far));
    assert_eq!(p.nearest_dynamic(Vec2::ZERO, 2.7), None);
}

#[test]
fn nearest_dynamic_breaks_a_tie_by_the_first_added() {
    let mut p = Particles::<f64>::new();
    let first = p.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let _ = p.add(Vec2::new(-1.0, 0.0), Vec2::ZERO, kg(1.0));
    assert_eq!(p.nearest_dynamic(Vec2::ZERO, 2.0), Some(first));
}
