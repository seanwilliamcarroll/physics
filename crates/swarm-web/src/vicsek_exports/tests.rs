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
    for (particle_count, side, noise, view) in [
        (0, 10.0, 1.0, 400),
        (abi::MAX_PARTICLES + 1, 10.0, 1.0, 400),
        (10, 0.0, 1.0, 400),
        (10, f64::NAN, 1.0, 400),
        (10, f64::from(abi::MAX_VICSEK_SIDE) + 1.0, 1.0, 400),
        (10, 10.0, 7.0, 400),
        (10, 10.0, 1.0, abi::MAX_VIEW + 1),
    ] {
        assert!(
            vicsek_new(particle_count, side, noise, view, 1).is_null(),
            "{particle_count} {side} {noise} {view}"
        );
    }
    let demo = vicsek_new(400, 10.0, 2.0, 400, 1);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `vicsek_new`, freed once, last; null allowed.
    unsafe {
        assert_eq!((vicsek_len(demo), vicsek_view(demo)), (400, 400));
        assert_eq!(vicsek_advance(demo, 1.0 / 60.0 + 1e-9), 1);
        assert_eq!(
            (vicsek_set_noise(demo, 3.0), vicsek_set_noise(demo, 9.0)),
            (1, 0)
        );
        assert_eq!(
            (vicsek_set_speed(demo, 0.1), vicsek_set_speed(demo, -1.0)),
            (1, 0)
        );
        assert_eq!(
            (vicsek_set_rate(demo, 30), vicsek_set_step_cap(demo, 2)),
            (1, 1)
        );
        let order = vicsek_mean_order(demo, 50, 50);
        assert!((0.0..=1.0).contains(&order), "{order}");
        assert!(vicsek_mean_order(demo, abi::MAX_RUN, 1).is_nan());
        assert_eq!(vicsek_annihilations(demo), 0.0);
        let pixels = core::slice::from_raw_parts(vicsek_render(demo), 400 * 400);
        assert!(pixels.iter().all(|&pixel| pixel >> 24 == 0xff));
        vicsek_free(demo);
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
    test_support::hostile_f64(0.0..7.0)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        3 => prop_oneof![hostile(), 0.0..0.1].prop_map(Call::Advance),
        2 => hostile().prop_map(Call::Noise),
        2 => hostile().prop_map(Call::Speed),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Cap),
        1 => (prop_oneof![0_u32..20, any::<u32>()], prop_oneof![0_u32..20, any::<u32>()]).prop_map(|(transient, window)| Call::Measure(transient, window)),
        1 => Just(Call::Render),
    ]
}

/// `v_a`'s ceiling: headings are `f32` unit vectors, each of length 1
/// only to a few ulps (re-normalized every step, so it can't grow), and
/// the property test found aligned ones averaging 1 + 2.2e-8. A few f32
/// epsilons: 1 + 1e-6.
const V_A_MAX: f64 = 1.0 + 1e-6;

fn run(particle_count: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let demo = vicsek_new(particle_count, 5.0, 1.0, 64, 3);
    prop_assert!(!demo.is_null());
    // SAFETY: `demo` is live until freed at the end, once.
    unsafe {
        for action in calls {
            match *action {
                Call::Advance(seconds) => {
                    prop_assert!(vicsek_advance(demo, seconds) <= abi::MAX_RATE_HZ / 4 + 1);
                }
                Call::Noise(value) => prop_assert!(vicsek_set_noise(demo, value) <= 1),
                Call::Speed(value) => prop_assert!(vicsek_set_speed(demo, value) <= 1),
                Call::Rate(rate_hz) => prop_assert!(vicsek_set_rate(demo, rate_hz) <= 1),
                Call::Cap(max_steps) => prop_assert!(vicsek_set_step_cap(demo, max_steps) <= 1),
                Call::Measure(transient, window) => {
                    let order = vicsek_mean_order(demo, transient, window);
                    prop_assert!(
                        order.is_nan() || (0.0..=V_A_MAX).contains(&order),
                        "{}",
                        order
                    );
                }
                Call::Render => prop_assert!(!vicsek_render(demo).is_null()),
            }
            prop_assert_eq!(vicsek_len(demo), particle_count);
            let order = vicsek_order(demo);
            prop_assert!(
                (0.0..=V_A_MAX).contains(&order),
                "v_a {} after {:?}",
                order,
                action
            );
        }
        vicsek_free(demo);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(particle_count in 1_u32..100, calls in prop::collection::vec(call(), 0..25)) {
        run(particle_count, &calls)?;
    }
}
