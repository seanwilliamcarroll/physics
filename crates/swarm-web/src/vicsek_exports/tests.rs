//! The Vicsek exports: a round trip, the boundary, and random call
//! sequences with hostile values (no panic, statuses 0 or 1, the count
//! fixed, `v_a` in [0, 1]).

use core::ptr;

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::{
    vicsek_advance, vicsek_annihilations, vicsek_free, vicsek_len, vicsek_mean_order, vicsek_new,
    vicsek_order, vicsek_render, vicsek_set_noise, vicsek_set_rate, vicsek_set_speed,
    vicsek_set_step_cap, vicsek_view,
};
use crate::abi;

#[test]
fn round_trip_and_the_boundary() {
    for (n, side, eta, view) in [
        (0, 10.0, 1.0, 400),
        (abi::MAX_PARTICLES + 1, 10.0, 1.0, 400),
        (10, 0.0, 1.0, 400),
        (10, f64::NAN, 1.0, 400),
        (10, f64::from(abi::MAX_VICSEK_SIDE) + 1.0, 1.0, 400),
        (10, 10.0, 7.0, 400),
        (10, 10.0, 1.0, abi::MAX_VIEW + 1),
    ] {
        assert!(
            vicsek_new(n, side, eta, view, 1).is_null(),
            "{n} {side} {eta} {view}"
        );
    }
    let d = vicsek_new(400, 10.0, 2.0, 400, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `vicsek_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!((vicsek_len(d), vicsek_view(d)), (400, 400));
        assert_eq!(vicsek_advance(d, 1.0 / 60.0 + 1e-9), 1);
        assert_eq!((vicsek_set_noise(d, 3.0), vicsek_set_noise(d, 9.0)), (1, 0));
        assert_eq!(
            (vicsek_set_speed(d, 0.1), vicsek_set_speed(d, -1.0)),
            (1, 0)
        );
        assert_eq!((vicsek_set_rate(d, 30), vicsek_set_step_cap(d, 2)), (1, 1));
        let v = vicsek_mean_order(d, 50, 50);
        assert!((0.0..=1.0).contains(&v), "{v}");
        assert!(vicsek_mean_order(d, abi::MAX_RUN, 1).is_nan());
        assert_eq!(vicsek_annihilations(d), 0.0);
        let px = core::slice::from_raw_parts(vicsek_render(d), 400 * 400);
        assert!(px.iter().all(|&p| p >> 24 == 0xff));
        vicsek_free(d);
        let null = ptr::null_mut();
        assert_eq!(
            (
                vicsek_advance(null, 1.0),
                vicsek_set_noise(null, 1.0),
                vicsek_len(null)
            ),
            (0, 0, 0)
        );
        assert!(vicsek_order(null).is_nan() && vicsek_mean_order(null, 1, 1).is_nan());
        assert!(vicsek_render(null).is_null());
        vicsek_free(null);
    }
}

#[derive(Clone, Debug)]
enum Call {
    Advance(f64),
    Noise(f64),
    Speed(f64),
    Rate(u32),
    Cap(u32),
    Measure(u32, u32),
    Render,
}

fn hostile() -> impl Strategy<Value = f64> {
    prop_oneof![
        Just(f64::NAN),
        Just(f64::INFINITY),
        Just(-1.0),
        Just(0.0),
        Just(1e300),
        0.0..7.0
    ]
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        2 => hostile().prop_map(Call::Noise),
        2 => hostile().prop_map(Call::Speed),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Cap),
        1 => (prop_oneof![0_u32..20, any::<u32>()], prop_oneof![0_u32..20, any::<u32>()]).prop_map(|(t, w)| Call::Measure(t, w)),
        1 => Just(Call::Render),
    ]
}

/// `v_a`'s ceiling: headings are `f32` unit vectors, each of length 1
/// only to a few ulps (re-normalized every step, so it can't grow), and
/// the property test found aligned ones averaging 1 + 2.2e-8. A few f32
/// epsilons: 1 + 1e-6.
const V_A_MAX: f64 = 1.0 + 1e-6;

fn run(n: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let d = vicsek_new(n, 5.0, 1.0, 64, 3);
    prop_assert!(!d.is_null());
    // SAFETY: `d` is live until freed at the end, once.
    unsafe {
        for c in calls {
            match *c {
                Call::Advance(t) => prop_assert!(vicsek_advance(d, t) <= abi::MAX_RATE_HZ / 4 + 1),
                Call::Noise(v) => prop_assert!(vicsek_set_noise(d, v) <= 1),
                Call::Speed(v) => prop_assert!(vicsek_set_speed(d, v) <= 1),
                Call::Rate(hz) => prop_assert!(vicsek_set_rate(d, hz) <= 1),
                Call::Cap(k) => prop_assert!(vicsek_set_step_cap(d, k) <= 1),
                Call::Measure(t, w) => {
                    let v = vicsek_mean_order(d, t, w);
                    prop_assert!(v.is_nan() || (0.0..=V_A_MAX).contains(&v), "{}", v);
                }
                Call::Render => prop_assert!(!vicsek_render(d).is_null()),
            }
            prop_assert_eq!(vicsek_len(d), n);
            let v = vicsek_order(d);
            prop_assert!((0.0..=V_A_MAX).contains(&v), "v_a {} after {:?}", v, c);
        }
        vicsek_free(d);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(n in 1_u32..100, calls in prop::collection::vec(call(), 0..25)) {
        run(n, &calls)?;
    }
}
