//! The build settings' parsing: run at compile time in the build, so here
//! as plain calls (a bad setting's panic is the build error).

use super::{Mask, Sum, Tail, choice, lanes, mask, number, same, sum, tail};

#[test]
fn the_settings_parse_and_default() {
    assert_eq!(lanes(None), None);
    assert_eq!(lanes(Some("1")), Some(1));
    assert_eq!(lanes(Some("16")), Some(16));
    assert_eq!(lanes(Some("64")), Some(64));
    assert_eq!(sum(None), Sum::Ordered);
    assert_eq!(sum(Some("ordered")), Sum::Ordered);
    assert_eq!(sum(Some("algebraic")), Sum::Algebraic);
    assert_eq!(mask(None), None);
    for (text, m) in [
        ("convert", Mask::Convert),
        ("select", Mask::Select),
        ("bits", Mask::Bits),
        ("value", Mask::Value),
        ("branch", Mask::Branch),
    ] {
        assert_eq!(mask(Some(text)), Some(m));
    }
}

#[test]
fn two_way_settings_parse_and_default_unset() {
    assert_eq!(choice(None, "SWARM_SPAN", b"per-span", b"per-boid"), None);
    assert_eq!(
        choice(Some("per-span"), "SWARM_SPAN", b"per-span", b"per-boid"),
        Some(false)
    );
    assert_eq!(
        choice(Some("per-boid"), "SWARM_SPAN", b"per-span", b"per-boid"),
        Some(true)
    );
}

#[test]
#[should_panic(expected = "SWARM_SPAN")]
fn a_two_way_setting_must_be_one_of_its_two() {
    choice(Some("both"), "SWARM_SPAN", b"per-span", b"per-boid");
}

#[test]
fn the_tail_parses() {
    assert_eq!(tail(None), None);
    assert_eq!(tail(Some("scalar")), Some(Tail::Scalar));
    assert_eq!(tail(Some("masked")), Some(Tail::Masked));
    assert_eq!(tail(Some("table")), Some(Tail::Table));
}

#[test]
#[should_panic(expected = "SWARM_TAIL")]
fn the_tail_must_be_one_of_the_three() {
    tail(Some("vector"));
}

#[test]
#[should_panic(expected = "SWARM_MASK")]
fn the_mask_must_be_one_of_the_five() {
    mask(Some("fast"));
}

/// Every digit counts, in place: a wrong operator or place value gives
/// another number.
#[test]
fn numbers_are_decimal() {
    assert_eq!(number("0"), Some(0));
    assert_eq!(number("7"), Some(7));
    assert_eq!(number("16"), Some(16));
    assert_eq!(number("305"), Some(305));
    assert_eq!(number(""), None);
    assert_eq!(number("8x"), None);
    assert_eq!(number("x8"), None);
    assert_eq!(number("-1"), None);
}

/// Up to a thousand, and no further: a long string stops early rather
/// than overflowing.
#[test]
fn numbers_stop_at_a_thousand() {
    assert_eq!(number("1000"), Some(1_000));
    assert_eq!(number("1001"), None);
    assert_eq!(number("99999999999999999999999999"), None);
}

#[test]
fn same_compares_every_byte() {
    assert!(same(b"", b""));
    assert!(same(b"ordered", b"ordered"));
    assert!(!same(b"ordered", b"ordereD"));
    assert!(!same(b"ordered", b"order"));
    assert!(!same(b"", b"a"));
}

#[test]
#[should_panic(expected = "not a power of two")]
fn lanes_must_be_a_power_of_two() {
    lanes(Some("12"));
}

#[test]
#[should_panic(expected = "at most 64")]
fn lanes_are_at_most_64() {
    lanes(Some("128"));
}

#[test]
#[should_panic(expected = "SWARM_LANES: not a number")]
fn lanes_must_be_a_number() {
    lanes(Some("8x"));
}

#[test]
#[should_panic(expected = "`ordered` or `algebraic`")]
fn the_sum_must_be_one_of_the_two() {
    sum(Some("fast"));
}
