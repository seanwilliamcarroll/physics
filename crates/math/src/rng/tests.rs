use super::{GOLDEN_GAMMA, MANTISSA_SHIFT, ONE_BITS, SplitMix64};

#[test]
fn named_constants_match_their_definitions() {
    // 2⁶⁴/φ in f64 carries 53 significant bits; GOLDEN_GAMMA must agree
    // to that precision (within 2¹² of a 64-bit value).
    let phi = f64::midpoint(1.0, 5.0_f64.sqrt());
    let ideal = 2.0_f64.powi(64) / phi;
    #[expect(clippy::cast_precision_loss, reason = "comparing at f64 precision")]
    let gamma = GOLDEN_GAMMA as f64;
    assert!((gamma - ideal).abs() <= 4096.0, "{gamma} vs {ideal}");
    assert_eq!(GOLDEN_GAMMA % 2, 1, "must be odd for a full period");
    assert_eq!(ONE_BITS, 0x3ff0_0000_0000_0000);
    assert_eq!(MANTISSA_SHIFT, 12);
}

#[test]
fn matches_reference_sequence() {
    // Reference values from an independent Python implementation of
    // the published algorithm; seed 0's first output is the commonly
    // cited 0xe220a8397b1dcdaf.
    let mut r = SplitMix64::new(0);
    assert_eq!(r.next_u64(), 0xe220_a839_7b1d_cdaf);
    assert_eq!(r.next_u64(), 0x6e78_9e6a_a1b9_65f4);
    assert_eq!(r.next_u64(), 0x06c4_5d18_8009_454f);
    let mut r = SplitMix64::new(42);
    assert_eq!(r.next_u64(), 0xbdd7_3226_2feb_6e95);
}

#[test]
fn unit_f64_is_in_half_open_unit_interval() {
    let mut r = SplitMix64::new(7);
    for _ in 0..10_000 {
        let u = r.next_unit_f64();
        assert!((0.0..1.0).contains(&u), "{u}");
    }
}

#[test]
fn range_maps_unit_interval_onto_bounds() {
    let mut r = SplitMix64::new(7);
    for _ in 0..10_000 {
        let x = r.range(-2.0, 3.0);
        assert!((-2.0..3.0).contains(&x), "{x}");
    }
}

// From the full cargo-mutants run: `next_unit_f64` and `range` returning a
// constant (or `range` adding instead of subtracting) went unnoticed by
// math's own tests; only other crates' scenes used them.

#[test]
fn unit_floats_and_ranges_match_the_reference() {
    // From the first two outputs of seed 0 (above), by the same bit trick
    // in an independent Python implementation.
    let mut r = SplitMix64::new(0);
    assert_eq!(
        r.next_unit_f64().to_bits(),
        0.883_310_808_213_642_5_f64.to_bits()
    );
    assert_eq!(
        r.range(-2.0, 6.0).to_bits(),
        1.452_223_976_388_079_8_f64.to_bits()
    );
}

#[test]
fn ranges_cover_their_interval() {
    let mut r = SplitMix64::new(7);
    let xs: Vec<f64> = (0..10_000).map(|_| r.range(-3.0, 5.0)).collect();
    assert!(xs.iter().all(|x| (-3.0..5.0).contains(x)));
    let (lo, hi) = xs
        .iter()
        .fold((f64::MAX, f64::MIN), |(lo, hi), &x| (lo.min(x), hi.max(x)));
    assert!(lo < -2.99 && hi > 4.99, "spans [{lo}, {hi}]");
}
