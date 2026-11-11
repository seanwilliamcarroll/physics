use super::super::{Demo, DemoKind, ScalarKind};
use super::PHYSICS_DT;

/// Advances `seconds` (whole) of real time, a physics step at a time.
fn run(d: &mut Demo, seconds: u32) {
    for _ in 0..seconds * 60 {
        d.advance(PHYSICS_DT);
    }
}

#[test]
fn the_table_is_racked_at_rest_with_its_cushions_and_pockets() {
    let d = Demo::new_pool(ScalarKind::F64).unwrap();
    assert_eq!(d.positions().len(), 2 * 16);
    assert_eq!(
        (d.segments().len(), d.pocket_circles().len()),
        (18 * 4, 6 * 3)
    );
    assert!(d.at_rest());
    assert_eq!(d.potted(), &[] as &[u32]);
    assert_eq!(d.tunnels(), Some(0));
    assert_eq!(
        (d.ball_number(0), d.ball_number(1), d.ball_number(16)),
        (Some(0), Some(1), None)
    );
    assert_eq!(d.spin(15), Some((0.0, 0.0)));
    assert_eq!(d.spin(16), None);
}

#[test]
fn a_break_moves_the_table_and_it_comes_to_rest() {
    let mut d = Demo::new_pool(ScalarKind::F64).unwrap();
    assert!(d.strike(1.0, 0.0, 10.0, 0.0));
    d.advance(PHYSICS_DT);
    assert!(!d.at_rest());
    run(&mut d, 8);
    assert!(
        d.at_rest(),
        "settled within 8 s (tests/billiards.rs: 6.0-6.5)"
    );
    assert!(d.potted().len().is_multiple_of(2));
    assert_eq!(d.tunnels(), Some(0));
}

#[test]
fn a_follow_shot_carries_topspin() {
    let mut d = Demo::new_pool(ScalarKind::F64).unwrap();
    assert!(d.strike(1.0, 0.0, 2.0, 0.5));
    let (wx, wy) = d.spin(0).unwrap();
    // Along +x, follow is ω_y > 0: 5 b v / 2R² with b = R/2.
    let r = engine::scenarios::POOL_BALL_RADIUS;
    assert!(
        wx == 0.0 && (wy - 5.0 * 0.5 * 2.0 / (2.0 * r)).abs() < 1e-9,
        "{wy}"
    );
}

#[test]
fn a_scratched_cue_ball_is_respotted_once_the_table_is_still() {
    let mut d = Demo::new_pool(ScalarKind::F64).unwrap();
    // From the head spot into the top-left corner pocket (pocket 0).
    assert!(d.strike(-0.635, 0.635, 3.0, 0.0));
    assert!(!d.respot_cue(), "the cue ball is in play");
    run(&mut d, 10);
    assert_eq!(d.potted(), &[0, 0]);
    assert!(!d.strike(1.0, 0.0, 1.0, 0.0), "no cue ball to strike");
    assert!(d.respot_cue());
    assert_eq!(
        d.particle_position(0),
        Some((-engine::scenarios::POOL_LENGTH / 4.0, 0.0))
    );
    assert!(d.strike(1.0, 0.0, 1.0, 0.0), "back in play");
}

#[test]
fn a_strike_needs_a_direction_and_a_table() {
    let mut d = Demo::new_pool(ScalarKind::F32).unwrap();
    assert!(!d.strike(0.0, 0.0, 1.0, 0.0), "no aim");
    let mut fountain = Demo::new(DemoKind::Fountain, ScalarKind::F64, 10, 1).unwrap();
    assert!(!fountain.strike(1.0, 0.0, 1.0, 0.0));
    assert!(!fountain.set_speculative(false), "nothing collides");
    assert_eq!((fountain.tunnels(), fountain.ball_number(0)), (None, None));
    assert_eq!(fountain.potted(), &[] as &[u32]);
    assert!(d.set_speculative(false));
}
