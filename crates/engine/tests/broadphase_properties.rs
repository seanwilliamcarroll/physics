//! The broadphase's contract (`docs/08-collision.md`, "Contact
//! generation"): its candidate pairs are a **superset** of the pairs that
//! truly overlap. Missing a pair is a bug (a collision silently skipped);
//! extra pairs only cost time.
#![cfg(test)]

use engine::Vec2;
use engine::collision::candidate_pairs;
use proptest::prelude::*;
use test_support::proptest_config;

/// Circles: position in a 4 m box, radius 0 (a point) or 1–20 cm.
fn circles() -> impl Strategy<Value = Vec<(f64, f64, f64)>> {
    prop::collection::vec(
        (
            -2.0..2.0_f64,
            -2.0..2.0_f64,
            prop_oneof![Just(0.0), 0.01..0.2_f64],
        ),
        0..60,
    )
}

fn brute_force(pos: &[Vec2<f64>], radius: &[f64]) -> Vec<(usize, usize)> {
    let mut pairs = Vec::new();
    for a in 0..pos.len() {
        for b in a + 1..pos.len() {
            let (ra, rb) = (radius[a], radius[b]);
            if ra > 0.0 && rb > 0.0 && (pos[b] - pos[a]).length() < ra + rb {
                pairs.push((a, b));
            }
        }
    }
    pairs
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn grid_pairs_are_a_superset_of_true_overlaps(c in circles()) {
        let pos: Vec<_> = c.iter().map(|&(x, y, _)| Vec2::new(x, y)).collect();
        let radius: Vec<_> = c.iter().map(|&(_, _, r)| r).collect();
        let max_r = radius.iter().copied().fold(0.0, f64::max);
        let mut grid = Vec::new();
        candidate_pairs(&pos, &radius, 2.0 * max_r, &mut grid);
        for pair in brute_force(&pos, &radius) {
            prop_assert!(grid.contains(&pair), "missed {pair:?}");
        }
        // Each pair once, ordered, sorted: deterministic output.
        prop_assert!(grid.iter().all(|&(a, b)| a < b));
        prop_assert!(grid.windows(2).all(|w| w[0] < w[1]));
    }
}
