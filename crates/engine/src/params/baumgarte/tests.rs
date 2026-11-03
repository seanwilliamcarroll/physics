use super::{Baumgarte, DEFAULT_BAUMGARTE};

#[test]
fn baumgarte_accepts_zero_to_one() {
    assert_eq!(Baumgarte::new(0.0_f64).map(Baumgarte::get), Some(0.0));
    assert_eq!(Baumgarte::new(1.0_f64).map(Baumgarte::get), Some(1.0));
    assert!(Baumgarte::new(DEFAULT_BAUMGARTE).is_some());
}

#[test]
fn baumgarte_rejects_overshoot_negative_and_nan() {
    assert!(
        Baumgarte::new(1.01_f64).is_none(),
        "asks for more than the error"
    );
    assert!(Baumgarte::new(-0.1_f64).is_none());
    assert!(Baumgarte::new(f64::NAN).is_none());
}

#[test]
fn baumgarte_casts_without_rechecking() {
    let b = Baumgarte::new(0.2_f64).unwrap().cast::<f32>();
    assert_eq!(b.get(), 0.2_f32);
}
