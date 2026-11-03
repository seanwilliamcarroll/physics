use super::Restitution;

#[test]
fn accepts_zero_to_one_rejects_outside_and_nan() {
    assert_eq!(Restitution::new(0.0_f64).map(Restitution::get), Some(0.0));
    assert_eq!(Restitution::new(0.5_f64).map(Restitution::get), Some(0.5));
    assert_eq!(Restitution::new(1.0_f64).map(Restitution::get), Some(1.0));
    assert!(Restitution::new(1.0001_f64).is_none());
    assert!(Restitution::new(-0.1_f64).is_none());
    assert!(Restitution::new(f64::NAN).is_none());
    assert_eq!(Restitution::<f32>::ELASTIC.get(), 1.0);
    assert_eq!(Restitution::<f32>::INELASTIC.get(), 0.0);
}
