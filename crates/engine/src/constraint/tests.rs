use super::{Constraint, DistanceConstraint};
use crate::params::kg;
use crate::{Particles, Vec2};

fn two_bodies() -> (Particles<f64>, crate::ParticleId, crate::ParticleId) {
    let mut p = Particles::new();
    let a = p.add_static(Vec2::new(1.0, 1.0));
    let b = p.add(Vec2::new(4.0, 5.0), Vec2::ZERO, kg(2.0));
    (p, a, b)
}

#[test]
fn between_takes_its_length_from_the_current_positions() {
    let (p, a, b) = two_bodies();
    let c = DistanceConstraint::between(&p, a, b).unwrap();
    assert_eq!(c.length(), 5.0); // 3-4-5
    assert_eq!(c.bodies(), [a, b]);
    assert_eq!(c.compliance(), 0.0, "rigid only in M3");
}

#[test]
fn between_rejects_one_body_twice_or_an_unknown_body() {
    let (p, a, _) = two_bodies();
    assert!(DistanceConstraint::between(&p, a, a).is_none());
    let (mut other, _, _) = two_bodies();
    let foreign = other.add_static(Vec2::ZERO); // index 2: not in `p`
    assert!(DistanceConstraint::between(&p, a, foreign).is_none());
}

#[test]
fn evaluate_gives_stretch_and_the_direction_from_a_to_b() {
    let (p, a, b) = two_bodies();
    let c = DistanceConstraint::between(&p, a, b).unwrap();
    // Stretched to 10 along the same 3-4-5 direction.
    let (value, grad) = c.evaluate(Vec2::new(1.0, 1.0), Vec2::new(7.0, 9.0));
    assert_eq!(value, 5.0);
    assert_eq!(grad, Some(Vec2::new(0.6, 0.8)));
    // Compressed: negative C, same direction.
    let (value, _) = c.evaluate(Vec2::new(1.0, 1.0), Vec2::new(2.5, 3.0));
    assert_eq!(value, -2.5);
}

#[test]
fn coincident_bodies_have_an_error_but_no_direction() {
    let (p, a, b) = two_bodies();
    let c = DistanceConstraint::between(&p, a, b).unwrap();
    let x = Vec2::new(2.0, 2.0);
    assert_eq!(c.evaluate(x, x), (-5.0, None));
}

#[test]
fn with_length_takes_an_explicit_length_and_compliance() {
    use crate::Compliance;
    let (p, a, b) = two_bodies();
    let soft = Compliance::new(0.01).unwrap();
    let c = DistanceConstraint::with_length(&p, a, b, 0.0, soft).unwrap();
    assert_eq!((c.length(), c.compliance()), (0.0, 0.01));
    // Rest length 0, bodies 5 m apart: stretched by the full distance.
    assert_eq!(
        c.evaluate(*p.pos().first().unwrap(), *p.pos().last().unwrap())
            .0,
        5.0
    );
    assert!(
        DistanceConstraint::with_length(&p, a, b, -1.0, soft).is_none(),
        "negative length"
    );
    assert!(
        DistanceConstraint::with_length(&p, a, b, f64::NAN, soft).is_none(),
        "NaN length"
    );
    assert!(
        DistanceConstraint::with_length(&p, a, a, 1.0, soft).is_none(),
        "same body"
    );
}
