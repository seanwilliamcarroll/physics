//! S4's measurements (`docs/15-swarm.md`, S4.3): concentration (the top
//! 10% of cells' share of the field) against a random walk, the network's
//! contraction, a small parameter map, and nutrient nodes.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]
#![expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    clippy::cast_precision_loss,
    reason = "small, in-range geometry in a test"
)]

use std::collections::HashSet;

use swarm::{Slime, SlimeParams};

const DEG: f32 = core::f32::consts::PI / 180.0;

/// 6,000 agents on a 128² field (37% occupancy), concentration after
/// `steps`.
fn concentration(p: SlimeParams, sensing: bool, seed: u64, steps: u32) -> f64 {
    let mut s = Slime::new(128, 6000, p, seed).unwrap();
    s.set_sensing(sensing);
    for _ in 0..steps {
        s.step();
    }
    s.field().top_share(0.1)
}

/// Sensing concentrates the field; a random walk (same deposits) leaves
/// it near uniform. Measured at 1,000 steps: 0.968–0.969 against
/// 0.127–0.131 (a uniform field's is 0.1). Bounds 0.9 and 0.2.
#[test]
fn sensing_concentrates_the_field() {
    for seed in [1, 2] {
        let (with, walk) = (
            concentration(SlimeParams::DEFAULT, true, seed, 1000),
            concentration(SlimeParams::DEFAULT, false, seed, 1000),
        );
        assert!(with > 0.9 && walk < 0.2, "seed {seed}: {with} vs {walk}");
    }
}

/// The network contracts: at 250 steps a web of strands (concentration
/// 0.76–0.81), by 1,500 a single straight band wrapping the periodic
/// world (0.97), the shortest loop a torus allows (Jones's "circular
/// contraction of network lacunae", abstract). Bound: up by 0.1.
#[test]
fn the_network_contracts() {
    for seed in [1, 2] {
        let (early, late) = (
            concentration(SlimeParams::DEFAULT, true, seed, 250),
            concentration(SlimeParams::DEFAULT, true, seed, 1500),
        );
        assert!(late > early + 0.1, "seed {seed}: {early} -> {late}");
    }
}

/// A corner of Jones's "parameter mapping": SA × RA give different
/// patterns. Measured (seed 1, 1,500 steps), concentration:
///
/// | SA \ RA | 22.5° | 45° | 90° |
/// |---|---|---|---|
/// | 11.25° | 0.972 | 0.966 | 0.835 |
/// | 22.5° | 0.913 | 0.968 | 0.804 |
/// | 45° | 0.780 | 0.721 | 0.960 |
/// | 90° | 0.987 | 0.745 | 1.000 |
///
/// Pinned: SA 45°, RA 45° stays spread (under 0.8) where the default
/// (22.5°, 45°) collapses to a band (over 0.9).
#[test]
fn the_parameters_change_the_pattern() {
    let at = |sa: f32, ra: f32| {
        let p = SlimeParams {
            sensor_angle: sa * DEG,
            turn: ra * DEG,
            ..SlimeParams::DEFAULT
        };
        concentration(p, true, 1, 1500)
    };
    let (spread, band) = (at(45.0, 45.0), at(22.5, 45.0));
    assert!(spread < 0.8 && band > 0.9, "{spread} vs {band}");
}

/// The field on the straight lines between three nodes (away from the
/// nodes themselves) over its mean elsewhere.
fn node_ratio(sensing: bool, seed: u64) -> f64 {
    let mut s = Slime::new(128, 1000, SlimeParams::DEFAULT, seed).unwrap();
    s.set_sensing(sensing);
    let pts = [(30_usize, 30_usize), (98, 40), (60, 100)];
    for &(x, y) in &pts {
        assert!(s.add_node(x, y, 1000.0));
    }
    for _ in 0..2000 {
        s.step();
    }
    let mut on = HashSet::new();
    for i in 0..3 {
        let (a, b) = (pts[i], pts[(i + 1) % 3]);
        for k in 0..=200 {
            let t = f64::from(k) / 200.0;
            let x = a.0 as f64 + (b.0 as f64 - a.0 as f64) * t;
            let y = a.1 as f64 + (b.1 as f64 - a.1 as f64) * t;
            let near = |p: (usize, usize)| (x - p.0 as f64).hypot(y - p.1 as f64) < 12.0;
            if !near(a) && !near(b) {
                on.insert((x as usize, y as usize));
            }
        }
    }
    let f = s.field();
    let (mut sum_on, mut sum_all) = (0.0, 0.0);
    for y in 0..128 {
        for x in 0..128 {
            let v = f64::from(f.get(x, y).unwrap());
            sum_all += v;
            if on.contains(&(x, y)) {
                sum_on += v;
            }
        }
    }
    (sum_on / on.len() as f64) / ((sum_all - sum_on) / (128.0 * 128.0 - on.len() as f64))
}

/// Nutrient nodes (Jones 2011's sources; not read): three strong nodes,
/// 1,000 agents, 2,000 steps. **Seed-dependent**: measured on/off ratio
/// 3.91 and 4.18 for seeds 1 and 3 (trails link the nodes), 0.08 for
/// seed 2 (its band wraps the torus elsewhere); a random walk 0.64 (the
/// nodes' own glow, around them, counts as "elsewhere").
/// Weaker nodes or more agents connect less (see the doc). Pinned as
/// measured: seeds 1 and 3 over 2.5, seed 2 under 0.5, the walk under 1.
#[test]
fn strong_nodes_are_linked_in_some_seeds() {
    let r: Vec<f64> = (1..=3).map(|seed| node_ratio(true, seed)).collect();
    assert!(r[0] > 2.5 && r[2] > 2.5 && r[1] < 0.5, "{r:?}");
    let walk = node_ratio(false, 1);
    assert!(walk < 1.0, "walk {walk}");
}
