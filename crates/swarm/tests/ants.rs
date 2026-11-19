//! The ants (`docs/15-swarm.md`, "Ant foraging"): exact food accounting,
//! the field accounting, walls, and foraging against a random walk and
//! against constant deposits, measured.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{AntParams, Colony, Pheromone};

fn scene(params: AntParams, seed: u64) -> Colony {
    let mut colony = Colony::new(200, 120, 500, (30.0, 60.0, 6.0), params, seed).unwrap();
    colony.paint_food(160.0, 60.0, 8.0, 50);
    colony
}

fn delivered(params: AntParams, sensing: bool, seed: u64) -> u64 {
    let mut colony = scene(params, seed);
    colony.set_sensing(sensing);
    for _ in 0..3000 {
        colony.step();
    }
    colony.delivered()
}

/// In the world + carried + delivered = painted, at every step, through
/// painting, walls over food, and erasing: integers, exactly.
#[test]
fn food_is_accounted_for_exactly() {
    let mut colony = scene(AntParams::DEFAULT, 1);
    let check = |colony: &Colony| {
        let held =
            i64::try_from(colony.food_in_world() + colony.carrying() + colony.delivered()).unwrap();
        assert_eq!(held, colony.painted(), "at step {}", colony.steps());
    };
    for step in 0..2000 {
        colony.step();
        check(&colony);
        match step {
            500 => assert!(colony.paint_food(100.0, 20.0, 5.0, 10) > 0),
            900 => assert!(
                colony.paint_wall(160.0, 60.0, 3.0) > 0,
                "a wall over the food"
            ),
            1300 => assert!(colony.erase(160.0, 60.0, 9.0) > 0),
            _ => {}
        }
        check(&colony);
    }
    assert!(colony.delivered() > 0);
}

/// Each step's deposits go in, then conserving diffusion, then decay:
/// `Σ(t+1) = (Σ(t) + deposits) · (1 − E)`. Measured worst relative
/// error over 2,000 steps, both fields: 3.5e-8. Bound 3.5e-7. Ants never
/// stand in a wall or leave the world.
#[test]
fn the_fields_keep_their_accounts_and_ants_keep_out_of_walls() {
    let mut colony = scene(AntParams::DEFAULT, 2);
    colony.paint_wall(100.0, 40.0, 6.0);
    colony.paint_wall(100.0, 80.0, 6.0);
    let keep = 1.0 - f64::from(AntParams::DEFAULT.decay);
    let mut worst = 0.0_f64;
    for _ in 0..2000 {
        let before = [
            colony.field(Pheromone::Home).total(),
            colony.field(Pheromone::Food).total(),
        ];
        colony.step();
        for (pheromone, total_before) in [Pheromone::Home, Pheromone::Food].into_iter().zip(before)
        {
            let expected = (total_before + colony.last_deposits(pheromone)) * keep;
            if expected > 0.0 {
                worst = worst.max((colony.field(pheromone).total() / expected - 1.0).abs());
            }
        }
        let (width, height) = colony.size();
        for ant in colony.ants() {
            let cell = |coordinate: f32| math::convert::f64_to_usize(f64::from(coordinate.floor()));
            let (Some(x), Some(y)) = (cell(ant.x), cell(ant.y)) else {
                panic!("an ant outside the world: {ant:?}");
            };
            assert!(x < width && y < height, "{ant:?}");
            assert!(colony.open()[y * width + x], "an ant in a wall: {ant:?}");
        }
    }
    assert!(worst < 3.5e-7, "field accounting off by {worst:e}");
}

/// Foraging over `seeds` (3,000 steps each): every default seed at
/// least 20× the best random walk (sensing off, same speed and turns) and
/// 2× the best constant-deposit run (no fall-off).
fn trails_beat_a_random_walk(seeds: core::ops::RangeInclusive<u64>) {
    let defaults = AntParams::DEFAULT;
    let constant = AntParams {
        falloff: 0.0,
        ..defaults
    };
    let with_trails: Vec<u64> = seeds
        .clone()
        .map(|seed| delivered(defaults, true, seed))
        .collect();
    let random_walk: Vec<u64> = seeds
        .clone()
        .map(|seed| delivered(defaults, false, seed))
        .collect();
    let constant_deposits: Vec<u64> = seeds.map(|seed| delivered(constant, true, seed)).collect();
    let (best_walk, best_constant) = (
        *random_walk.iter().max().unwrap(),
        *constant_deposits.iter().max().unwrap(),
    );
    for &foraging in &with_trails {
        assert!(
            foraging >= 20 * best_walk,
            "foraging {with_trails:?} vs random walk {random_walk:?}"
        );
        assert!(
            foraging >= 2 * best_constant,
            "foraging {with_trails:?} vs constant deposits {constant_deposits:?}"
        );
    }
}

/// Measured over seeds 1–4: the defaults deliver 1,312–1,959; a random
/// walk 12–21; constant deposits 7–255, no better than a random walk:
/// without the fall-off a trail has no direction. Every push runs seed 1
/// (its constant run is the strongest, 255: the hardest seed for the 2×
/// bound); all four in `cargo xtask slow` (one run is ~1 s optimized).
#[test]
fn trails_beat_a_random_walk_and_need_the_falloff() {
    trails_beat_a_random_walk(1..=1);
}

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_trails_beat_a_random_walk_on_every_seed() {
    trails_beat_a_random_walk(1..=4);
}
