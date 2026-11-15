//! Times `PairwiseGravity::accumulate` on the cluster scene at small sizes,
//! to find where the vector loops start to beat the plain one
//! (`GRAVITY_PLAIN_BELOW`, `docs/gravity-vectorize.md`). Run it twice and
//! compare:
//!
//! ```sh
//! GRAVITY_PLAIN_BELOW=1000000 cargo run --release -p engine --example gravity_cutoff  # plain
//! GRAVITY_PLAIN_BELOW=1 cargo run --release -p engine --example gravity_cutoff        # vector
//! ```
//!
//! Add `--target wasm32-wasip1` to run it under wasmtime. Not criterion: a
//! quick table, the best of several timed batches per size.
#![expect(clippy::unwrap_used, reason = "fixed scenes that can't fail")]
#![expect(clippy::print_stdout, reason = "a timing table is its output")]

use std::hint::black_box;
use std::time::Instant;

use engine::scenarios::{cluster, cluster_gravity};
use engine::{Force, Scalar, Vec2};

const SIZES: [usize; 12] = [8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 512];

fn time<S: Scalar>(n: usize) -> f64 {
    let gravity = cluster_gravity::<S>().unwrap();
    let w = cluster::<S>(n, 1).unwrap();
    let mut acc = vec![Vec2::ZERO; n];
    // About 20 ms a batch; the best of 7 batches.
    let pairs = (n * (n - 1) / 2).max(1);
    let reps = (4_000_000 / pairs).max(10);
    let mut best = f64::INFINITY;
    for _ in 0..7 {
        let start = Instant::now();
        for _ in 0..reps {
            acc.fill(Vec2::ZERO);
            gravity.accumulate(black_box(w.particles()), &mut acc);
        }
        #[expect(clippy::cast_precision_loss, reason = "a count of runs")]
        let per = start.elapsed().as_secs_f64() / reps as f64;
        best = best.min(per);
    }
    best * 1e9
}

fn main() {
    println!(
        "GRAVITY_PLAIN_BELOW={} GRAVITY_LANES={} GRAVITY_LOOP={}",
        option_env!("GRAVITY_PLAIN_BELOW").unwrap_or("(default)"),
        option_env!("GRAVITY_LANES").unwrap_or("(default)"),
        option_env!("GRAVITY_LOOP").unwrap_or("(default)")
    );
    println!("{:>6} {:>12} {:>12}", "n", "f64 ns", "f32 ns");
    for n in SIZES {
        println!("{n:>6} {:>12.0} {:>12.0}", time::<f64>(n), time::<f32>(n));
    }
}
