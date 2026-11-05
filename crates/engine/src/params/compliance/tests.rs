use super::Compliance;

#[test]
fn accepts_zero_and_positive_rejects_negative_and_nan() {
    assert_eq!(Compliance::new(0.0_f64).map(Compliance::get), Some(0.0));
    assert_eq!(Compliance::new(0.01_f64).map(Compliance::get), Some(0.01));
    assert!(Compliance::new(-1e-9_f64).is_none());
    assert!(Compliance::new(f64::NAN).is_none());
    assert_eq!(Compliance::<f32>::RIGID.get(), 0.0);
}

/// The audit's bug: `α = ∞` passed `α ≥ 0`, and XPBD's `α̃ · λ` with `λ = 0`
/// is `∞ · 0 = NaN`. Refused now, and so is a finite `f64` α that
/// overflows to `+∞` when cast to `f32`.
#[test]
fn infinite_compliance_is_refused() {
    assert!(Compliance::new(f64::INFINITY).is_none());
    assert!(Compliance::new(f32::INFINITY).is_none());
    assert!(Compliance::new(1e39_f64).unwrap().cast::<f32>().is_none());
    assert_eq!(
        Compliance::new(1e-3_f64)
            .unwrap()
            .cast::<f32>()
            .map(Compliance::get),
        Some(1e-3_f32)
    );
}
