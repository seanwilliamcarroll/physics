use super::Compliance;

#[test]
fn accepts_zero_and_positive_rejects_negative_and_nan() {
    assert_eq!(Compliance::new(0.0_f64).map(Compliance::get), Some(0.0));
    assert_eq!(Compliance::new(0.01_f64).map(Compliance::get), Some(0.01));
    assert!(Compliance::new(-1e-9_f64).is_none());
    assert!(Compliance::new(f64::NAN).is_none());
    assert_eq!(Compliance::<f32>::RIGID.get(), 0.0);
}
