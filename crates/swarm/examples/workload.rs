//! One workload, alone, for a few seconds: something to point a profiler
//! at (`docs/profiling.md`).
//!
//!   cargo run --profile profiling -p swarm --example workload -- ants [SECONDS]
//!
//! Workloads: `boids` (10k, sorted lanes), `vicsek` (4,000, the grid),
//! `ants` (the page's 200 × 120 world, 500 ants, food), `slime` (512²,
//! 100k agents). Each at its page's size.
// An example, not library code: printing is its output.
#![expect(
    clippy::print_stdout,
    clippy::print_stderr,
    clippy::unwrap_used,
    reason = "a profiling tool"
)]

use std::time::{Duration, Instant};

use math::convert::u64_to_f64;
use swarm::{
    AntParams, Arena, Colony, Flock, Neighbours, Params, Slime, SlimeParams, Vicsek, VicsekParams,
};

/// Steps `step` until `seconds` have passed; the step count.
fn run(seconds: f64, mut step: impl FnMut()) -> u64 {
    let end = Instant::now() + Duration::from_secs_f64(seconds);
    let mut steps = 0;
    while Instant::now() < end {
        for _ in 0..16 {
            step();
        }
        steps += 16;
    }
    steps
}

fn main() {
    let mut args = std::env::args().skip(1);
    let what = args.next().unwrap_or_default();
    let seconds = args.next().and_then(|s| s.parse().ok()).unwrap_or(3.0);
    let steps = match what.as_str() {
        "boids" => {
            let arena = Arena::new(2560.0, 1440.0).unwrap();
            let mut f = Flock::new(10_000, arena, Params::ECE4760, 1).unwrap();
            f.set_neighbours(Neighbours::Sorted);
            run(seconds, || f.step())
        }
        "vicsek" => {
            let mut v = Vicsek::new(4_000, 31.6, VicsekParams::paper(2.0), 1).unwrap();
            run(seconds, || v.step())
        }
        "ants" => {
            let mut c =
                Colony::new(200, 120, 500, (25.0, 60.0, 6.0), AntParams::DEFAULT, 1).unwrap();
            c.paint_food(160.0, 60.0, 8.0, 50);
            run(seconds, || c.step())
        }
        "slime" => {
            let mut s = Slime::new(512, 100_000, SlimeParams::DEFAULT, 1).unwrap();
            run(seconds, || s.step())
        }
        _ => {
            eprintln!("usage: workload boids|vicsek|ants|slime [SECONDS]");
            std::process::exit(2);
        }
    };
    println!(
        "{what}: {steps} steps in {seconds} s, {:.1} µs a step",
        seconds * 1e6 / u64_to_f64(steps)
    );
}
