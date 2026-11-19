use super::collisions::{
    demo_momentum_x, demo_momentum_y, demo_new_ball_box, demo_new_break_shot, demo_new_cradle,
    demo_pairs_len, demo_pairs_ptr, demo_particle_radius, demo_set_restitution, demo_update_pairs,
};
use super::drag::{demo_drag, demo_grab, demo_release};
use super::lifecycle::{
    demo_advance, demo_free, demo_links_len, demo_links_ptr, demo_new, demo_new_chain,
    demo_new_double_pendulum, demo_new_jelly, demo_positions_len, demo_positions_ptr,
};
use super::pool::{
    demo_at_rest, demo_ball_number, demo_new_pool, demo_pockets_len, demo_potted_len,
    demo_respot_cue, demo_segments_len, demo_set_speculative, demo_spin_x, demo_strike,
    demo_tunnels,
};
use super::readouts::{
    demo_constraint_error, demo_energy, demo_kinetic_energy, demo_particle_x, demo_particle_y,
};
use super::settings::{
    demo_set_beta, demo_set_damping, demo_set_integrator, demo_set_iterations, demo_set_order,
    demo_set_rate, demo_set_softening, demo_set_solver, demo_set_stabilization, demo_set_step_cap,
    demo_set_stiffness, demo_set_substeps, demo_set_theta,
};
use crate::abi;
use core::ptr;

#[test]
fn round_trip_through_the_c_abi() {
    let demo = demo_new(0, 1, 10, 42);
    assert!(!demo.is_null());
    // SAFETY: `demo` came from `demo_new` and is freed exactly once, last.
    unsafe {
        assert_eq!(demo_advance(demo, 1.0 / 60.0), 1);
        assert_eq!(demo_positions_len(demo), 20);
        let positions = core::slice::from_raw_parts(demo_positions_ptr(demo), 20);
        assert!(positions.chunks(2).all(|position| position[1] > 0.0));
        demo_free(demo);
    }
}

#[test]
#[should_panic(expected = "deliberate test panic")]
fn test_hook_panics_with_the_shared_message() {
    super::lifecycle::deliberate_panic();
}

#[test]
fn orbit_controls_through_the_c_abi() {
    let demo = demo_new(abi::DEMO_ORBIT, abi::SCALAR_F64, 0, 0);
    assert!(!demo.is_null());
    // SAFETY: `demo` came from `demo_new` and is freed exactly once, last.
    unsafe {
        assert_eq!(
            demo_set_integrator(demo, abi::INTEGRATOR_VELOCITY_VERLET),
            1
        );
        assert_eq!(demo_set_integrator(demo, 99), 0, "unknown integrator code");
        assert_eq!(
            demo_set_rate(demo, 0),
            0,
            "zero rate rejected at the boundary"
        );
        assert_eq!(demo_set_rate(demo, 30), 1);
        assert_eq!(demo_advance(demo, 1.0 / 30.0), 1);
        let energy = demo_energy(demo);
        assert!(
            energy.is_finite() && energy < 0.0,
            "bound orbit has negative energy: {energy}"
        );
        demo_free(demo);
    }
}

#[test]
fn fountain_energy_and_null_handles_read_as_nan() {
    let demo = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F32, 10, 1);
    // SAFETY: `demo` from `demo_new`, freed once; null is allowed everywhere.
    unsafe {
        assert!(demo_energy(demo).is_nan());
        demo_free(demo);
        assert!(demo_energy(ptr::null()).is_nan());
        assert_eq!(demo_set_integrator(ptr::null_mut(), 0), 0);
        assert_eq!(demo_set_rate(ptr::null_mut(), 60), 0);
    }
}

#[test]
fn unknown_codes_return_null() {
    assert!(demo_new(99, 0, 10, 1).is_null());
    assert!(demo_new(0, 99, 10, 1).is_null());
}

#[test]
fn null_handles_are_harmless() {
    // SAFETY: null is explicitly allowed by every export's contract.
    unsafe {
        assert_eq!(demo_advance(ptr::null_mut(), 1.0), 0);
        assert!(demo_positions_ptr(ptr::null()).is_null());
        assert_eq!(demo_positions_len(ptr::null()), 0);
        demo_free(ptr::null_mut());
    }
}

#[test]
fn softening_is_parsed_at_the_boundary() {
    let demo = demo_new(abi::DEMO_DISK, abi::SCALAR_F32, 32, 1);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        let energy_before = demo_energy(demo);
        assert_eq!(demo_set_softening(demo, -0.1), 0, "negative rejected");
        assert_eq!(demo_set_softening(demo, f64::NAN), 0, "NaN rejected");
        assert_eq!(
            demo_energy(demo).to_bits(),
            energy_before.to_bits(),
            "unchanged"
        );
        assert_eq!(demo_set_softening(demo, 0.0), 1, "zero allowed");
        assert_eq!(demo_set_softening(demo, 0.5), 1);
        assert!(
            demo_energy(demo) > energy_before,
            "softer: shallower potential"
        );
        demo_free(demo);
        assert_eq!(demo_set_softening(ptr::null_mut(), 0.1), 0);
    }
    let fountain = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 4, 1);
    // SAFETY: as above.
    unsafe {
        assert_eq!(
            demo_set_softening(fountain, 0.1),
            0,
            "fountain has no gravity"
        );
        demo_free(fountain);
    }
}

#[test]
fn theta_is_parsed_at_the_boundary() {
    let demo = demo_new(abi::DEMO_CLUSTER, abi::SCALAR_F64, 32, 1);
    // SAFETY: `demo` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        assert_eq!(demo_set_theta(demo, -0.5), 0, "negative rejected");
        assert_eq!(demo_set_theta(demo, f64::NAN), 0, "NaN rejected");
        assert_eq!(demo_set_theta(demo, 0.5), 1);
        assert_eq!(demo_advance(demo, 1.0 / 60.0), 1);
        assert!(demo_energy(demo).is_finite());
        demo_free(demo);
        assert_eq!(demo_set_theta(ptr::null_mut(), 0.5), 0);
    }
}

#[test]
fn pendulum_controls_are_parsed_at_the_boundary() {
    let demo = demo_new(abi::DEMO_PENDULUM, abi::SCALAR_F32, 0, 0);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `demo_new`, freed once, last; null is allowed.
    unsafe {
        assert_eq!(demo_set_solver(demo, abi::SOLVER_IMPULSE), 1);
        assert_eq!(demo_set_solver(demo, 9), 0, "unknown solver code");
        assert_eq!(demo_set_beta(demo, 1.5), 0, "beta above 1");
        assert_eq!(demo_set_beta(demo, f64::NAN), 0);
        assert_eq!(demo_set_beta(demo, 0.0), 1);
        assert_eq!(demo_set_substeps(demo, 0), 0, "zero substeps");
        assert_eq!(demo_set_substeps(demo, 4), 1);
        assert_eq!(demo_set_iterations(demo, 0), 0, "zero iterations");
        assert_eq!(demo_set_iterations(demo, 2), 1);
        assert_eq!(demo_advance(demo, 0.25), 15, "one clamped frame");
        let error = demo_constraint_error(demo);
        assert!(
            error.is_finite() && error > 0.0,
            "beta 0 stretches: {error}"
        );
        demo_free(demo);
        assert!(demo_constraint_error(ptr::null()).is_nan());
        assert_eq!(demo_set_solver(ptr::null_mut(), 0), 0);
    }
    let fountain = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 4, 1);
    // SAFETY: as above.
    unsafe {
        assert!(demo_constraint_error(fountain).is_nan(), "no constraints");
        demo_free(fountain);
    }
}

#[test]
fn chain_and_double_pendulum_constructors_check_their_input() {
    let chain = demo_new_chain(abi::SCALAR_F64, 10, 100.0);
    assert!(!chain.is_null());
    assert!(
        demo_new_chain(abi::SCALAR_F64, 10, -1.0).is_null(),
        "no negative mass"
    );
    assert!(demo_new_chain(9, 10, 100.0).is_null(), "unknown scalar");
    let pendulum = demo_new_double_pendulum(abi::SCALAR_F32, abi::START_RAISED, 1e-9);
    assert!(!pendulum.is_null());
    assert!(
        demo_new_double_pendulum(abi::SCALAR_F32, 7, 0.0).is_null(),
        "unknown start"
    );
    assert!(demo_new_double_pendulum(abi::SCALAR_F32, abi::START_RAISED, f64::NAN).is_null());
    // SAFETY: both from constructors above, freed once, last.
    unsafe {
        // 10 rods: 20 link indices, the first rod from the pin (0) to 1.
        assert_eq!(demo_links_len(chain), 20);
        let links = core::slice::from_raw_parts(demo_links_ptr(chain), 20);
        assert_eq!(&links[..2], &[0, 1]);
        assert_eq!(demo_set_order(chain, abi::ORDER_ALTERNATING), 1);
        assert_eq!(demo_set_order(chain, 9), 0);
        assert_eq!(
            demo_set_stabilization(chain, abi::STABILIZATION_BAUMGARTE),
            1
        );
        assert_eq!(demo_set_stabilization(chain, 9), 0);
        demo_free(chain);
        demo_free(pendulum);
    }
}

#[test]
fn grab_drag_release_through_the_c_abi() {
    let demo = demo_new_chain(abi::SCALAR_F64, 10, 100.0);
    // SAFETY: from `demo_new_chain`, freed once, last; null is allowed.
    unsafe {
        // The bob is at (1, 0); the pin (0, 0) is static and can't be grabbed.
        assert_eq!(demo_grab(demo, 0.0, 0.0, 0.05), -1, "static pin");
        assert_eq!(demo_grab(demo, 1.0, 0.02, -1.0), -1, "negative radius");
        assert_eq!(demo_grab(demo, 1.0, 0.02, 0.1), 10);
        // Anchor added: 12 particles, 11 rods.
        assert_eq!((demo_positions_len(demo), demo_links_len(demo)), (24, 22));
        assert_eq!(demo_drag(demo, 1.0, 1.0), 1);
        // Dragging far off stretches the drag rod, not the chain: the
        // readout leaves the drag rod out (a fresh grab: the chain is intact).
        assert_eq!(demo_drag(demo, 50.0, 50.0), 1);
        assert!(
            demo_constraint_error(demo) < 1e-9,
            "chain untouched before stepping"
        );
        assert_eq!(demo_drag(demo, 1.0, 1.0), 1);
        assert_eq!(demo_drag(demo, f64::NAN, 1.0), 0);
        assert_eq!(demo_advance(demo, 1.0 / 60.0), 1);
        assert_eq!(demo_release(demo), 1);
        assert_eq!(demo_release(demo), 0, "nothing held");
        assert_eq!(demo_drag(demo, 1.0, 1.0), 0, "nothing held");
        assert_eq!((demo_positions_len(demo), demo_links_len(demo)), (22, 20));
        demo_free(demo);
        assert_eq!(demo_grab(core::ptr::null_mut(), 0.0, 0.0, 1.0), -1);
    }
}

#[test]
fn exact_positions_resolve_what_the_f32_buffer_cannot() {
    let level_pendulum = demo_new_double_pendulum(abi::SCALAR_F64, abi::START_HORIZONTAL, 0.0);
    let nudged_pendulum = demo_new_double_pendulum(abi::SCALAR_F64, abi::START_HORIZONTAL, 1e-9);
    // SAFETY: both from the constructor, freed once, last; null allowed.
    unsafe {
        // Tip (particle 2) at (2, 0) and (2, 1e-9): exact in f64...
        assert_eq!(demo_particle_x(level_pendulum, 2), 2.0);
        assert_eq!(demo_particle_y(nudged_pendulum, 2), 1e-9);
        // ...while the f32 render buffer can't tell them apart from 0.
        let positions = core::slice::from_raw_parts(demo_positions_ptr(nudged_pendulum), 6);
        assert!(positions[5].abs() < 1e-8);
        assert!(
            demo_particle_x(level_pendulum, 3).is_nan(),
            "past the last particle"
        );
        assert!(demo_particle_y(ptr::null(), 0).is_nan());
        demo_free(level_pendulum);
        demo_free(nudged_pendulum);
    }
}

#[test]
fn jelly_constructor_and_live_stiffness_check_their_input() {
    // Force springs can't be rigid; constraints can.
    assert!(
        demo_new_jelly(
            abi::SCALAR_F64,
            abi::JELLY_SPRINGS,
            4,
            4,
            f64::INFINITY,
            0.0
        )
        .is_null()
    );
    let rods = demo_new_jelly(
        abi::SCALAR_F64,
        abi::JELLY_IMPULSE,
        4,
        4,
        f64::INFINITY,
        0.0,
    );
    assert!(!rods.is_null());
    assert!(
        demo_new_jelly(abi::SCALAR_F64, 9, 4, 4, 100.0, 0.0).is_null(),
        "unknown body"
    );
    assert!(
        demo_new_jelly(abi::SCALAR_F64, abi::JELLY_XPBD, 0, 4, 100.0, 0.0).is_null(),
        "empty grid"
    );
    let springs = demo_new_jelly(abi::SCALAR_F32, abi::JELLY_SPRINGS, 4, 4, 500.0, 0.5);
    assert!(!springs.is_null());
    // SAFETY: both from the constructor, freed once, last; null allowed.
    unsafe {
        // 4x4 grid: 24 structural (3×4 + 4×3) + 18 shear + 16 bend = 58
        // springs drawn, as force springs or as rods.
        assert_eq!(demo_links_len(springs), 2 * 58);
        assert_eq!(demo_links_len(rods), 2 * 58);
        assert_eq!(demo_set_stiffness(springs, 1000.0), 1);
        assert_eq!(
            demo_set_stiffness(springs, f64::INFINITY),
            0,
            "springs can't be rigid"
        );
        assert_eq!(demo_set_stiffness(springs, -1.0), 0);
        assert_eq!(demo_set_damping(springs, 0.2), 1);
        assert_eq!(demo_set_damping(springs, f64::NAN), 0);
        assert_eq!(demo_set_stiffness(rods, 1e5), 1);
        assert_eq!(demo_set_stiffness(rods, f64::INFINITY), 1, "rigid rods");
        assert_eq!(demo_set_damping(rods, 0.5), 1);
        // It falls: kinetic energy rises from 0.
        assert_eq!(demo_kinetic_energy(springs), 0.0);
        assert_eq!(demo_advance(springs, 0.25), 15);
        assert!(demo_kinetic_energy(springs) > 0.0);
        assert!(demo_energy(springs).is_finite());
        demo_free(springs);
        demo_free(rods);
        assert!(demo_kinetic_energy(ptr::null()).is_nan());
        assert_eq!(demo_set_stiffness(ptr::null_mut(), 1.0), 0);
    }
    // Not a jelly: stiffness and damping are refused.
    let chain = demo_new_chain(abi::SCALAR_F64, 4, 10.0);
    // SAFETY: as above.
    unsafe {
        assert_eq!(demo_set_stiffness(chain, 100.0), 0);
        assert_eq!(demo_set_damping(chain, 0.1), 0);
        demo_free(chain);
    }
}

mod sequences;

#[test]
fn every_cap_accepts_its_limit_and_refuses_one_more() {
    use abi::{
        MAX_CHAIN_LINKS, MAX_GRAVITY_BODIES, MAX_ITERATIONS, MAX_JELLY_SIDE, MAX_RATE_HZ,
        MAX_SUBSTEPS,
    };
    let (scalar_f64, xpbd) = (abi::SCALAR_F64, abi::JELLY_XPBD);
    // SAFETY: every handle is from a `demo_new*` export (or null), and
    // freed once; null is allowed everywhere.
    unsafe {
        let disk = demo_new(abi::DEMO_DISK, scalar_f64, MAX_GRAVITY_BODIES, 1);
        assert!(!disk.is_null());
        demo_free(disk);
        assert!(demo_new(abi::DEMO_DISK, scalar_f64, MAX_GRAVITY_BODIES + 1, 1).is_null());
        // The fountain's cap is higher: the gravity scenes have their own.
        let fountain = demo_new(abi::DEMO_FOUNTAIN, scalar_f64, MAX_GRAVITY_BODIES + 1, 1);
        assert!(!fountain.is_null());
        demo_free(fountain);

        let chain = demo_new_chain(scalar_f64, MAX_CHAIN_LINKS, 100.0);
        assert!(!chain.is_null());
        assert!(demo_new_chain(scalar_f64, MAX_CHAIN_LINKS + 1, 100.0).is_null());
        for (set, cap) in [
            (
                demo_set_substeps as unsafe extern "C" fn(_, _) -> _,
                MAX_SUBSTEPS,
            ),
            (demo_set_iterations, MAX_ITERATIONS),
            (demo_set_rate, MAX_RATE_HZ),
        ] {
            assert_eq!(set(chain, cap), 1, "at the cap");
            assert_eq!(set(chain, cap + 1), 0, "past the cap");
        }
        demo_free(chain);

        let side = MAX_JELLY_SIDE;
        let jelly = demo_new_jelly(scalar_f64, xpbd, side, side, 1000.0, 0.5);
        assert!(!jelly.is_null());
        demo_free(jelly);
        assert!(demo_new_jelly(scalar_f64, xpbd, side + 1, side, 1000.0, 0.5).is_null());
        assert!(demo_new_jelly(scalar_f64, xpbd, side, side + 1, 1000.0, 0.5).is_null());

        let ball_box = demo_new_ball_box(scalar_f64, abi::MAX_BOX_BALLS, 1);
        assert_eq!(
            demo_positions_len(ball_box),
            2 * abi::MAX_BOX_BALLS as usize
        );
        demo_free(ball_box);
        assert!(demo_new_ball_box(scalar_f64, abi::MAX_BOX_BALLS + 1, 1).is_null());
        let cradle = demo_new_cradle(scalar_f64, abi::MAX_CRADLE_BALLS, 1);
        assert!(!cradle.is_null());
        demo_free(cradle);
        assert!(demo_new_cradle(scalar_f64, abi::MAX_CRADLE_BALLS + 1, 1).is_null());
        let wide = demo_new_break_shot(scalar_f64, abi::MAX_BREAK_GAP);
        assert!(!wide.is_null());
        demo_free(wide);
        assert!(demo_new_break_shot(scalar_f64, abi::MAX_BREAK_GAP * 1.01).is_null());
    }
}

#[test]
fn collision_scenes_check_their_input_and_read_out() {
    let scalar_f64 = abi::SCALAR_F64;
    assert!(demo_new_ball_box(99, 10, 1).is_null(), "unknown scalar");
    assert!(demo_new_cradle(99, 5, 1).is_null());
    for gap in [f64::NAN, -1e-3, f64::INFINITY] {
        assert!(demo_new_break_shot(scalar_f64, gap).is_null(), "gap {gap}");
    }
    // SAFETY: every handle is from a `demo_new*` export (or null), and
    // freed once; null is allowed everywhere.
    unsafe {
        let demo = demo_new_break_shot(scalar_f64, 0.0);
        assert!(!demo.is_null());
        assert!(demo_momentum_x(demo) > 0.0 && demo_momentum_y(demo) == 0.0);
        for restitution in [f64::NAN, -0.1, 1.1] {
            assert_eq!(
                demo_set_restitution(demo, restitution),
                0,
                "restitution = {restitution}"
            );
        }
        assert_eq!(demo_set_restitution(demo, 0.5), 1);
        assert_eq!(demo_particle_radius(demo, 0), 0.05);
        assert!(demo_particle_radius(demo, 99).is_nan());
        let cell = demo_update_pairs(demo);
        assert!(cell > 0.1, "cell {cell}");
        let len = demo_pairs_len(demo);
        assert!(len > 0 && len.is_multiple_of(2));
        assert!(!demo_pairs_ptr(demo).is_null());
        demo_free(demo);

        // More pulled than balls swings them all; a fountain doesn't collide.
        let cradle = demo_new_cradle(scalar_f64, 3, u32::MAX);
        assert!(!cradle.is_null());
        demo_free(cradle);
        let fountain = demo_new(abi::DEMO_FOUNTAIN, scalar_f64, 10, 1);
        assert_eq!(demo_set_restitution(fountain, 0.5), 0, "nothing collides");
        assert!(demo_update_pairs(fountain).is_nan());
        assert_eq!(demo_pairs_len(fountain), 0);
        demo_free(fountain);

        let null = ptr::null_mut();
        assert!(demo_momentum_x(null).is_nan() && demo_momentum_y(null).is_nan());
        assert!(demo_particle_radius(null, 0).is_nan() && demo_update_pairs(null).is_nan());
        assert_eq!(
            (demo_pairs_len(null), demo_pairs_ptr(null)),
            (0, ptr::null())
        );
        assert_eq!(demo_set_restitution(null, 0.5), 0);
    }
}

#[test]
fn the_pool_table_parses_its_shots_at_the_boundary() {
    assert!(demo_new_pool(99).is_null());
    let demo = demo_new_pool(abi::SCALAR_F64);
    assert!(!demo.is_null());
    // SAFETY: `demo` from `demo_new_pool`, freed once; null is allowed.
    unsafe {
        assert_eq!((demo_segments_len(demo), demo_pockets_len(demo)), (72, 18));
        assert_eq!((demo_at_rest(demo), demo_tunnels(demo)), (1, 0.0));
        assert_eq!(
            (
                demo_ball_number(demo, 0),
                demo_ball_number(demo, 5),
                demo_ball_number(demo, 16)
            ),
            (0, 8, -1)
        );
        for (ax, ay, speed, tip) in [
            (1.0, 0.0, abi::MAX_POOL_SPEED * 1.01, 0.0),
            (1.0, 0.0, -0.1, 0.0),
            (1.0, 0.0, f64::NAN, 0.0),
            (1.0, 0.0, 3.0, abi::MAX_TIP + 0.01),
            (f64::NAN, 0.0, 3.0, 0.0),
            (0.0, 0.0, 3.0, 0.0),
        ] {
            assert_eq!(
                demo_strike(demo, ax, ay, speed, tip),
                0,
                "({ax}, {ay}) {speed} {tip}"
            );
        }
        assert_eq!(demo_set_speculative(demo, 2), 0);
        assert_eq!(demo_set_speculative(demo, 0), 1);
        assert_eq!(demo_respot_cue(demo), 0, "the cue ball is in play");
        assert_eq!(
            demo_strike(demo, 1.0, 0.0, abi::MAX_POOL_SPEED, abi::MAX_TIP),
            1
        );
        assert!(demo_spin_x(demo, 0) == 0.0 && demo_spin_x(demo, 99).is_nan());
        assert_eq!(demo_at_rest(demo), 0);
        assert_eq!(demo_potted_len(demo), 0);
        demo_free(demo);

        let fountain = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 10, 1);
        assert!(demo_tunnels(fountain).is_nan());
        assert_eq!(demo_ball_number(fountain, 0), -1);
        demo_free(fountain);
        let null = ptr::null_mut();
        assert_eq!(
            (demo_strike(null, 1.0, 0.0, 1.0, 0.0), demo_at_rest(null)),
            (0, 0)
        );
        assert!(demo_tunnels(null).is_nan());
    }
}

#[test]
fn a_step_cap_bounds_an_advance() {
    let demo = demo_new(abi::DEMO_FOUNTAIN, abi::SCALAR_F64, 10, 1);
    // SAFETY: `demo` from `demo_new`, freed once; null is allowed.
    unsafe {
        assert_eq!(demo_set_step_cap(demo, abi::MAX_RATE_HZ + 1), 0);
        assert_eq!(demo_set_step_cap(demo, 2), 1);
        assert_eq!(demo_advance(demo, 0.25), 2, "15 owed, 2 run");
        assert_eq!(demo_advance(demo, 1.0 / 60.0), 1, "nothing carried over");
        assert_eq!(demo_set_step_cap(demo, 0), 1, "0 lifts the cap");
        assert_eq!(demo_advance(demo, 0.25), 15);
        demo_free(demo);
        assert_eq!(demo_set_step_cap(ptr::null_mut(), 1), 0);
    }
}
