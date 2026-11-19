//! Lava and steam (`docs/11-falling-sand.md`): the reaction, its
//! accounting, and the two materials' motion.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use sand::{Grid, Material};

/// The three quantities nothing but painting changes: sand; water + steam
/// (a reaction or condensation turns one into the other); lava + stone
/// (a reaction turns lava to stone; stone never turns back).
fn invariants(grid: &Grid) -> [usize; 3] {
    [
        grid.count(Material::Sand),
        grid.count(Material::Water) + grid.count(Material::Steam),
        grid.count(Material::Lava) + grid.count(Material::Stone),
    ]
}

fn random(width: usize, height: usize, seed: u64) -> Grid {
    let mut grid = Grid::new(width, height, seed).unwrap();
    let mut rng = SplitMix64::new(seed);
    for y in 0..height {
        for x in 0..width {
            let material = Material::ALL[(rng.next_u64() % 6) as usize];
            grid.set(x, y, material);
        }
    }
    grid
}

#[test]
fn reactions_and_condensation_keep_their_accounts() {
    for seed in [1, 2, 3] {
        let mut grid = random(70, 50, seed);
        let start = invariants(&grid);
        let mut reacted = false;
        for _ in 0..1500 {
            let lava_before = grid.count(Material::Lava);
            grid.step();
            reacted |= grid.count(Material::Lava) < lava_before;
            assert_eq!(
                invariants(&grid),
                start,
                "seed {seed} at step {}",
                grid.steps()
            );
        }
        assert!(reacted, "seed {seed}: the run should include reactions");
    }
}

#[test]
fn lava_on_water_makes_stone_and_steam() {
    // Lava above water in a one-wide column (the water can't flow away
    // first: the scan is bottom-up, so water moves before the lava above
    // it is reached): one step, and they're stone over steam.
    let mut grid = Grid::new(1, 3, 1).unwrap();
    grid.set(0, 1, Material::Lava);
    grid.set(0, 2, Material::Water);
    grid.step();
    assert_eq!(
        (grid.get(0, 1), grid.get(0, 2)),
        (Some(Material::Stone), Some(Material::Steam))
    );
}

#[test]
fn steam_bubbles_up_through_water_and_condenses() {
    let mut grid = Grid::new(1, 12, 4).unwrap();
    for y in 3..12 {
        grid.set(0, y, Material::Water);
    }
    grid.set(0, 11, Material::Steam);
    // It rises through the water, one cell a step...
    for _ in 0..9 {
        grid.step();
    }
    assert_eq!(
        grid.get(0, 2),
        Some(Material::Steam),
        "steam above the water"
    );
    // ...and, blocked at the top, condenses (1 in 64 a step: within 2000
    // steps all but certainly).
    for _ in 0..2000 {
        grid.step();
    }
    assert_eq!(
        (grid.count(Material::Steam), grid.count(Material::Water)),
        (0, 9)
    );
}

/// A 10 x 9 block released on a floor, spread after 60 steps: measured
/// water 112 cells wide, lava 44 (it flows one step in two, a cell
/// sideways at most). Lava under half water's.
#[test]
fn lava_flows_slower_than_water() {
    let spread = |material: Material| {
        let mut grid = Grid::new(200, 20, 1).unwrap();
        for x in 0..200 {
            grid.set(x, 19, Material::Stone);
        }
        for y in 10..19 {
            for x in 95..105 {
                grid.set(x, y, material);
            }
        }
        for _ in 0..60 {
            grid.step();
        }
        let occupied_columns: Vec<usize> = (0..200)
            .filter(|&x| (0..19).any(|y| grid.get(x, y) == Some(material)))
            .collect();
        occupied_columns.last().unwrap() - occupied_columns.first().unwrap() + 1
    };
    let (water, lava) = (spread(Material::Water), spread(Material::Lava));
    assert!(2 * lava < water, "water {water}, lava {lava}");
}
