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
    for (w, h, n, s) in [
        (0, 50, 10, 3),
        (abi::MAX_ANT_SIDE + 1, 50, 10, 3),
        (100, 50, 0, 3),
        (100, 50, abi::MAX_ANTS + 1, 3),
        (100, 50, 10, 9),
    ] {
        assert!(ant_new(w, h, n, s, 1).is_null(), "{w} {h} {n} {s}");
    }
    let d = ant_new(100, 60, 50, 2, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `ant_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!(
            (ant_view_width(d), ant_view_height(d), ant_len(d)),
            (200, 120, 50)
        );
        assert!(ant_paint(d, abi::TOOL_FOOD, 80.0, 30.0, 4.0, 10) > 0.0);
        assert_eq!(ant_paint(d, 7, 1.0, 1.0, 1.0, 0), -1.0);
        assert_eq!((ant_set_sensing(d, 0), ant_set_sensing(d, 2)), (1, 0));
        assert_eq!(
            (
                ant_set_param(d, abi::ANT_DECAY, 0.01),
                ant_set_param(d, abi::ANT_DECAY, -1.0)
            ),
            (1, 0)
        );
        assert!(ant_param(d, abi::ANT_PARAM_COUNT).is_nan());
        assert_eq!(
            (
                ant_set_rate(d, 30),
                ant_set_step_cap(d, 2),
                ant_advance(d, 0.25)
            ),
            (1, 1, 2)
        );
        assert!(!ant_render(d).is_null());
        ant_free(d);
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
    prop_oneof![
        Just(f64::NAN),
        Just(f64::INFINITY),
        Just(-1.0),
        Just(0.0),
        Just(1e300),
        -5.0..70.0
    ]
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        3 => (0_u32..5, hostile(), hostile(), prop_oneof![hostile(), 0.0..5.0], prop_oneof![0_u32..20, any::<u32>()])
            .prop_map(|(t, x, y, r, a)| Call::Paint(t, x, y, r, a)),
        2 => (0_u32..10, hostile()).prop_map(|(c, v)| Call::Param(c, v)),
        1 => (0_u32..3).prop_map(Call::Sensing),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => Just(Call::Render),
    ]
}

fn run(n: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let d = ant_new(60, 40, n, 1, 3);
    prop_assert!(!d.is_null());
    // SAFETY: `d` is live until freed at the end, once.
    unsafe {
        for c in calls {
            match *c {
                Call::Advance(t) => prop_assert!(ant_advance(d, t) <= abi::MAX_RATE_HZ / 4 + 1),
                Call::Paint(t, x, y, r, a) => prop_assert!(ant_paint(d, t, x, y, r, a) >= -1.0),
                Call::Param(code, v) => prop_assert!(ant_set_param(d, code, v) <= 1),
                Call::Sensing(on) => prop_assert!(ant_set_sensing(d, on) <= 1),
                Call::Rate(hz) => prop_assert!(ant_set_rate(d, hz) <= 1),
                Call::Render => prop_assert!(!ant_render(d).is_null()),
            }
            prop_assert_eq!(ant_len(d), n);
            for code in 0..abi::ANT_PARAM_COUNT {
                prop_assert!(
                    ant_param(d, code).is_finite(),
                    "param {} after {:?}",
                    code,
                    c
                );
            }
            let held = ant_food(d) + f64::from(ant_carrying(d)) + ant_delivered(d);
            prop_assert!(held >= 0.0 && held.is_finite());
        }
        ant_free(d);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(n in 1_u32..60, calls in prop::collection::vec(call(), 0..25)) {
        run(n, &calls)?;
    }
}
