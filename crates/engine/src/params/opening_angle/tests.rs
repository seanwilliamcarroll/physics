use super::OpeningAngle;

#[test]
fn negative_or_nan_theta_is_rejected() {
    let new = OpeningAngle::<f64>::new;
    assert!(new(-0.1).is_none());
    assert!(new(f64::NAN).is_none());
    assert!(new(0.0).is_some());
    assert_eq!(new(0.5).map(|t| t.cast::<f32>().get()), Some(0.5_f32));
    assert!(new(0.5).is_some());
}
