use super::Particles;
use crate::Vec2;

#[test]
fn starts_empty() {
    let p = Particles::<f64>::new();
    assert_eq!(p.len(), 0);
    assert!(p.is_empty());
}

#[test]
fn add_stores_inverse_mass() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::new(1.0, 2.0), Vec2::new(3.0, 4.0), 4.0);
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
    p.add(Vec2::ZERO, Vec2::ZERO, 1.0);
    p.vel_mut()[0] = Vec2::new(7.0, 0.0);
    assert_eq!(p.vel(), &[Vec2::new(7.0, 0.0)]);
}
