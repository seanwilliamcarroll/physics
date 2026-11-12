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

/// What a page could pass (`test_support::hostile_f64`), around this
/// module's usual values.
fn hostile_f64() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(0.0..0.3)
}

fn call() -> impl Strategy<Value = Call> {
    prop_oneof![
        4 => hostile_f64().prop_map(Call::Advance),
        4 => (-10_i32..80, -10_i32..60, prop_oneof![0_u32..6, Just(abi::MAX_BRUSH + 1), any::<u32>()], prop_oneof![0_u32..8, any::<u32>()])
            .prop_map(|(x, y, r, c)| Call::Paint(x, y, r, c)),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Rate),
        1 => prop_oneof![0_u32..300, any::<u32>()].prop_map(Call::Cap),
        1 => any::<u32>().prop_map(|c| Call::Chunked(c % 4)),
        1 => Just(Call::Render),
    ]
}

/// Every material's count, summed: always the grid's size.
///
/// # Safety
/// `d` must be a live handle.
unsafe fn total(d: *const SandDemo) -> u32 {
    // SAFETY: per this function's contract.
    (0..6).map(|c| unsafe { sand_count(d, c) }).sum()
}

fn run(w: u32, h: u32, calls: &[Call]) -> Result<(), TestCaseError> {
    let d = sand_new(w, h, 7);
    prop_assert!(!d.is_null());
    // SAFETY: `d` is live until freed at the end, once.
    unsafe {
        let size = sand_width(d) * sand_height(d);
        for c in calls {
            match *c {
                Call::Advance(t) => {
                    prop_assert!(sand_advance(d, t) <= abi::MAX_RATE_HZ / 4 + 1);
                }
                Call::Paint(x, y, r, code) => {
                    let n = sand_paint(d, x, y, r, code);
                    prop_assert!(n <= size);
                }
                Call::Rate(hz) => prop_assert!(sand_set_rate(d, hz) <= 1),
                Call::Cap(n) => prop_assert!(sand_set_step_cap(d, n) <= 1),
                Call::Chunked(on) => prop_assert!(sand_set_chunked(d, on) <= 1),
                Call::Render => prop_assert!(!sand_render(d).is_null()),
            }
            prop_assert_eq!(total(d), size, "the counts cover the grid after {:?}", c);
        }
        sand_free(d);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(w in 1_u32..70, h in 1_u32..50, calls in prop::collection::vec(call(), 0..30)) {
        run(w, h, &calls)?;
    }
}
