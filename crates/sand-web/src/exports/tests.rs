use core::ptr;

use super::{
    sand_advance, sand_awake_chunks, sand_chunks, sand_count, sand_free, sand_height,
    sand_last_moves, sand_new, sand_paint, sand_render, sand_set_chunked, sand_set_rate,
    sand_set_step_cap, sand_width,
};
use crate::abi;

mod sequences;

#[test]
fn round_trip_through_the_c_abi() {
    let demo = sand_new(64, 48, 1);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `sand_new`, freed once, last.
    unsafe {
        assert_eq!((sand_width(demo), sand_height(demo)), (64, 48));
        assert_eq!(sand_paint(demo, 32, 4, 3, abi::MATERIAL_SAND), 29);
        assert_eq!(sand_count(demo, abi::MATERIAL_SAND), 29);
        assert_eq!(sand_advance(demo, 1.0 / 60.0), 1);
        assert!(sand_last_moves(demo) > 0);
        assert_eq!(sand_chunks(demo), 2 * 2);
        assert!(sand_awake_chunks(demo) > 0);
        let pixels = core::slice::from_raw_parts(sand_render(demo), 64 * 48);
        assert!(pixels.iter().all(|&pixel| pixel >> 24 == 0xff), "opaque");
        sand_free(demo);
    }
}

#[test]
fn every_argument_is_parsed_at_the_boundary() {
    assert!(sand_new(0, 10, 1).is_null());
    assert!(sand_new(abi::MAX_SIDE + 1, 10, 1).is_null());
    let biggest = sand_new(abi::MAX_SIDE, abi::MAX_SIDE, 1);
    assert!(!biggest.is_null(), "the cap itself is allowed");
    // SAFETY: from `sand_new`, freed once.
    unsafe { sand_free(biggest) };
    let demo = sand_new(16, 16, 1);
    // SAFETY: `demo` from `sand_new`, freed once; null is allowed everywhere.
    unsafe {
        assert_eq!(sand_paint(demo, 8, 8, 2, 99), 0, "unknown material");
        assert_eq!(
            sand_paint(demo, 8, 8, abi::MAX_BRUSH + 1, abi::MATERIAL_SAND),
            0
        );
        assert_eq!(sand_count(demo, 99), 0);
        assert_eq!(
            (
                sand_set_rate(demo, 0),
                sand_set_rate(demo, abi::MAX_RATE_HZ + 1)
            ),
            (0, 0)
        );
        assert_eq!(sand_set_rate(demo, 30), 1);
        assert_eq!(sand_set_step_cap(demo, abi::MAX_RATE_HZ + 1), 0);
        assert_eq!(
            (sand_set_step_cap(demo, 2), sand_advance(demo, 0.25)),
            (1, 2)
        );
        assert_eq!(
            (sand_set_chunked(demo, 2), sand_set_chunked(demo, 0)),
            (0, 1)
        );
        sand_free(demo);
        let null = ptr::null_mut();
        assert_eq!(
            (sand_advance(null, 1.0), sand_paint(null, 0, 0, 1, 1)),
            (0, 0)
        );
        assert_eq!(
            (sand_width(null), sand_count(null, 1), sand_last_moves(null)),
            (0, 0, 0)
        );
        assert!(sand_render(null).is_null());
        sand_free(null);
    }
}
