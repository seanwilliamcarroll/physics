use math::convert::f64_to_f32;

use super::TimeStep;

#[test]
fn only_positive_finite_steps_exist() {
    assert_eq!(
        TimeStep::new(1.0_f64 / 60.0).map(TimeStep::get),
        Some(1.0 / 60.0)
    );
    for bad in [
        0.0,
        -0.0,
        -1.0 / 60.0,
        f64::NAN,
        f64::INFINITY,
        f64::NEG_INFINITY,
    ] {
        assert!(TimeStep::new(bad).is_none(), "{bad}");
    }
}

#[test]
fn per_second_is_the_inverse_rate() {
    assert_eq!(
        TimeStep::<f64>::per_second(60.0).map(TimeStep::get),
        Some(1.0 / 60.0)
    );
    assert_eq!(
        TimeStep::<f32>::per_second(240.0).map(TimeStep::get),
        Some(f64_to_f32(1.0 / 240.0))
    );
    for bad in [0.0, -60.0, f64::NAN, f64::INFINITY] {
        assert!(TimeStep::<f64>::per_second(bad).is_none(), "{bad}");
    }
}
