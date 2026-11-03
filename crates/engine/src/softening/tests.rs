use super::Softening;

#[test]
fn accepts_zero_and_positive() {
    assert_eq!(Softening::new(0.0_f64).map(Softening::squared), Some(0.0));
    assert_eq!(Softening::new(0.5_f64).map(Softening::squared), Some(0.25));
    assert_eq!(Softening::<f32>::ZERO.squared(), 0.0);
}

#[test]
fn rejects_negative_and_nan() {
    assert_eq!(Softening::new(-0.1_f64), None);
    // NaN fails every comparison, so `eps >= 0` rejects it too.
    assert_eq!(Softening::new(f64::NAN), None);
}

#[test]
fn reads_back_epsilon() {
    assert_eq!(Softening::new(0.1_f32).map(Softening::get), Some(0.1));
}
