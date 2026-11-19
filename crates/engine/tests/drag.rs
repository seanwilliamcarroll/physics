//! Dragging the 1:100 chain: grab the bob, flick it, hold, and check the
//! chain holds and follows under each solver.
#![cfg(test)]

use engine::diagnostics::constraint_error;
use engine::scenarios::{CHAIN_LINKS, chain};
use engine::{Compliance, Solver, Vec2, World};
use test_support::{nonzero, time_step};

/// The page's drag compliance: stiffness 1/compliance = 1000 N/m.
const DRAG_COMPLIANCE: f64 = 1e-3;
const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 20;

/// The flick: the anchor reaches its target in 0.2 s (12 steps), then
/// holds for the rest of 2 s. A slow drag barely accelerates the chain and
/// hides the difference (1 s ramp: 5.2 mm vs 11.8 cm, still 23x, but most
/// of it after the ramp); the flick is what the page invites.
const RAMP_STEPS: f64 = 12.0;
const TOTAL_STEPS: u32 = 120;

/// Grabs the bob, flicks it 1 m up and 0.5 m out, holds, and returns
/// (largest link error seen, bob's final distance from the anchor). The
/// drag rod itself is excluded from the link error.
fn drag_bob(solver: Solver) -> (f64, f64) {
    let mut world: World<f64> = chain(solver, nonzero(SUBSTEPS), CHAIN_LINKS, 100.0).unwrap();
    let bob_start = world.particles().positions()[CHAIN_LINKS];
    let grab = world
        .grab(bob_start, 0.1, Compliance::new(DRAG_COMPLIANCE).unwrap())
        .unwrap();
    assert_eq!(grab.particle().index(), CHAIN_LINKS);
    let mut worst = 0.0_f64;
    let target = Vec2::new(0.5, 1.0);
    for step in 1..=TOTAL_STEPS {
        let progress = (f64::from(step) / RAMP_STEPS).min(1.0);
        world.drag(&grab, bob_start + (target - bob_start) * progress);
        world.step(time_step(DT));
        let links = &world.constraints()[..CHAIN_LINKS];
        worst = worst.max(constraint_error(world.particles(), links).unwrap().0);
    }
    let gap = (world.particles().positions()[CHAIN_LINKS] - target).length();
    assert_eq!(world.release(grab), Ok(()));
    assert_eq!(
        world.constraints().len(),
        CHAIN_LINKS,
        "release restores the chain"
    );
    (worst, gap)
}

/// Measured (split impulses, f64): XPBD's links stretch at most 8.1 mm and
/// impulse's 10.0 mm during the flick; both bobs end ~7.8 cm from the
/// anchor (the drag spring's sag). Both hold: once position error is
/// corrected positionally, the solvers behave alike here. (Classic
/// Baumgarte blew up here, 18.3 cm for impulse.) Bounds ~10x.
#[test]
fn dragging_the_heavy_chain_holds_under_both_solvers() {
    let (xpbd_error, xpbd_gap) = drag_bob(Solver::Xpbd);
    let (impulse_error, impulse_gap) = drag_bob(Solver::Impulse);
    assert!(xpbd_error < 0.08, "XPBD link error {xpbd_error} m");
    assert!(impulse_error < 0.1, "impulse link error {impulse_error} m");
    assert!(
        xpbd_gap < 0.8 && impulse_gap < 0.8,
        "gaps {xpbd_gap} / {impulse_gap} m"
    );
}
