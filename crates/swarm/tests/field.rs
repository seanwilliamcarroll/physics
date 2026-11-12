//! S3's field (`docs/15-swarm.md`, S3: "Deposit, diffuse, decay"):
//! accounting and symmetry, measured.
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
    let (w, h) = (120_usize, 80_usize);
    let mut rng = SplitMix64::new(3);
    let open: Vec<bool> = (0..w * h).map(|_| rng.next_unit_f64() > 0.2).collect();
    let mut f = Field::new(w, h).unwrap();
    let pick = |rng: &mut SplitMix64, n: usize| {
        usize::try_from(rng.next_u64() % u64::try_from(n).unwrap()).unwrap()
    };
    for _ in 0..2000 {
        let before = f.total();
        let mut added = 0.0;
        for _ in 0..200 {
            let (x, y) = (pick(&mut rng, w), pick(&mut rng, h));
            if open[y * w + x] && f.deposit(x, y, 1.0) {
                added += 1.0;
            }
        }
        assert!(
            (f.total() - (before + added)).abs() < 1e-6 * (before + added),
            "deposits"
        );
        let mixed = f.total();
        f.diffuse(&open, 0.3);
        assert!((f.total() / mixed - 1.0).abs() < 3e-8, "diffusion");
        let diffused = f.total();
        f.decay(0.01);
        assert!((f.total() / (diffused * 0.99) - 1.0).abs() < 3e-7, "decay");
    }
    // Walls never hold anything.
    for (i, &o) in open.iter().enumerate() {
        if !o {
            assert_eq!(f.values()[i], 0.0);
        }
    }
}

/// A deposit at the centre of an open 41 × 41 box, 60 diffusions: the
/// spread stays mirror- and diagonal-symmetric to f32 rounding (the sweep
/// order adds into cells in different orders). Measured: 2.0e-7 of the
/// centre's value. Bound 2e-6.
#[test]
fn diffusion_spreads_symmetrically() {
    let n = 41;
    let mut g = Field::new(n, n).unwrap();
    g.deposit(20, 20, 1000.0);
    let all = vec![true; n * n];
    for _ in 0..60 {
        g.diffuse(&all, 0.5);
    }
    let centre = g.get(20, 20).unwrap();
    for y in 0..n {
        for x in 0..n {
            let v = g.get(x, y).unwrap();
            for (mx, my) in [(n - 1 - x, y), (x, n - 1 - y), (y, x)] {
                let d = (v - g.get(mx, my).unwrap()).abs() / centre;
                assert!(d < 2e-6, "({x}, {y}) against ({mx}, {my}): {d:e}");
            }
        }
    }
}
