use super::{f64_key, index_key, sort, u64_from_key, u64_key};

#[test]
fn index_keys_keep_the_order_of_indices() {
    // Sorted on 32- and 64-bit alike (wasm32 runs this too).
    let ix = [0, 1, 7, usize::MAX >> 1, usize::MAX];
    for w in ix.windows(2) {
        assert!(index_key(w[0]) <= index_key(w[1]), "{w:?}");
    }
    assert_eq!(index_key(usize::MAX), i64::MAX, "saturates");
}

#[test]
fn sorts_lexicographically() {
    let mut keys = vec![(1, 0, 5), (0, 9, 1), (1, -1, 0), (0, 9, 0)];
    sort(&mut keys);
    assert_eq!(keys, [(0, 9, 0), (0, 9, 1), (1, -1, 0), (1, 0, 5)]);
}

#[test]
fn u64_keys_keep_order_and_round_trip() {
    let ks = [
        0,
        1,
        u64::from(u32::MAX),
        1 << 32,
        (1 << 32) + 1,
        u64::MAX - 1,
        u64::MAX,
    ];
    for w in ks.windows(2) {
        assert!(u64_key(w[0]) < u64_key(w[1]), "{w:?}");
    }
    for k in ks {
        let (hi, lo) = u64_key(k);
        assert_eq!(u64_from_key(hi, lo), k);
    }
}

#[test]
fn f64_keys_follow_total_cmp() {
    let xs = [
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
    for (i, a) in xs.iter().enumerate() {
        for b in &xs[i..] {
            assert_eq!(f64_key(*a).cmp(&f64_key(*b)), a.total_cmp(b), "{a} vs {b}");
        }
    }
}
