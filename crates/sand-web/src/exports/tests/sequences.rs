//! Random call sequences through the C ABI, as JS could make them: hostile
//! values, unknown codes, sizes past the caps. After every call: no panic,
//! statuses 0 or 1, and the counts add up to the grid.

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::super::{
    sand_advance, sand_count, sand_free, sand_height, sand_new, sand_paint, sand_render,
    sand_set_chunked, sand_set_rate, sand_set_step_cap, sand_width,
};
use crate::abi;
use crate::demo::SandDemo;

#[derive(Clone, Debug)]
enum Call {
    Advance(f64),
    Paint(i32, i32, u32, u32),
    Rate(u32),
    Cap(u32),
    Chunked(u32),
    Render,
}

fn hostile_f64() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(0.0..0.3)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        4 => hostile_f64().prop_map(Call::Advance),
        4 => (-10_i32..80, -10_i32..60, prop_oneof![0_u32..6, Just(abi::MAX_BRUSH + 1), any::<u32>()], prop_oneof![0_u32..8, any::<u32>()])
            .prop_map(|(x, y, radius, code)| Call::Paint(x, y, radius, code)),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Cap),
        1 => any::<u32>().prop_map(|value| Call::Chunked(value % 4)),
        1 => Just(Call::Render),
    ]
}

/// Every material's count, summed: always the grid's size.
///
/// # Safety
/// `demo` must be a live handle.
unsafe fn total(demo: *const SandDemo) -> u32 {
    // SAFETY: per this function's contract.
    (0..6).map(|code| unsafe { sand_count(demo, code) }).sum()
}

fn run(width: u32, height: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let demo = sand_new(width, height, 7);
    prop_assert!(!demo.is_null());
    // SAFETY: `demo` is live until freed at the end, once.
    unsafe {
        let cell_count = sand_width(demo) * sand_height(demo);
        for call in calls {
            match *call {
                Call::Advance(elapsed) => {
                    prop_assert!(sand_advance(demo, elapsed) <= abi::MAX_RATE_HZ / 4 + 1);
                }
                Call::Paint(x, y, radius, code) => {
                    let painted = sand_paint(demo, x, y, radius, code);
                    prop_assert!(painted <= cell_count);
                }
                Call::Rate(rate_hz) => prop_assert!(sand_set_rate(demo, rate_hz) <= 1),
                Call::Cap(max_steps) => prop_assert!(sand_set_step_cap(demo, max_steps) <= 1),
                Call::Chunked(on) => prop_assert!(sand_set_chunked(demo, on) <= 1),
                Call::Render => prop_assert!(!sand_render(demo).is_null()),
            }
            prop_assert_eq!(
                total(demo),
                cell_count,
                "the counts cover the grid after {:?}",
                call
            );
        }
        sand_free(demo);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(width in 1_u32..70, height in 1_u32..50, calls in prop::collection::vec(call(), 0..30)) {
        run(width, height, &calls)?;
    }
}
