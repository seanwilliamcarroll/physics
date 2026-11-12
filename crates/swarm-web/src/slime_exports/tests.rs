//! The Physarum exports: a round trip, the boundary, and random call
//! sequences (no panic, statuses 0 or 1, the count fixed, every constant
//! finite, concentration in [0, 1]).

use core::ptr;

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::{
    slime_add_node, slime_advance, slime_clear_nodes, slime_concentration, slime_free, slime_len,
    slime_new, slime_param, slime_render, slime_set_param, slime_set_rate, slime_set_sensing,
    slime_set_step_cap, slime_view,
};
use crate::abi;

#[test]
fn round_trip_and_the_boundary() {
    for (side, n, scale) in [
        (0, 10, 2),
        (abi::MAX_SLIME_SIDE + 1, 10, 2),
        (64, 0, 2),
        (64, abi::MAX_AGENTS + 1, 2),
        (64, 10, 5),
    ] {
        assert!(slime_new(side, n, scale, 1).is_null(), "{side} {n} {scale}");
    }
    let d = slime_new(64, 500, 2, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `slime_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!((slime_view(d), slime_len(d)), (128, 500));
        assert_eq!(
            (
                slime_add_node(d, 10.0, 10.0, 20.0),
                slime_add_node(d, -1.0, 0.0, 1.0)
            ),
            (1, 0)
        );
        slime_clear_nodes(d);
        assert_eq!((slime_set_sensing(d, 0), slime_set_sensing(d, 2)), (1, 0));
        assert_eq!(
            (
                slime_set_param(d, abi::SLIME_DECAY, 0.2),
                slime_set_param(d, abi::SLIME_DECAY, 3.0)
            ),
            (1, 0)
        );
        assert!(slime_param(d, abi::SLIME_PARAM_COUNT).is_nan());
        assert_eq!(
            (
                slime_set_rate(d, 30),
                slime_set_step_cap(d, 2),
                slime_advance(d, 0.25)
            ),
            (1, 1, 2)
        );
        let c = slime_concentration(d);
        assert!((0.0..=1.0).contains(&c), "{c}");
        assert!(!slime_render(d).is_null());
        slime_free(d);
        let null = ptr::null_mut();
        assert_eq!(
            (
                slime_advance(null, 1.0),
                slime_len(null),
                slime_add_node(null, 1.0, 1.0, 1.0)
            ),
            (0, 0, 0)
        );
        assert!(slime_concentration(null).is_nan() && slime_render(null).is_null());
        slime_clear_nodes(null);
        slime_free(null);
    }
}

#[derive(Clone, Debug)]
enum Call {
    Advance(f64),
    Param(u32, f64),
    Node(f64, f64, f64),
    Clear,
    Sensing(u32),
    Render,
}

/// What a page could pass (`test_support::hostile_f64`), around this
/// module's usual values.
fn hostile() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(-5.0..70.0)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        2 => (0_u32..9, hostile()).prop_map(|(c, v)| Call::Param(c, v)),
        2 => (hostile(), hostile(), hostile()).prop_map(|(x, y, a)| Call::Node(x, y, a)),
        1 => Just(Call::Clear),
        1 => (0_u32..3).prop_map(Call::Sensing),
        1 => Just(Call::Render),
    ]
}

fn run(n: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let d = slime_new(48, n, 1, 3);
    prop_assert!(!d.is_null());
    // SAFETY: `d` is live until freed at the end, once.
    unsafe {
        for c in calls {
            match *c {
                Call::Advance(t) => prop_assert!(slime_advance(d, t) <= abi::MAX_RATE_HZ / 4 + 1),
                Call::Param(code, v) => prop_assert!(slime_set_param(d, code, v) <= 1),
                Call::Node(x, y, a) => prop_assert!(slime_add_node(d, x, y, a) <= 1),
                Call::Clear => slime_clear_nodes(d),
                Call::Sensing(on) => prop_assert!(slime_set_sensing(d, on) <= 1),
                Call::Render => prop_assert!(!slime_render(d).is_null()),
            }
            prop_assert_eq!(slime_len(d), n);
            for code in 0..abi::SLIME_PARAM_COUNT {
                prop_assert!(
                    slime_param(d, code).is_finite(),
                    "param {} after {:?}",
                    code,
                    c
                );
            }
            let conc = slime_concentration(d);
            prop_assert!((0.0..=1.0 + 1e-9).contains(&conc), "{} after {:?}", conc, c);
        }
        slime_free(d);
    }
    Ok(())
}

/// Found by the slow tier (10 000 cases): a node depositing 2.6e38 a step,
/// finite as an `f32`, overflowed the field to infinity in a few steps,
/// and the concentration read NaN. Amounts are capped now
/// (`swarm::MAX_DEPOSIT`).
#[test]
fn a_huge_node_cannot_overflow_the_field() {
    run(
        1,
        &[
            Call::Node(f64::MIN_POSITIVE, 0.0, 2.593_750_769_286_037_5e38),
            Call::Advance(0.818_942_818_578_819_2),
        ],
    )
    .unwrap();
    // The same through the agents' own deposit.
    run(
        50,
        &[Call::Param(abi::SLIME_DEPOSIT, 3.0e38), Call::Advance(0.8)],
    )
    .unwrap();
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(n in 1_u32..200, calls in prop::collection::vec(call(), 0..25)) {
        run(n, &calls)?;
    }
}
