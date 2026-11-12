//! Evolves S3's ant constants (`docs/15-swarm.md`, S5.3): the fitness is
//! food delivered in S3's foraging scene (3,000 steps), the mean over the
//! generation's common seeds; the run starts from the hand-scanned
//! defaults. Then the best against the defaults on held-out seeds, in the
//! training scene and in the barriers scene it never saw.
//!
//! `cargo run --release -p swarm --example evolve_ants [generations]
//! [population] [threads]`; prints the history (a JSON line per
//! generation) and the comparison.
// An example, not library code: printing is its output.
#![expect(
    clippy::print_stdout,
    clippy::unwrap_used,
    reason = "a measurement tool"
)]

use swarm::{AntParams, Colony, Evolve, Gene, evolve, mean_over};

const DEG: f64 = core::f64::consts::PI / 180.0;

/// The seven genes: SA, SD, RA, wiggle, fall-off, diffusion, decay.
fn genes() -> Vec<Gene> {
    let g = |lo: f64, hi: f64| Gene { lo, hi };
    vec![
        g(0.0, 90.0 * DEG),
        g(1.0, 30.0),
        g(0.0, 90.0 * DEG),
        g(0.0, 90.0 * DEG),
        g(0.0, 0.2),
        g(0.0, 0.5),
        g(0.0, 0.05),
    ]
}

#[expect(clippy::cast_possible_truncation, reason = "genes within f32's range")]
fn params(g: &[f64]) -> AntParams {
    let f = |i: usize| g.get(i).copied().unwrap_or(0.0) as f32;
    AntParams {
        sensor_angle: f(0),
        sensor_distance: f(1),
        turn: f(2),
        wiggle: f(3),
        falloff: f(4),
        diffusion: f(5),
        decay: f(6),
        ..AntParams::DEFAULT
    }
}

fn genome(p: AntParams) -> Vec<f64> {
    [
        p.sensor_angle,
        p.sensor_distance,
        p.turn,
        p.wiggle,
        p.falloff,
        p.diffusion,
        p.decay,
    ]
    .map(f64::from)
    .to_vec()
}

/// S3's training scene: 200 × 120, the nest left, food 130 cells away.
fn training(p: AntParams, seed: u64) -> f64 {
    let mut c = Colony::new(200, 120, 500, (30.0, 60.0, 6.0), p, seed).unwrap();
    c.paint_food(160.0, 60.0, 8.0, 50);
    run(c)
}

/// The barriers scene (`site/js/ant-scenes.ts`): walls between nest and food.
fn barriers(p: AntParams, seed: u64) -> f64 {
    let (w, h) = (200.0_f32, 120.0_f32);
    let mut c = Colony::new(200, 120, 500, (w * 0.12, h / 2.0, 5.0), p, seed).unwrap();
    for (x, y0, y1) in [(w * 0.35, 0.0, h * 0.65), (w * 0.55, h * 0.35, h)] {
        let mut y = y0;
        while y <= y1 {
            c.paint_wall(x, y, 2.0);
            y += 1.0;
        }
    }
    c.paint_food(w * 0.75, h / 2.0, 8.0, 100);
    run(c)
}

fn run(mut c: Colony) -> f64 {
    for _ in 0..3000 {
        c.step();
    }
    math::convert::u64_to_f64(c.delivered())
}

fn main() {
    let arg = |i: usize, d: usize| {
        std::env::args()
            .nth(i)
            .and_then(|a| a.parse().ok())
            .unwrap_or(d)
    };
    let (generations, population) = (arg(1, 25), arg(2, 20));
    let threads = arg(
        3,
        std::thread::available_parallelism().map_or(1, std::num::NonZeroUsize::get),
    );
    let cfg = Evolve {
        population,
        generations: u32::try_from(generations).unwrap(),
        elites: 2,
        tournament: 3,
        sigma: (0.15, 0.02),
        seeds: 3,
        threads,
        seed: 2026,
    };
    let start = genome(AntParams::DEFAULT);
    let history = evolve(&genes(), &cfg, Some(&start), |g, seeds| {
        mean_over(seeds, |s| training(params(g), s))
    });
    for (k, g) in history.iter().enumerate() {
        let genes: Vec<String> = g.best_genome.iter().map(|x| format!("{x:.5}")).collect();
        println!(
            "{{\"generation\": {k}, \"best\": {:.1}, \"mean\": {:.1}, \"genome\": [{}]}}",
            g.best,
            g.mean,
            genes.join(", ")
        );
    }
    let best = params(&history.last().unwrap().best_genome);
    println!("BEST {best:?}");
    let held: Vec<u64> = (1000..1008).collect();
    for (name, scene) in [
        ("training scene", training as fn(AntParams, u64) -> f64),
        ("barriers scene", barriers),
    ] {
        let score = |p: AntParams| held.iter().map(|&s| scene(p, s)).collect::<Vec<f64>>();
        let (d, e) = (score(AntParams::DEFAULT), score(best));
        let mean = |v: &[f64]| v.iter().sum::<f64>() / 8.0;
        println!(
            "HELD-OUT {name}: defaults {:.0} {d:?}; evolved {:.0} {e:?}",
            mean(&d),
            mean(&e)
        );
    }
}
