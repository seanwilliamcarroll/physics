//! Determinism: the same run twice is identical, bit for bit, for every
//! model and neighbour search (`docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use swarm::{Arena, Flock, Neighbours, Params};

/// 200 boids, 300 steps, neighbours found `how`.
fn run_with(how: Neighbours) -> Vec<u8> {
    let mut f = Flock::new(200, Arena::new(640.0, 480.0).unwrap(), Params::ECE4760, 42).unwrap();
    f.set_neighbours(how);
    for _ in 0..300 {
        f.step();
    }
    f.state_bytes().collect::<Vec<u8>>()
}

#[test]
fn a_run_is_repeatable() {
    for how in [Neighbours::Brute, Neighbours::Grid, Neighbours::Sorted] {
        assert_eq!(run_with(how), run_with(how), "{how:?}");
    }
}

/// The Vicsek model: 400 particles at ρ = 4, η = 2, 300 steps.
fn run_vicsek(brute_force: bool) -> Vec<u8> {
    let mut v = swarm::Vicsek::new(400, 10.0, swarm::VicsekParams::paper(2.0), 42).unwrap();
    v.set_brute_force(brute_force);
    for _ in 0..300 {
        v.step();
    }
    v.state_bytes().collect::<Vec<u8>>()
}

#[test]
fn a_vicsek_run_is_repeatable() {
    assert_eq!(run_vicsek(true), run_vicsek(true), "brute force");
    assert_eq!(run_vicsek(false), run_vicsek(false), "grid");
}

/// Ant foraging: 300 ants, a food patch and a wall, 400 steps; ants and
/// both fields compared.
fn run_ants() -> Vec<u8> {
    let mut c = swarm::Colony::new(
        120,
        80,
        300,
        (20.0, 40.0, 5.0),
        swarm::AntParams::DEFAULT,
        42,
    )
    .unwrap();
    c.paint_food(95.0, 40.0, 6.0, 20);
    c.paint_wall(60.0, 30.0, 4.0);
    for _ in 0..400 {
        c.step();
    }
    c.state_bytes()
}

#[test]
fn an_ants_run_is_repeatable() {
    assert_eq!(run_ants(), run_ants());
}

/// Physarum: 3,000 agents and a node on a 96² field, 300 steps.
fn run_slime() -> Vec<u8> {
    let mut s = swarm::Slime::new(96, 3000, swarm::SlimeParams::DEFAULT, 42).unwrap();
    s.add_node(20, 20, 4.0);
    for _ in 0..300 {
        s.step();
    }
    s.state_bytes()
}

#[test]
fn a_slime_run_is_repeatable() {
    assert_eq!(run_slime(), run_slime());
}
