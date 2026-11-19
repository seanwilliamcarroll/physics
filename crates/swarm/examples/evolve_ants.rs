//! Evolves the ant constants (`docs/15-swarm.md`, "Evolving the ants"):
//! the fitness is food delivered in the foraging scene (3,000 steps), the
//! mean over the generation's common seeds; the run starts from the
//! hand-scanned defaults. Then the best against the defaults on held-out
//! seeds, in the training scene and in the barriers scene it never saw.
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

const DEGREES: f64 = core::f64::consts::PI / 180.0;

/// The seven genes: SA, SD, RA, wiggle, fall-off, diffusion, decay.
fn genes() -> Vec<Gene> {
    let range = |min: f64, max: f64| Gene { min, max };
    vec![
        range(0.0, 90.0 * DEGREES),
        range(1.0, 30.0),
        range(0.0, 90.0 * DEGREES),
        range(0.0, 90.0 * DEGREES),
        range(0.0, 0.2),
        range(0.0, 0.5),
        range(0.0, 0.05),
    ]
}

#[expect(clippy::cast_possible_truncation, reason = "genes within f32's range")]
fn params(genome: &[f64]) -> AntParams {
    let gene = |index: usize| genome.get(index).copied().unwrap_or(0.0) as f32;
    AntParams {
        sensor_angle: gene(0),
        sensor_distance: gene(1),
        turn: gene(2),
        wiggle: gene(3),
        falloff: gene(4),
        diffusion: gene(5),
        decay: gene(6),
        ..AntParams::DEFAULT
    }
}

fn genome(params: AntParams) -> Vec<f64> {
    [
        params.sensor_angle,
        params.sensor_distance,
        params.turn,
        params.wiggle,
        params.falloff,
        params.diffusion,
        params.decay,
    ]
    .map(f64::from)
    .to_vec()
}

/// The training scene: 200 × 120, the nest left, food 130 cells away.
fn training(params: AntParams, seed: u64) -> f64 {
    let mut colony = Colony::new(200, 120, 500, (30.0, 60.0, 6.0), params, seed).unwrap();
    colony.paint_food(160.0, 60.0, 8.0, 50);
    run(colony)
}

/// The barriers scene (`site/js/ant-scenes.ts`): walls between nest and food.
fn barriers(params: AntParams, seed: u64) -> f64 {
    let (width, height) = (200.0_f32, 120.0_f32);
    let mut colony = Colony::new(
        200,
        120,
        500,
        (width * 0.12, height / 2.0, 5.0),
        params,
        seed,
    )
    .unwrap();
    for (x, first_y, last_y) in [
        (width * 0.35, 0.0, height * 0.65),
        (width * 0.55, height * 0.35, height),
    ] {
        let mut y = first_y;
        while y <= last_y {
            colony.paint_wall(x, y, 2.0);
            y += 1.0;
        }
    }
    colony.paint_food(width * 0.75, height / 2.0, 8.0, 100);
    run(colony)
}

/// Food delivered after 3,000 steps.
fn run(mut colony: Colony) -> f64 {
    for _ in 0..3000 {
        colony.step();
    }
    math::convert::u64_to_f64(colony.delivered())
}

fn main() {
    let argument = |position: usize, default: usize| {
        std::env::args()
            .nth(position)
            .and_then(|text| text.parse().ok())
            .unwrap_or(default)
    };
    let (generations, population) = (argument(1, 25), argument(2, 20));
    let threads = argument(
        3,
        std::thread::available_parallelism().map_or(1, std::num::NonZeroUsize::get),
    );
    let settings = Evolve {
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
    let history = evolve(&genes(), &settings, Some(&start), |genome, seeds| {
        mean_over(seeds, |seed| training(params(genome), seed))
    });
    for (generation_number, generation) in history.iter().enumerate() {
        let genome_text: Vec<String> = generation
            .best_genome
            .iter()
            .map(|value| format!("{value:.5}"))
            .collect();
        println!(
            "{{\"generation\": {generation_number}, \"best\": {:.1}, \"mean\": {:.1}, \"genome\": [{}]}}",
            generation.best,
            generation.mean,
            genome_text.join(", ")
        );
    }
    let best = params(&history.last().unwrap().best_genome);
    println!("BEST {best:?}");
    let held_out_seeds: Vec<u64> = (1000..1008).collect();
    for (name, scene) in [
        ("training scene", training as fn(AntParams, u64) -> f64),
        ("barriers scene", barriers),
    ] {
        let score = |params: AntParams| {
            held_out_seeds
                .iter()
                .map(|&seed| scene(params, seed))
                .collect::<Vec<f64>>()
        };
        let (defaults, evolved) = (score(AntParams::DEFAULT), score(best));
        let mean = |scores: &[f64]| scores.iter().sum::<f64>() / 8.0;
        println!(
            "HELD-OUT {name}: defaults {:.0} {defaults:?}; evolved {:.0} {evolved:?}",
            mean(&defaults),
            mean(&evolved)
        );
    }
}
