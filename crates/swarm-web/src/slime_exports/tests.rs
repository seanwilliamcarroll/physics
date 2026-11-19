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
    for (side, agent_count, scale) in [
        (0, 10, 2),
        (abi::MAX_SLIME_SIDE + 1, 10, 2),
        (64, 0, 2),
        (64, abi::MAX_AGENTS + 1, 2),
        (64, 10, 5),
    ] {
        assert!(
            slime_new(side, agent_count, scale, 1).is_null(),
            "{side} {agent_count} {scale}"
        );
    }
    let demo = slime_new(64, 500, 2, 1);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `slime_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!((slime_view(demo), slime_len(demo)), (128, 500));
        assert_eq!(
            (
                slime_add_node(demo, 10.0, 10.0, 20.0),
                slime_add_node(demo, -1.0, 0.0, 1.0)
            ),
            (1, 0)
        );
        slime_clear_nodes(demo);
        assert_eq!(
            (slime_set_sensing(demo, 0), slime_set_sensing(demo, 2)),
            (1, 0)
        );
        assert_eq!(
            (
                slime_set_param(demo, abi::SLIME_DECAY, 0.2),
                slime_set_param(demo, abi::SLIME_DECAY, 3.0)
            ),
            (1, 0)
        );
        assert!(slime_param(demo, abi::SLIME_PARAM_COUNT).is_nan());
        assert_eq!(
            (
                slime_set_rate(demo, 30),
                slime_set_step_cap(demo, 2),
                slime_advance(demo, 0.25)
            ),
            (1, 1, 2)
        );
        let concentration = slime_concentration(demo);
        assert!((0.0..=1.0).contains(&concentration), "{concentration}");
        assert!(!slime_render(demo).is_null());
        slime_free(demo);
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

fn hostile() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(-5.0..70.0)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        2 => (0_u32..9, hostile()).prop_map(|(code, value)| Call::Param(code, value)),
        2 => (hostile(), hostile(), hostile()).prop_map(|(x, y, amount)| Call::Node(x, y, amount)),
        1 => Just(Call::Clear),
        1 => (0_u32..3).prop_map(Call::Sensing),
        1 => Just(Call::Render),
    ]
}

fn run(agent_count: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let demo = slime_new(48, agent_count, 1, 3);
    prop_assert!(!demo.is_null());
    // SAFETY: `demo` is live until freed at the end, once.
    unsafe {
        for action in calls {
            match *action {
                Call::Advance(seconds) => {
                    prop_assert!(slime_advance(demo, seconds) <= abi::MAX_RATE_HZ / 4 + 1);
                }
                Call::Param(code, value) => prop_assert!(slime_set_param(demo, code, value) <= 1),
                Call::Node(x, y, amount) => prop_assert!(slime_add_node(demo, x, y, amount) <= 1),
                Call::Clear => slime_clear_nodes(demo),
                Call::Sensing(on) => prop_assert!(slime_set_sensing(demo, on) <= 1),
                Call::Render => prop_assert!(!slime_render(demo).is_null()),
            }
            prop_assert_eq!(slime_len(demo), agent_count);
            for code in 0..abi::SLIME_PARAM_COUNT {
                prop_assert!(
                    slime_param(demo, code).is_finite(),
                    "param {} after {:?}",
                    code,
                    action
                );
            }
            let concentration = slime_concentration(demo);
            prop_assert!(
                (0.0..=1.0 + 1e-9).contains(&concentration),
                "{} after {:?}",
                concentration,
                action
            );
        }
        slime_free(demo);
    }
    Ok(())
}

/// A node depositing 2.6e38 a step (finite as `f32`) used to overflow the
/// field to infinity and read NaN; amounts are capped (`swarm::MAX_DEPOSIT`).
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
    run(
        50,
        &[Call::Param(abi::SLIME_DEPOSIT, 3.0e38), Call::Advance(0.8)],
    )
    .unwrap();
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(agent_count in 1_u32..200, calls in prop::collection::vec(call(), 0..25)) {
        run(agent_count, &calls)?;
    }
}
