//! S4's model (`docs/15-swarm.md`, S4): the field's accounting with the
//! periodic mean filter, and the agents' invariants.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{Slime, SlimeParams};

/// 5,000 agents and a node on a 128² field, 1,000 steps. Each step:
/// `Σ(t+1) = (Σ(t) + deposits)(1 − E)`, the mean filter conserving on
/// the periodic grid. Measured worst relative error: 2.8e-8. Bound 3e-7.
/// Agents stay in the field.
#[test]
fn the_field_keeps_its_accounts_and_agents_stay_in_the_world() {
    let mut s = Slime::new(128, 5000, SlimeParams::DEFAULT, 1).unwrap();
    assert!(s.add_node(30, 30, 3.0));
    let keep = 1.0 - f64::from(SlimeParams::DEFAULT.decay);
    for _ in 0..1000 {
        let before = s.field().total();
        s.step();
        let expected = (before + s.last_deposits()) * keep;
        let off = (s.field().total() / expected - 1.0).abs();
        assert!(off < 3e-7, "off by {off:e}");
        assert!(
            s.positions()
                .all(|(x, y)| (0.0..128.0).contains(&x) && (0.0..128.0).contains(&y))
        );
    }
}
