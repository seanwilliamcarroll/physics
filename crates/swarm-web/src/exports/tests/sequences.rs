//! Random call sequences through the C ABI, as JS could make them: hostile
//! values, unknown codes, values past the caps. After every call: no
//! panic, statuses 0 or 1, the boid count unchanged, the rules usable,
//! the buffer there.

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::super::{
    swarm_advance, swarm_free, swarm_len, swarm_new, swarm_param, swarm_polarization, swarm_render,
    swarm_set_neighbours, swarm_set_param, swarm_set_predator, swarm_set_rate, swarm_set_step_cap,
};
use crate::abi;

#[derive(Clone, Debug)]
enum Call {
    Advance(f64),
    Rate(u32),
    Cap(u32),
    Neighbours(u32),
    Param(u32, f64),
    Predator(f64, f64, u32),
    Render,
}

fn hostile_f64() -> impl Strategy<Value = f64> {
    prop_oneof![
        Just(f64::NAN),
        Just(f64::INFINITY),
        Just(f64::NEG_INFINITY),
        Just(-1.0),
        Just(0.0),
        Just(1e300),
        -10.0..200.0,
    ]
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        4 => prop_oneof![hostile_f64(), 0.0..0.1].prop_map(Call::Advance),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Cap),
        2 => prop_oneof![0_u32..4, any::<u32>()].prop_map(Call::Neighbours),
        3 => (prop_oneof![0_u32..10, any::<u32>()], hostile_f64()).prop_map(|(c, v)| Call::Param(c, v)),
        2 => (hostile_f64(), hostile_f64(), 0_u32..3).prop_map(|(x, y, on)| Call::Predator(x, y, on)),
        1 => Just(Call::Render),
    ]
}

fn run(n: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let d = swarm_new(n, 400, 300, 2, 7);
    prop_assert!(!d.is_null());
    // SAFETY: `d` is live until freed at the end, once.
    unsafe {
        for c in calls {
            match *c {
                Call::Advance(t) => prop_assert!(swarm_advance(d, t) <= abi::MAX_RATE_HZ / 4 + 1),
                Call::Rate(hz) => prop_assert!(swarm_set_rate(d, hz) <= 1),
                Call::Cap(k) => prop_assert!(swarm_set_step_cap(d, k) <= 1),
                Call::Neighbours(code) => prop_assert!(swarm_set_neighbours(d, code) <= 1),
                Call::Param(code, v) => prop_assert!(swarm_set_param(d, code, v) <= 1),
                Call::Predator(x, y, on) => prop_assert!(swarm_set_predator(d, x, y, on) <= 1),
                Call::Render => prop_assert!(!swarm_render(d).is_null()),
            }
            prop_assert_eq!(swarm_len(d), n);
            // The rules stay usable: every constant finite, the speeds a band.
            for code in 0..abi::PARAM_COUNT {
                prop_assert!(
                    swarm_param(d, code).is_finite(),
                    "param {} after {:?}",
                    code,
                    c
                );
            }
            prop_assert!(
                swarm_param(d, abi::PARAM_MIN_SPEED) <= swarm_param(d, abi::PARAM_MAX_SPEED)
            );
            let p = swarm_polarization(d);
            prop_assert!(
                (0.0..=1.0 + 1e-9).contains(&p),
                "polarization {} after {:?}",
                p,
                c
            );
        }
        swarm_free(d);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(n in 1_u32..120, calls in prop::collection::vec(call(), 0..30)) {
        run(n, &calls)?;
    }
}
