//! S3's ants (`docs/15-swarm.md`, S3): exact food accounting, the field
//! accounting, walls, and foraging against a random walk and against
//! constant deposits, measured.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{AntParams, Colony, Pheromone};

/// The foraging scene: 200 × 120 cells, the nest at the left, a food
/// patch 130 cells away, 500 ants.
fn scene(p: AntParams, seed: u64) -> Colony {
    let mut c = Colony::new(200, 120, 500, (30.0, 60.0, 6.0), p, seed).unwrap();
    c.paint_food(160.0, 60.0, 8.0, 50);
    c
}

fn delivered(p: AntParams, sensing: bool, seed: u64) -> u64 {
    let mut c = scene(p, seed);
    c.set_sensing(sensing);
    for _ in 0..3000 {
        c.step();
    }
    c.delivered()
}

/// In the world + carried + delivered = painted, at every step, through
/// painting, walls over food, and erasing: integers, exactly.
#[test]
fn food_is_accounted_for_exactly() {
    let mut c = scene(AntParams::DEFAULT, 1);
    let check = |c: &Colony| {
        let held = i64::try_from(c.food_in_world() + c.carrying() + c.delivered()).unwrap();
        assert_eq!(held, c.painted(), "at step {}", c.steps());
    };
    for k in 0..2000 {
        c.step();
        check(&c);
        match k {
            500 => assert!(c.paint_food(100.0, 20.0, 5.0, 10) > 0),
            900 => assert!(c.paint_wall(160.0, 60.0, 3.0) > 0, "a wall over the food"),
            1300 => assert!(c.erase(160.0, 60.0, 9.0) > 0),
            _ => {}
        }
        check(&c);
    }
    assert!(c.delivered() > 0);
}

/// Each step's deposits go in, then conserving diffusion, then decay:
/// `Σ(t+1) = (Σ(t) + deposits) · (1 − E)`. Measured worst relative
/// error over 2,000 steps, both fields: 3.5e-8. Bound 3.5e-7. Ants never
/// stand in a wall or leave the world.
#[test]
fn the_fields_keep_their_accounts_and_ants_keep_out_of_walls() {
    let mut c = scene(AntParams::DEFAULT, 2);
    c.paint_wall(100.0, 40.0, 6.0);
    c.paint_wall(100.0, 80.0, 6.0);
    let keep = 1.0 - f64::from(AntParams::DEFAULT.decay);
    let mut worst = 0.0_f64;
    for _ in 0..2000 {
        let before = [
            c.field(Pheromone::Home).total(),
            c.field(Pheromone::Food).total(),
        ];
        c.step();
        for (which, b) in [Pheromone::Home, Pheromone::Food].into_iter().zip(before) {
            let expected = (b + c.last_deposits(which)) * keep;
            if expected > 0.0 {
                worst = worst.max((c.field(which).total() / expected - 1.0).abs());
            }
        }
        let (w, h) = c.size();
        for a in c.ants() {
            let cell = |v: f32| math::convert::f64_to_usize(f64::from(v.floor()));
            let (Some(x), Some(y)) = (cell(a.x), cell(a.y)) else {
                panic!("an ant outside the world: {a:?}");
            };
            assert!(x < w && y < h, "{a:?}");
            assert!(c.open()[y * w + x], "an ant in a wall: {a:?}");
        }
    }
    assert!(worst < 3.5e-7, "field accounting off by {worst:e}");
}

/// Foraging, measured over four seeds (3,000 steps): the defaults deliver
/// 1,312–1,959; ants with sensing off (a random walk, same speed and
/// turns) 12–21; constant deposits (no fall-off) 7–255, no better than a
/// random walk: without the fall-off a trail has no direction. Bounds:
/// every default seed at least 20× the best random walk and 2× the best
/// constant run.
#[test]
fn trails_beat_a_random_walk_and_need_the_falloff() {
    let d = AntParams::DEFAULT;
    let constant = AntParams { falloff: 0.0, ..d };
    let seeds = 1..=4;
    let with: Vec<u64> = seeds.clone().map(|s| delivered(d, true, s)).collect();
    let walk: Vec<u64> = seeds.clone().map(|s| delivered(d, false, s)).collect();
    let flat: Vec<u64> = seeds.map(|s| delivered(constant, true, s)).collect();
    let (best_walk, best_flat) = (*walk.iter().max().unwrap(), *flat.iter().max().unwrap());
    for &w in &with {
        assert!(
            w >= 20 * best_walk,
            "foraging {with:?} vs random walk {walk:?}"
        );
        assert!(
            w >= 2 * best_flat,
            "foraging {with:?} vs constant deposits {flat:?}"
        );
    }
}
