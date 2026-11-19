//! The field's accounting and symmetry, measured (`docs/15-swarm.md`,
//! "Deposit, diffuse, decay").
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use swarm::Field;

/// 120 × 80 cells, a fifth of them walls at random, 200 unit deposits a
/// step for 2,000 steps. Diffusion alone changes the total by at most
/// 3.3e-9 (relative) a step, measured; decay matches `(1 − E)` to
/// 2.9e-8 (f32 multiplies). Bounds 3e-8 and 3e-7. Deposits add exactly
/// their amount (unit deposits on f32 totals well below 2²⁴).
#[test]
fn deposit_diffuse_decay_keep_their_accounts() {
    let (width, height) = (120_usize, 80_usize);
    let mut rng = SplitMix64::new(3);
    let open: Vec<bool> = (0..width * height)
        .map(|_| rng.next_unit_f64() > 0.2)
        .collect();
    let mut field = Field::new(width, height).unwrap();
    let pick = |rng: &mut SplitMix64, limit: usize| {
        usize::try_from(rng.next_u64() % u64::try_from(limit).unwrap()).unwrap()
    };
    for _ in 0..2000 {
        let before = field.total();
        let mut added = 0.0;
        for _ in 0..200 {
            let (x, y) = (pick(&mut rng, width), pick(&mut rng, height));
            if open[y * width + x] && field.deposit(x, y, 1.0) {
                added += 1.0;
            }
        }
        assert!(
            (field.total() - (before + added)).abs() < 1e-6 * (before + added),
            "deposits"
        );
        let deposited = field.total();
        field.diffuse(&open, 0.3);
        assert!((field.total() / deposited - 1.0).abs() < 3e-8, "diffusion");
        let diffused = field.total();
        field.decay(0.01);
        assert!(
            (field.total() / (diffused * 0.99) - 1.0).abs() < 3e-7,
            "decay"
        );
    }
    for (index, &is_open) in open.iter().enumerate() {
        if !is_open {
            assert_eq!(field.values()[index], 0.0);
        }
    }
}

/// A deposit at the centre of an open 41 × 41 box, 60 diffusions: the
/// spread stays mirror- and diagonal-symmetric to f32 rounding (the sweep
/// order adds into cells in different orders). Measured: 2.0e-7 of the
/// centre's value. Bound 2e-6.
#[test]
fn diffusion_spreads_symmetrically() {
    let side = 41;
    let mut field = Field::new(side, side).unwrap();
    field.deposit(20, 20, 1000.0);
    let open = vec![true; side * side];
    for _ in 0..60 {
        field.diffuse(&open, 0.5);
    }
    let centre = field.get(20, 20).unwrap();
    for y in 0..side {
        for x in 0..side {
            let value = field.get(x, y).unwrap();
            for (mirror_x, mirror_y) in [(side - 1 - x, y), (x, side - 1 - y), (y, x)] {
                let difference = (value - field.get(mirror_x, mirror_y).unwrap()).abs() / centre;
                assert!(
                    difference < 2e-6,
                    "({x}, {y}) against ({mirror_x}, {mirror_y}): {difference:e}"
                );
            }
        }
    }
}
