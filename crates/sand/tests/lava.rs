//! Lava and steam (M9 section 4, `docs/11-falling-sand.md`): the reaction,
//! its accounting, and the two materials' motion.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use math::SplitMix64;
use sand::{Grid, Material};

fn count(g: &Grid, m: Material) -> usize {
    g.count(m)
}

/// The three quantities nothing but painting changes: sand; water + steam
/// (a reaction or condensation turns one into the other); lava + stone
/// (a reaction turns lava to stone; stone never turns back).
fn invariants(g: &Grid) -> [usize; 3] {
    [
        count(g, Material::Sand),
        count(g, Material::Water) + count(g, Material::Steam),
        count(g, Material::Lava) + count(g, Material::Stone),
    ]
}

/// A random grid of every material.
fn random(w: usize, h: usize, seed: u64) -> Grid {
    let mut g = Grid::new(w, h, seed).unwrap();
    let mut rng = SplitMix64::new(seed);
    for y in 0..h {
        for x in 0..w {
            let m = Material::ALL[(rng.next_u64() % 6) as usize];
            g.set(x, y, m);
        }
    }
    g
}

#[test]
fn reactions_and_condensation_keep_their_accounts() {
    for seed in [1, 2, 3] {
        let mut g = random(70, 50, seed);
        let start = invariants(&g);
        let mut reacted = false;
        for _ in 0..1500 {
            let lava = count(&g, Material::Lava);
            g.step();
            reacted |= count(&g, Material::Lava) < lava;
            assert_eq!(invariants(&g), start, "seed {seed} at step {}", g.steps());
        }
        assert!(reacted, "seed {seed}: the run should include reactions");
    }
}

#[test]
fn lava_on_water_makes_stone_and_steam() {
    // Lava above water in a one-wide column (the water can't flow away
    // first: the scan is bottom-up, so water moves before the lava above
    // it is reached): one step, and they're stone over steam.
    let mut g = Grid::new(1, 3, 1).unwrap();
    g.set(0, 1, Material::Lava);
    g.set(0, 2, Material::Water);
    g.step();
    assert_eq!(
        (g.get(0, 1), g.get(0, 2)),
        (Some(Material::Stone), Some(Material::Steam))
    );
}

#[test]
fn steam_bubbles_up_through_water_and_condenses() {
    let mut g = Grid::new(1, 12, 4).unwrap();
    for y in 3..12 {
        g.set(0, y, Material::Water);
    }
    g.set(0, 11, Material::Steam);
    // It rises through the water, one cell a step...
    for _ in 0..9 {
        g.step();
    }
    assert_eq!(g.get(0, 2), Some(Material::Steam), "steam above the water");
    // ...and, blocked at the top, condenses (1 in 64 a step: within 2000
    // steps all but certainly).
    for _ in 0..2000 {
        g.step();
    }
    assert_eq!((g.count(Material::Steam), g.count(Material::Water)), (0, 9));
}

/// A 10 x 9 block released on a floor, spread after 60 steps: measured
/// water 112 cells wide, lava 44 (it flows one step in two, a cell
/// sideways at most). Lava under half water's.
#[test]
fn lava_flows_slower_than_water() {
    let spread = |m: Material| {
        let mut g = Grid::new(200, 20, 1).unwrap();
        for x in 0..200 {
            g.set(x, 19, Material::Stone);
        }
        for y in 10..19 {
            for x in 95..105 {
                g.set(x, y, m);
            }
        }
        for _ in 0..60 {
            g.step();
        }
        let xs: Vec<usize> = (0..200)
            .filter(|&x| (0..19).any(|y| g.get(x, y) == Some(m)))
            .collect();
        xs.last().unwrap() - xs.first().unwrap() + 1
    };
    let (water, lava) = (spread(Material::Water), spread(Material::Lava));
    assert!(2 * lava < water, "water {water}, lava {lava}");
}
