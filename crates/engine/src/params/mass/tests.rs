use super::Mass;

#[test]
fn accepts_positive_finite_and_stores_the_inverse() {
    let m = Mass::new(4.0_f64).unwrap();
    assert_eq!((m.get(), m.inv()), (4.0, 0.25));
    // Exactly `1 / m`, as `Particles::add` computed it before `Mass`:
    // the golden hashes depend on these bits.
    assert_eq!(Mass::new(3.0_f64).map(Mass::inv), Some(1.0 / 3.0));
    assert_eq!(Mass::new(3.0_f32).map(Mass::inv), Some(1.0 / 3.0));
}

#[test]
fn one_is_unit_mass() {
    assert_eq!((Mass::<f64>::ONE.get(), Mass::<f64>::ONE.inv()), (1.0, 1.0));
    assert_eq!(Mass::new(1.0_f32), Some(Mass::ONE));
}

#[test]
fn rejects_zero_negative_and_nan() {
    for m in [0.0, -0.0, -1.0, f64::NAN] {
        assert_eq!(Mass::new(m), None, "{m}");
    }
}

#[test]
fn rejects_infinities() {
    assert_eq!(Mass::new(f64::INFINITY), None);
    assert_eq!(Mass::new(f64::NEG_INFINITY), None);
    assert_eq!(Mass::new(f32::INFINITY), None);
}

#[test]
fn rejects_masses_whose_inverse_overflows() {
    // The smallest subnormal: 1 / 4.9e-324 is far past `f64::MAX`.
    assert_eq!(Mass::new(f64::from_bits(1)), None);
    // f32 overflows much sooner: 1 / 1e-39 = 1e39 > `f32::MAX` ≈ 3.4e38.
    assert_eq!(Mass::new(1.0e-39_f32), None);
    // ... but the smallest normal value still has a finite inverse.
    assert!(Mass::new(f64::MIN_POSITIVE).is_some());
    assert!(Mass::new(f32::MIN_POSITIVE).is_some());
}

#[test]
fn accepts_the_largest_finite_mass() {
    // 1 / f64::MAX is subnormal but positive, so not mistaken for static.
    let m = Mass::new(f64::MAX).unwrap();
    assert!(m.inv() > 0.0);
    assert!(Mass::new(f32::MAX).is_some());
}
