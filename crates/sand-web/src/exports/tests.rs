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
    let d = sand_new(64, 48, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `sand_new`, freed once, last.
    unsafe {
        assert_eq!((sand_width(d), sand_height(d)), (64, 48));
        assert_eq!(sand_paint(d, 32, 4, 3, abi::MATERIAL_SAND), 29);
        assert_eq!(sand_count(d, abi::MATERIAL_SAND), 29);
        assert_eq!(sand_advance(d, 1.0 / 60.0), 1);
        assert!(sand_last_moves(d) > 0);
        assert_eq!(sand_chunks(d), 2 * 2);
        assert!(sand_awake_chunks(d) > 0);
        let px = core::slice::from_raw_parts(sand_render(d), 64 * 48);
        assert!(px.iter().all(|&p| p >> 24 == 0xff), "opaque");
        sand_free(d);
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
    let d = sand_new(16, 16, 1);
    // SAFETY: `d` from `sand_new`, freed once; null is allowed everywhere.
    unsafe {
        assert_eq!(sand_paint(d, 8, 8, 2, 99), 0, "unknown material");
        assert_eq!(
            sand_paint(d, 8, 8, abi::MAX_BRUSH + 1, abi::MATERIAL_SAND),
            0
        );
        assert_eq!(sand_count(d, 99), 0);
        assert_eq!(
            (sand_set_rate(d, 0), sand_set_rate(d, abi::MAX_RATE_HZ + 1)),
            (0, 0)
        );
        assert_eq!(sand_set_rate(d, 30), 1);
        assert_eq!(sand_set_step_cap(d, abi::MAX_RATE_HZ + 1), 0);
        assert_eq!((sand_set_step_cap(d, 2), sand_advance(d, 0.25)), (1, 2));
        assert_eq!((sand_set_chunked(d, 2), sand_set_chunked(d, 0)), (0, 1));
        sand_free(d);
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
