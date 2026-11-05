use super::{
    EXACT_LIMIT, clamped_index, f64_to_f32, f64_to_usize, samples, u64_to_f64, usize_to_f64,
};

#[test]
fn counts_round_trip_exactly_below_the_limit() {
    for n in [0_usize, 1, 2, 4095, 48_000, 1 << 31, usize::MAX >> 12] {
        let x = usize_to_f64(n);
        if x < EXACT_LIMIT {
            assert_eq!(f64_to_usize(x), Some(n), "{n}");
        }
    }
    assert_eq!(u64_to_f64(1 << 52), 4_503_599_627_370_496.0);
}

#[test]
fn the_limit_is_two_to_the_53_or_narrower() {
    let expected = if usize::BITS < 53 {
        2_f64.powi(32)
    } else {
        2_f64.powi(53)
    };
    assert_eq!(EXACT_LIMIT, expected);
}

/// Where `as` would saturate silently, `f64_to_usize` says `None`.
#[test]
fn not_a_count_is_none() {
    for x in [
        f64::NAN,
        -1.0,
        -0.5,
        f64::INFINITY,
        f64::NEG_INFINITY,
        EXACT_LIMIT,
        1e300,
    ] {
        assert_eq!(f64_to_usize(x), None, "{x}");
    }
    assert_eq!(f64_to_usize(-0.0), Some(0));
}

/// Truncation toward zero, exactly as `as` does it: callers that floor or
/// round first keep their values.
#[test]
fn truncates_like_as() {
    for x in [0.0, 0.4, 0.99, 1.0, 1.5, 2.999_999, 123_456.7] {
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "the reference behavior"
        )]
        let reference = x as usize;
        assert_eq!(f64_to_usize(x), Some(reference), "{x}");
    }
}

#[test]
fn samples_are_the_truncated_product() {
    assert_eq!(samples(0.5, 48_000.0), Some(24_000));
    assert_eq!(samples(1.0 / 3.0, 48_000.0), Some(16_000));
    assert_eq!(samples(f64::NAN, 48_000.0), None);
    assert_eq!(samples(-1.0, 48_000.0), None);
}

#[test]
fn clamped_index_clamps_by_name() {
    assert_eq!(clamped_index(-3.0, 10), 0);
    assert_eq!(clamped_index(f64::NAN, 10), 0);
    assert_eq!(clamped_index(4.7, 10), 4);
    assert_eq!(clamped_index(10.0, 10), 10);
    assert_eq!(clamped_index(1e300, 10), 10);
    assert_eq!(clamped_index(f64::INFINITY, 10), 10);
}

#[test]
fn f32_is_the_nearest() {
    assert_eq!(f64_to_f32(0.1), 0.1_f32);
    assert!(f64_to_f32(1e300).is_infinite());
    assert!(f64_to_f32(f64::NAN).is_nan());
}
