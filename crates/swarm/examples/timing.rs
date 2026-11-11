//! ns per boid-step for each way of finding neighbours, at the page's
//! density, warmed up: a plain binary, so it runs natively and as
//! `wasm32-wasip1` (under wasmtime, or Node's WASI), with and without
//! `simd128` (`docs/15-swarm.md`, "What's measured"). Not criterion:
//! criterion doesn't build for WASI.
// An example, not library code: printing is its output.
#![expect(clippy::print_stdout, clippy::unwrap_used, reason = "a timing tool")]

use std::time::Instant;

use math::convert::{f64_to_f32, u64_to_f64, usize_to_f64};
use swarm::{Arena, Flock, Neighbours, Params};

fn main() {
    for (how, sizes) in [
        (Neighbours::Grid, &[1_000_usize, 10_000][..]),
        (Neighbours::Sorted, &[1_000, 10_000, 100_000][..]),
    ] {
        for &n in sizes {
            let scale = f64_to_f32((usize_to_f64(n) / 10_000.0).sqrt());
            let arena = Arena::new(2560.0 * scale, 1440.0 * scale).unwrap();
            let mut f = Flock::new(n, arena, Params::ECE4760, 1).unwrap();
            f.set_neighbours(Neighbours::Sorted);
            for _ in 0..300 {
                f.step();
            }
            f.set_neighbours(how);
            let steps: u64 = if n >= 100_000 { 20 } else { 100 };
            let t = Instant::now();
            for _ in 0..steps {
                f.step();
            }
            let ns = u64_to_f64(u64::try_from(t.elapsed().as_nanos()).unwrap());
            let per_step_ms = ns / u64_to_f64(steps) / 1e6;
            let per_boid = ns / u64_to_f64(steps) / usize_to_f64(n);
            println!("{how:?} {n}: {per_step_ms:.2} ms/step, {per_boid:.0} ns/boid");
        }
    }
}
