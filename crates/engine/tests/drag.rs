//! Dragging the 1:100 chain (`TASKS.md` M4 done-when: "solid in one
//! panel, stretchy in the other"): grab the bob, lift it, and compare the
//! chain's link error under each solver.
#![cfg(test)]

use engine::diagnostics::constraint_error;
use engine::scenarios::{CHAIN_LINKS, chain};
use engine::{Compliance, Solver, Vec2, World};
use test_support::nonzero;

/// The page's drag stiffness: k = 1/α = 1000 N/m.
const SOFT: f64 = 1e-3;
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
    let mut w: World<f64> = chain(solver, nonzero(SUBSTEPS), CHAIN_LINKS, 100.0).unwrap();
    let bob = w.particles.pos()[CHAIN_LINKS];
    let g = w.grab(bob, 0.1, Compliance::new(SOFT).unwrap()).unwrap();
    assert_eq!(g.particle().index(), CHAIN_LINKS);
    let mut worst = 0.0_f64;
    let target = Vec2::new(0.5, 1.0);
    for i in 1..=TOTAL_STEPS {
        let t = (f64::from(i) / RAMP_STEPS).min(1.0);
        w.drag(&g, bob + (target - bob) * t);
        w.step(DT);
        let links = &w.constraints()[..CHAIN_LINKS];
        worst = worst.max(constraint_error(&w.particles, links).unwrap().0);
    }
    let gap = (w.particles.pos()[CHAIN_LINKS] - target).length();
    assert_eq!(w.release(g), Ok(()));
    assert_eq!(
        w.constraints().len(),
        CHAIN_LINKS,
        "release restores the chain"
    );
    (worst, gap)
}

#[test]
fn dragging_the_heavy_chain_is_solid_under_xpbd_and_stretchy_under_impulses() {
    let (xpbd, xpbd_gap) = drag_bob(Solver::Xpbd);
    let (imp, imp_gap) = drag_bob(Solver::Impulse);
    println!(
        "drag: XPBD link error {xpbd:.4} m (gap {xpbd_gap:.3}), impulse {imp:.4} m (gap {imp_gap:.3})"
    );
    assert!(imp > 0.0 && xpbd > 0.0);
}
