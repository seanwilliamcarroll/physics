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
