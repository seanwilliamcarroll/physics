use core::ptr;

use super::{
    swarm_advance, swarm_free, swarm_len, swarm_new, swarm_param, swarm_polarization, swarm_render,
    swarm_set_neighbours, swarm_set_param, swarm_set_predator, swarm_set_rate, swarm_set_step_cap,
    swarm_view_height, swarm_view_width,
};
use crate::abi;

mod sequences;

#[test]
fn round_trip_through_the_c_abi() {
    let d = swarm_new(500, 1280, 720, 2, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `swarm_new`, freed once, last.
    unsafe {
        assert_eq!(
            (swarm_view_width(d), swarm_view_height(d), swarm_len(d)),
            (640, 360, 500)
        );
        assert_eq!(swarm_advance(d, 1.0 / 60.0), 1);
        assert_eq!(swarm_param(d, abi::PARAM_VISUAL_RANGE), 40.0);
        assert_eq!(swarm_set_param(d, abi::PARAM_MATCHING, 0.1), 1);
        assert_eq!(swarm_set_predator(d, 640.0, 360.0, 1), 1);
        assert_eq!(swarm_set_neighbours(d, abi::NEIGHBOURS_GRID), 1);
        let p = swarm_polarization(d);
        assert!((0.0..=1.0).contains(&p), "{p}");
        let px = core::slice::from_raw_parts(swarm_render(d), 640 * 360);
        assert!(px.iter().all(|&p| p >> 24 == 0xff), "opaque");
        swarm_free(d);
    }
}

#[test]
fn every_argument_is_parsed_at_the_boundary() {
    for (n, w, h, s) in [
        (0, 640, 480, 2),
        (abi::MAX_BOIDS + 1, 640, 480, 2),
        (10, abi::MAX_SIDE + 1, 480, 2),
        (10, 640, 480, 0),
        (10, 640, 480, abi::MAX_SCALE + 1),
        (10, 1, 480, 2),
    ] {
        assert!(swarm_new(n, w, h, s, 1).is_null(), "{n} {w} {h} {s}");
    }
    let d = swarm_new(abi::MAX_BRUTE + 1, 640, 480, 2, 1);
    assert!(!d.is_null());
    // SAFETY: `d` from `swarm_new`, freed once; null is allowed everywhere.
    unsafe {
        assert_eq!(
            swarm_set_neighbours(d, abi::NEIGHBOURS_BRUTE),
            0,
            "too many for brute force"
        );
        assert_eq!(swarm_set_neighbours(d, 7), 0);
        assert_eq!(
            (
                swarm_set_rate(d, 0),
                swarm_set_rate(d, abi::MAX_RATE_HZ + 1)
            ),
            (0, 0)
        );
        assert_eq!(swarm_set_step_cap(d, abi::MAX_RATE_HZ + 1), 0);
        assert_eq!((swarm_set_step_cap(d, 1), swarm_advance(d, 0.25)), (1, 1));
        assert_eq!(swarm_set_param(d, abi::PARAM_COUNT, 1.0), 0);
        assert_eq!(swarm_set_param(d, abi::PARAM_MIN_SPEED, -1.0), 0);
        assert!(swarm_param(d, abi::PARAM_COUNT).is_nan());
        assert_eq!(swarm_set_predator(d, f64::NAN, 0.0, 1), 0);
        assert_eq!(
            swarm_set_predator(d, f64::NAN, 0.0, 0),
            1,
            "off ignores the point"
        );
        swarm_free(d);
        let null = ptr::null_mut();
        assert_eq!(
            (
                swarm_advance(null, 1.0),
                swarm_set_rate(null, 30),
                swarm_len(null)
            ),
            (0, 0, 0)
        );
        assert_eq!(
            (swarm_set_param(null, 0, 1.0), swarm_set_neighbours(null, 1)),
            (0, 0)
        );
        assert!(swarm_param(null, 0).is_nan() && swarm_polarization(null).is_nan());
        assert!(swarm_render(null).is_null());
        assert_eq!((swarm_view_width(null), swarm_view_height(null)), (0, 0));
        swarm_free(null);
    }
}
