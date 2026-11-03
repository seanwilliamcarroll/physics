use super::Damping;

#[test]
fn accepts_zero_and_positive_finite() {
    assert_eq!(Damping::new(0.0_f64).map(Damping::get), Some(0.0));
    assert_eq!(Damping::<f32>::NONE.get(), 0.0);
    for bad in [-0.1, f64::NAN, f64::INFINITY] {
        assert!(Damping::new(bad).is_none(), "{bad}");
    }
    assert!(Damping::new(1e39_f64).unwrap().cast::<f32>().is_none());
}
