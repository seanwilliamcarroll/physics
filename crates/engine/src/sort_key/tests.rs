use super::{f64_key, index_key, sort, u64_from_key, u64_key};

#[test]
fn index_keys_keep_the_order_of_indices() {
    // Sorted on 32- and 64-bit alike (wasm32 runs this too).
    let indices = [0, 1, 7, usize::MAX >> 1, usize::MAX];
    for pair in indices.windows(2) {
        assert!(index_key(pair[0]) <= index_key(pair[1]), "{pair:?}");
    }
    // Only a 64-bit index can exceed i64 (wasm32's all fit).
    if usize::BITS == 64 {
        assert_eq!(index_key(usize::MAX), i64::MAX, "saturates");
    }
}

#[test]
fn sorts_lexicographically() {
    let mut keys = vec![(1, 0, 5), (0, 9, 1), (1, -1, 0), (0, 9, 0)];
    sort(&mut keys);
    assert_eq!(keys, [(0, 9, 0), (0, 9, 1), (1, -1, 0), (1, 0, 5)]);
}

#[test]
fn u64_keys_keep_order_and_round_trip() {
    let values = [
        0,
        1,
        u64::from(u32::MAX),
        1 << 32,
        (1 << 32) + 1,
        u64::MAX - 1,
        u64::MAX,
    ];
    for pair in values.windows(2) {
        assert!(u64_key(pair[0]) < u64_key(pair[1]), "{pair:?}");
    }
    for value in values {
        let (high, low) = u64_key(value);
        assert_eq!(u64_from_key(high, low), value);
    }
}

#[test]
fn f64_keys_follow_total_cmp() {
    let values = [
        f64::NEG_INFINITY,
        -1e300,
        -1.0,
        -f64::MIN_POSITIVE,
        -0.0,
        0.0,
        f64::MIN_POSITIVE,
        1.0,
        1e300,
        f64::INFINITY,
        f64::NAN,
    ];
    for (index, left) in values.iter().enumerate() {
        for right in &values[index..] {
            assert_eq!(
                f64_key(*left).cmp(&f64_key(*right)),
                left.total_cmp(right),
                "{left} vs {right}"
            );
        }
    }
}
