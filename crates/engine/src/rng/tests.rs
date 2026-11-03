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
