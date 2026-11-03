use super::Stiffness;

#[test]
fn accepts_positive_finite_only() {
    assert_eq!(Stiffness::new(100.0_f64).map(Stiffness::get), Some(100.0));
    for bad in [0.0, -1.0, f64::NAN, f64::INFINITY] {
        assert!(Stiffness::new(bad).is_none(), "{bad}");
    }
}

#[test]
fn cast_fails_where_the_target_would_overflow() {
    let k = Stiffness::new(1e39_f64).unwrap();
    assert!(k.cast::<f32>().is_none(), "1e39 is +inf in f32");
    assert_eq!(
        Stiffness::new(1e4_f64)
            .unwrap()
            .cast::<f32>()
            .map(Stiffness::get),
        Some(1e4_f32)
    );
}
