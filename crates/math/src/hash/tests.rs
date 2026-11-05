use super::Fnv1a;

#[test]
fn fnv1a_matches_reference_values() {
    // Published FNV-1a 64 test vectors, cross-checked with an independent
    // Python implementation.
    for (input, expect) in [
        (&b""[..], 0xcbf2_9ce4_8422_2325_u64),
        (&b"a"[..], 0xaf63_dc4c_8601_ec8c),
        (&b"foobar"[..], 0x8594_4171_f739_67e8),
    ] {
        let mut h = Fnv1a::new();
        h.write(input);
        assert_eq!(h.finish(), expect, "{input:?}");
    }
}
