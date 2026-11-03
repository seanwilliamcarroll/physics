use super::Radius;

#[test]
fn accepts_positive_finite_only() {
    assert_eq!(Radius::new(0.05_f64).map(Radius::get), Some(0.05));
    assert!(Radius::new(0.0_f64).is_none(), "0 is a point, not a circle");
    assert!(Radius::new(-0.1_f64).is_none());
    assert!(Radius::new(f64::NAN).is_none());
    assert!(Radius::new(f64::INFINITY).is_none());
}

#[test]
fn cast_rechecks_finiteness() {
    let r = Radius::new(0.25_f64).unwrap();
    assert_eq!(r.cast::<f32>().map(Radius::get), Some(0.25_f32));
    assert!(Radius::new(1e39_f64).unwrap().cast::<f32>().is_none());
}
