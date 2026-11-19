//! ns per boid-step for each way of finding neighbours, at the page's
//! density, warmed up: a plain binary, so it runs natively and as
//! `wasm32-wasip1` (under wasmtime, or Node's WASI), with and without
//! `simd128` (`docs/15-swarm.md`, "What's measured"). Not criterion:
//! criterion doesn't build for WASI.
// An example, not library code: printing is its output.
#![expect(clippy::print_stdout, clippy::unwrap_used, reason = "a timing tool")]

use std::time::Instant;

use math::convert::{f64_to_f32, u64_to_f64, usize_to_f64};
use swarm::{Arena, Flock, Neighbours, Params, Slime, SlimeParams, Vicsek, VicsekParams};

fn main() {
    for (method, sizes) in [
        (Neighbours::Brute, &[2_000_usize][..]),
        (Neighbours::Grid, &[1_000, 10_000][..]),
        (Neighbours::Sorted, &[1_000, 10_000, 100_000][..]),
    ] {
        for &boid_count in sizes {
            let scale = f64_to_f32((usize_to_f64(boid_count) / 10_000.0).sqrt());
            let arena = Arena::new(2560.0 * scale, 1440.0 * scale).unwrap();
            let mut flock = Flock::new(boid_count, arena, Params::ECE4760, 1).unwrap();
            flock.set_neighbours(Neighbours::Sorted);
            for _ in 0..300 {
                flock.step();
            }
            flock.set_neighbours(method);
            let steps: u64 = if boid_count >= 100_000 { 20 } else { 100 };
            let start = Instant::now();
            for _ in 0..steps {
                flock.step();
            }
            let nanoseconds = u64_to_f64(u64::try_from(start.elapsed().as_nanos()).unwrap());
            let per_step_ms = nanoseconds / u64_to_f64(steps) / 1e6;
            let per_boid = nanoseconds / u64_to_f64(steps) / usize_to_f64(boid_count);
            println!("{method:?} {boid_count}: {per_step_ms:.2} ms/step, {per_boid:.0} ns/boid");
        }
    }
    // Vicsek at the paper's density (ρ = 4), η = 2: brute force and the
    // periodic grid.
    for (brute, sizes) in [
        (true, &[400_usize, 4_000][..]),
        (false, &[400, 4_000, 10_000, 100_000][..]),
    ] {
        for &particle_count in sizes {
            let side = f64_to_f32((usize_to_f64(particle_count) / 4.0).sqrt());
            let mut vicsek =
                Vicsek::new(particle_count, side, VicsekParams::paper(2.0), 1).unwrap();
            vicsek.set_brute_force(brute);
            let steps: u64 = if brute && particle_count > 1_000 {
                5
            } else {
                100
            };
            let start = Instant::now();
            for _ in 0..steps {
                vicsek.step();
            }
            let nanoseconds = u64_to_f64(u64::try_from(start.elapsed().as_nanos()).unwrap());
            let label = if brute { "Vicsek brute" } else { "Vicsek grid" };
            println!(
                "{label} {particle_count}: {:.3} ms/step, {:.0} ns/particle",
                nanoseconds / u64_to_f64(steps) / 1e6,
                nanoseconds / u64_to_f64(steps) / usize_to_f64(particle_count)
            );
        }
    }
    // Physarum at the page's scale: 512² and 100k agents; and the field
    // alone (no agents' work: 1 agent).
    for (agent_count, label) in [
        (100_000_usize, "Slime 100k agents, 512²"),
        (1, "Slime field only, 512²"),
    ] {
        let mut slime = Slime::new(512, agent_count, SlimeParams::DEFAULT, 1).unwrap();
        for _ in 0..50 {
            slime.step();
        }
        let start = Instant::now();
        for _ in 0..100 {
            slime.step();
        }
        let nanoseconds = u64_to_f64(u64::try_from(start.elapsed().as_nanos()).unwrap());
        println!("{label}: {:.2} ms/step", nanoseconds / 100.0 / 1e6);
    }
}
