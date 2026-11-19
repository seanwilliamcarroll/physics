use super::super::{Demo, DemoKind, ScalarKind};
use super::PHYSICS_DT;

/// Advances `seconds` (whole) of real time, a physics step at a time.
fn run(demo: &mut Demo, seconds: u32) {
    for _ in 0..seconds * 60 {
        demo.advance(PHYSICS_DT);
    }
}

#[test]
fn the_table_is_racked_at_rest_with_its_cushions_and_pockets() {
    let demo = Demo::new_pool(ScalarKind::F64).unwrap();
    assert_eq!(demo.positions().len(), 2 * 16);
    assert_eq!(
        (demo.segments().len(), demo.pocket_circles().len()),
        (18 * 4, 6 * 3)
    );
    assert!(demo.at_rest());
    assert_eq!(demo.potted(), &[] as &[u32]);
    assert_eq!(demo.tunnels(), Some(0));
    assert_eq!(
        (
            demo.ball_number(0),
            demo.ball_number(1),
            demo.ball_number(16)
        ),
        (Some(0), Some(1), None)
    );
    assert_eq!(demo.spin(15), Some((0.0, 0.0)));
    assert_eq!(demo.spin(16), None);
}

#[test]
fn a_break_moves_the_table_and_it_comes_to_rest() {
    let mut demo = Demo::new_pool(ScalarKind::F64).unwrap();
    assert!(demo.strike(1.0, 0.0, 10.0, 0.0));
    demo.advance(PHYSICS_DT);
    assert!(!demo.at_rest());
    run(&mut demo, 8);
    assert!(
        demo.at_rest(),
        "settled within 8 s (tests/billiards.rs: 6.0-6.5)"
    );
    assert!(demo.potted().len().is_multiple_of(2));
    assert_eq!(demo.tunnels(), Some(0));
}

#[test]
fn a_follow_shot_carries_topspin() {
    let mut demo = Demo::new_pool(ScalarKind::F64).unwrap();
    assert!(demo.strike(1.0, 0.0, 2.0, 0.5));
    let (wx, wy) = demo.spin(0).unwrap();
    // Along +x, follow is ω_y > 0: 5 b v / 2R² with b = R/2.
    let radius = engine::scenarios::POOL_BALL_RADIUS;
    assert!(
        wx == 0.0 && (wy - 5.0 * 0.5 * 2.0 / (2.0 * radius)).abs() < 1e-9,
        "{wy}"
    );
}

#[test]
fn a_scratched_cue_ball_is_respotted_once_the_table_is_still() {
    let mut demo = Demo::new_pool(ScalarKind::F64).unwrap();
    // From the head spot into the top-left corner pocket (pocket 0).
    assert!(demo.strike(-0.635, 0.635, 3.0, 0.0));
    assert!(!demo.respot_cue(), "the cue ball is in play");
    run(&mut demo, 10);
    assert_eq!(demo.potted(), &[0, 0]);
    assert!(!demo.strike(1.0, 0.0, 1.0, 0.0), "no cue ball to strike");
    assert!(demo.respot_cue());
    assert_eq!(
        demo.particle_position(0),
        Some((-engine::scenarios::POOL_LENGTH / 4.0, 0.0))
    );
    assert!(demo.strike(1.0, 0.0, 1.0, 0.0), "back in play");
}

#[test]
fn a_strike_needs_a_direction_and_a_table() {
    let mut demo = Demo::new_pool(ScalarKind::F32).unwrap();
    assert!(!demo.strike(0.0, 0.0, 1.0, 0.0), "no aim");
    let mut fountain = Demo::new(DemoKind::Fountain, ScalarKind::F64, 10, 1).unwrap();
    assert!(!fountain.strike(1.0, 0.0, 1.0, 0.0));
    assert!(!fountain.set_speculative(false), "nothing collides");
    assert_eq!((fountain.tunnels(), fountain.ball_number(0)), (None, None));
    assert_eq!(fountain.potted(), &[] as &[u32]);
    assert!(demo.set_speculative(false));
}

/// The table's energy is kinetic plus spin: ½ m v² + m R² ω² / 5 right after
/// a follow shot.
#[test]
fn the_tables_energy_counts_spin() {
    use engine::scenarios::{POOL_BALL_MASS, POOL_BALL_RADIUS};
    let mut demo = Demo::new_pool(ScalarKind::F64).unwrap();
    assert_eq!(demo.energy(), Some(0.0));
    assert!(demo.strike(0.6, 0.8, 2.0, 0.5));
    let (wx, wy) = demo.spin(0).unwrap();
    let (mass, radius) = (POOL_BALL_MASS, POOL_BALL_RADIUS);
    let expected = 0.5 * mass * 4.0 + mass * radius * radius * (wx * wx + wy * wy) / 5.0;
    let energy = demo.energy().unwrap();
    assert!(
        (energy - expected).abs() < 1e-12 * expected,
        "{energy} vs {expected}"
    );
}
