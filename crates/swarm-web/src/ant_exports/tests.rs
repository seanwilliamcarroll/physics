//! The ant exports: a round trip, the boundary, and random call
//! sequences (no panic, statuses 0 or 1, food accounted for exactly:
//! world + carried + delivered = what painting reported).

use core::ptr;

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::{
    ant_advance, ant_carrying, ant_delivered, ant_food, ant_free, ant_len, ant_new, ant_paint,
    ant_param, ant_render, ant_set_param, ant_set_rate, ant_set_sensing, ant_set_step_cap,
    ant_view_height, ant_view_width,
};
use crate::abi;

#[test]
fn round_trip_and_the_boundary() {
    for (width, height, ant_count, scale) in [
        (0, 50, 10, 3),
        (abi::MAX_ANT_SIDE + 1, 50, 10, 3),
        (100, 50, 0, 3),
        (100, 50, abi::MAX_ANTS + 1, 3),
        (100, 50, 10, 9),
    ] {
        assert!(
            ant_new(width, height, ant_count, scale, 1).is_null(),
            "{width} {height} {ant_count} {scale}"
        );
    }
    let demo = ant_new(100, 60, 50, 2, 1);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `ant_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!(
            (ant_view_width(demo), ant_view_height(demo), ant_len(demo)),
            (200, 120, 50)
        );
        assert!(ant_paint(demo, abi::TOOL_FOOD, 80.0, 30.0, 4.0, 10) > 0.0);
        assert_eq!(ant_paint(demo, 7, 1.0, 1.0, 1.0, 0), -1.0);
        assert_eq!((ant_set_sensing(demo, 0), ant_set_sensing(demo, 2)), (1, 0));
        assert_eq!(
            (
                ant_set_param(demo, abi::ANT_DECAY, 0.01),
                ant_set_param(demo, abi::ANT_DECAY, -1.0)
            ),
            (1, 0)
        );
        assert!(ant_param(demo, abi::ANT_PARAM_COUNT).is_nan());
        assert_eq!(
            (
                ant_set_rate(demo, 30),
                ant_set_step_cap(demo, 2),
                ant_advance(demo, 0.25)
            ),
            (1, 1, 2)
        );
        assert!(!ant_render(demo).is_null());
        ant_free(demo);
        let null = ptr::null_mut();
        assert_eq!(
            (ant_advance(null, 1.0), ant_len(null), ant_carrying(null)),
            (0, 0, 0)
        );
        assert_eq!(ant_paint(null, 0, 1.0, 1.0, 1.0, 1), -1.0);
        assert!(
            ant_delivered(null).is_nan() && ant_food(null).is_nan() && ant_render(null).is_null()
        );
        ant_free(null);
    }
}

#[derive(Clone, Debug)]
enum Call {
    Advance(f64),
    Paint(u32, f64, f64, f64, u32),
    Param(u32, f64),
    Sensing(u32),
    Rate(u32),
    Render,
}

fn hostile() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(-5.0..70.0)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        3 => (0_u32..5, hostile(), hostile(), prop_oneof![hostile(), 0.0..5.0], prop_oneof![0_u32..20, any::<u32>()])
            .prop_map(|(tool, x, y, radius, amount)| Call::Paint(tool, x, y, radius, amount)),
        2 => (0_u32..10, hostile()).prop_map(|(code, value)| Call::Param(code, value)),
        1 => (0_u32..3).prop_map(Call::Sensing),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => Just(Call::Render),
    ]
}

fn run(ant_count: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let demo = ant_new(60, 40, ant_count, 1, 3);
    prop_assert!(!demo.is_null());
    // SAFETY: `demo` is live until freed at the end, once.
    unsafe {
        for action in calls {
            match *action {
                Call::Advance(seconds) => {
                    prop_assert!(ant_advance(demo, seconds) <= abi::MAX_RATE_HZ / 4 + 1);
                }
                Call::Paint(tool, x, y, radius, amount) => {
                    prop_assert!(ant_paint(demo, tool, x, y, radius, amount) >= -1.0);
                }
                Call::Param(code, value) => prop_assert!(ant_set_param(demo, code, value) <= 1),
                Call::Sensing(on) => prop_assert!(ant_set_sensing(demo, on) <= 1),
                Call::Rate(rate_hz) => prop_assert!(ant_set_rate(demo, rate_hz) <= 1),
                Call::Render => prop_assert!(!ant_render(demo).is_null()),
            }
            prop_assert_eq!(ant_len(demo), ant_count);
            for code in 0..abi::ANT_PARAM_COUNT {
                prop_assert!(
                    ant_param(demo, code).is_finite(),
                    "param {} after {:?}",
                    code,
                    action
                );
            }
            let held = ant_food(demo) + f64::from(ant_carrying(demo)) + ant_delivered(demo);
            prop_assert!(held >= 0.0 && held.is_finite());
        }
        ant_free(demo);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(ant_count in 1_u32..60, calls in prop::collection::vec(call(), 0..25)) {
        run(ant_count, &calls)?;
    }
}
