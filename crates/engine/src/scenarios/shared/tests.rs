#[test]
fn invalid_softening_constant_is_a_config_error() {
    assert_eq!(
        super::softening::<f64>(-0.1),
        Err(crate::ConfigError::InvalidSoftening)
    );
    assert_eq!(
        super::softening::<f32>(f64::NAN),
        Err(crate::ConfigError::InvalidSoftening)
    );
    assert!(
        crate::ConfigError::InvalidSoftening
            .to_string()
            .contains("softening")
    );
}

#[test]
fn invalid_mass_constant_is_a_config_error() {
    use crate::ConfigError::InvalidMass;
    assert_eq!(super::mass::<f64>(0.0), Err(InvalidMass));
    assert_eq!(super::mass::<f64>(-1.0e10), Err(InvalidMass));
    // Positive in f64 but rounds to 0 in f32.
    assert_eq!(super::mass::<f32>(1.0e-50), Err(InvalidMass));
    assert_eq!(super::mass::<f64>(2.0).map(crate::Mass::get), Ok(2.0));
}

/// From the full mutation run of 2026-11-12: only annuli wider than 2 m
/// were drawn, where `outer + outer` (a mutant) is under `outer²` and
/// still keeps points inside. Under 2 m it wouldn't.
#[test]
fn points_in_a_small_annulus_stay_in_it() {
    let mut rng = crate::rng::SplitMix64::new(3);
    for _ in 0..2000 {
        let (x, y) = super::point_in_annulus(&mut rng, 0.2, 0.5);
        let r = (x * x + y * y).sqrt();
        assert!((0.2..=0.5).contains(&r), "({x}, {y}): r = {r}");
    }
}
