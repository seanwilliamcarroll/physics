//! S5.3's result, pinned (`docs/15-swarm.md`, S5.3): the evolved ant
//! constants against S3's defaults on held-out seeds, in the training
//! scene and in the barriers scene evolution never saw.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{AntParams, Colony};

fn training(p: AntParams, seed: u64) -> u64 {
    let mut c = Colony::new(200, 120, 500, (30.0, 60.0, 6.0), p, seed).unwrap();
    c.paint_food(160.0, 60.0, 8.0, 50);
    for _ in 0..3000 {
        c.step();
    }
    c.delivered()
}

fn barriers(p: AntParams, seed: u64) -> u64 {
    let mut c = Colony::new(200, 120, 500, (24.0, 60.0, 5.0), p, seed).unwrap();
    for (x, y0, y1) in [(70.0_f32, 0.0_f32, 78.0_f32), (110.0, 42.0, 120.0)] {
        let mut y = y0;
        while y <= y1 {
            c.paint_wall(x, y, 2.0);
            y += 1.0;
        }
    }
    c.paint_food(150.0, 60.0, 8.0, 100);
    for _ in 0..3000 {
        c.step();
    }
    c.delivered()
}

/// Over held-out `seeds`: evolved above twice the defaults' best in the
/// training scene, five times in the barriers scene.
fn generalizes(seeds: core::ops::Range<u64>) {
    for (name, scene, factor) in [
        ("training", training as fn(AntParams, u64) -> u64, 2),
        ("barriers", barriers, 5),
    ] {
        let d: Vec<u64> = seeds
            .clone()
            .map(|s| scene(AntParams::DEFAULT, s))
            .collect();
        let e: Vec<u64> = seeds
            .clone()
            .map(|s| scene(AntParams::EVOLVED, s))
            .collect();
        let best_default = *d.iter().max().unwrap();
        assert!(
            e.iter().all(|&x| x > factor * best_default),
            "{name}: defaults {d:?}, evolved {e:?}"
        );
    }
}

/// Measured over held-out seeds 1000–1007 (`examples/evolve_ants.rs`):
/// training scene, defaults 1,392–1,813 and evolved 5,370–5,420; barriers,
/// defaults 282–543 and evolved 3,957–4,015. Every push runs seed 1000;
/// all eight in `cargo xtask slow`.
#[test]
fn the_evolved_setting_generalizes() {
    generalizes(1000..1001);
}

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_the_evolved_setting_generalizes_on_every_held_out_seed() {
    generalizes(1000..1008);
}

#[test]
fn the_evolved_setting_is_usable() {
    assert_eq!(AntParams::EVOLVED.checked(), Some(AntParams::EVOLVED));
}
