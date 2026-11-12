//! `v_a` against η at Fig. 2a's sizes (Vicsek et al. 1995; ρ ≈ 4): for
//! each η, a transient discarded and `v_a` averaged over a window, over
//! several seeds (mean and s.d.). `cargo run --release -p swarm --example
//! vicsek_sweep [N ...]`; with no N, Fig. 2a's 40, 100, 400, 4000.
// An example, not library code: printing is its output.
#![expect(
    clippy::print_stdout,
    clippy::unwrap_used,
    reason = "a measurement tool"
)]

use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{Vicsek, VicsekParams};

/// Fig. 2a's (N, L).
const FIG_2A: [(usize, f64); 5] = [
    (40, 3.1),
    (100, 5.0),
    (400, 10.0),
    (4000, 31.6),
    (10_000, 50.0),
];
const SEEDS: u64 = 5;
const TRANSIENT: u32 = 3000;
const WINDOW: u32 = 3000;

fn main() {
    let wanted: Vec<usize> = std::env::args()
        .skip(1)
        .filter_map(|a| a.parse().ok())
        .collect();
    let sizes: Vec<(usize, f64)> = FIG_2A
        .iter()
        .copied()
        .filter(|(n, _)| {
            if wanted.is_empty() {
                *n <= 4000
            } else {
                wanted.contains(n)
            }
        })
        .collect();
    for (n, l) in sizes {
        println!(
            "N = {n}, L = {l} (rho = {:.2}), {SEEDS} seeds, {TRANSIENT} + {WINDOW} steps",
            usize_to_f64(n) / (l * l)
        );
        for k in 0..=20_u32 {
            let eta = f64::from(k) * 0.25;
            let runs: Vec<f64> = (1..=SEEDS)
                .map(|seed| {
                    let mut v =
                        Vicsek::new(n, f64_to_f32(l), VicsekParams::paper(f64_to_f32(eta)), seed)
                            .unwrap();
                    v.mean_order(TRANSIENT, WINDOW)
                })
                .collect();
            let mean = runs.iter().sum::<f64>() / usize_to_f64(runs.len());
            let sd = (runs.iter().map(|r| (r - mean).powi(2)).sum::<f64>()
                / usize_to_f64(runs.len()))
            .sqrt();
            println!("  eta {eta:.2}  v_a {mean:.3} ± {sd:.3}");
        }
    }
}
