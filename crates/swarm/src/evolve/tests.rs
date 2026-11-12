use super::{Evolve, Gene, evolve, mean_over, normal};
use math::SplitMix64;

fn cfg(threads: usize) -> Evolve {
    Evolve {
        population: 24,
        generations: 40,
        elites: 2,
        tournament: 3,
        sigma: (0.2, 0.02),
        seeds: 2,
        threads,
        seed: 7,
    }
}

/// A shifted quadratic in 4 dimensions, maximized at `c`, with seeded
/// noise: the algorithm finds it.
fn toy(g: &[f64], seeds: &[u64]) -> f64 {
    let c = [0.3, -1.2, 2.0, 0.0];
    let d: f64 = g.iter().zip(c).map(|(x, c)| (x - c) * (x - c)).sum();
    mean_over(seeds, |s| {
        -d + 0.001 * (SplitMix64::new(s).next_unit_f64() - 0.5)
    })
}

fn genes() -> Vec<Gene> {
    vec![Gene { lo: -3.0, hi: 3.0 }; 4]
}

#[test]
fn it_finds_the_maximum_of_a_noisy_quadratic() {
    let h = evolve(&genes(), &cfg(1), None, toy);
    assert_eq!(h.len(), 40);
    let last = h.last().unwrap();
    let err: f64 = last
        .best_genome
        .iter()
        .zip([0.3, -1.2, 2.0, 0.0])
        .map(|(x, c)| (x - c).abs())
        .fold(0.0, f64::max);
    assert!(err < 0.1, "best {:?}, err {err}", last.best_genome);
    assert!(h.first().unwrap().best < last.best, "improved");
}

#[test]
fn the_result_is_the_same_on_any_number_of_threads() {
    let one = evolve(&genes(), &cfg(1), None, toy);
    for t in [2, 3, 8] {
        assert_eq!(evolve(&genes(), &cfg(t), None, toy), one, "{t} threads");
    }
}

#[test]
fn genes_stay_in_range_and_the_start_is_in_the_first_generation() {
    let narrow = vec![Gene { lo: 0.0, hi: 1.0 }, Gene { lo: 5.0, hi: 5.0 }];
    let c = Evolve {
        generations: 10,
        ..cfg(1)
    };
    // Fitness pushes x up past its range: it must clamp at 1.
    let h = evolve(&narrow, &c, Some(&[0.5, 99.0]), |g, _| g[0]);
    for g in &h {
        assert!(
            (0.0..=1.0).contains(&g.best_genome[0]) && (g.best_genome[1] - 5.0).abs() < 1e-12,
            "{g:?}"
        );
    }
    assert!((h.last().unwrap().best_genome[0] - 1.0).abs() < 1e-9);
    // The start alone, if it's the best of generation 0, is its record.
    let h = evolve(
        &narrow,
        &Evolve {
            generations: 1,
            ..c
        },
        Some(&[1.0, 5.0]),
        |g, _| g[0],
    );
    assert_eq!(h[0].best_genome, vec![1.0, 5.0]);
}

#[test]
fn unusable_settings_give_nothing() {
    let none: Vec<super::Generation> = Vec::new();
    assert_eq!(evolve(&[], &cfg(1), None, toy), none);
    let too_many_elites = Evolve {
        population: 2,
        elites: 2,
        ..cfg(1)
    };
    assert_eq!(evolve(&genes(), &too_many_elites, None, toy), none);
    assert_eq!(
        evolve(&[Gene { lo: 1.0, hi: 0.0 }], &cfg(1), None, |_, _| 0.0),
        none
    );
}

#[test]
fn a_nan_score_never_wins() {
    let h = evolve(
        &genes(),
        &Evolve {
            generations: 3,
            ..cfg(1)
        },
        None,
        |g, _| if g[0] > 0.0 { f64::NAN } else { g[0] },
    );
    assert!(
        h.iter()
            .all(|g| g.best.is_finite() && g.best_genome[0] <= 0.0)
    );
}

#[test]
fn normal_deviates_have_mean_zero_and_variance_one() {
    let mut rng = SplitMix64::new(3);
    let n = 200_000;
    let xs: Vec<f64> = (0..n).map(|_| normal(&mut rng)).collect();
    let mean = xs.iter().sum::<f64>() / f64::from(n);
    let var = xs.iter().map(|x| (x - mean) * (x - mean)).sum::<f64>() / f64::from(n);
    assert!(
        mean.abs() < 0.01 && (var - 1.0).abs() < 0.02,
        "{mean} {var}"
    );
}

// The tests below close gaps a mutation run found (4b299dd).

use std::sync::Mutex;

/// Every genome scored, in order (one thread), `population` a generation.
fn scored(genes: &[Gene], cfg: &Evolve) -> Vec<Vec<Vec<f64>>> {
    let seen = Mutex::new(Vec::new());
    let history = evolve(genes, cfg, None, |g, _| {
        seen.lock().unwrap().push(g.to_vec());
        g.iter().sum()
    });
    assert_eq!(history.len(), cfg.generations as usize);
    let seen = seen.into_inner().unwrap();
    assert_eq!(
        seen.len(),
        cfg.population * cfg.generations as usize,
        "each generation is exactly the population"
    );
    seen.chunks(cfg.population).map(<[_]>::to_vec).collect()
}

/// Whether gene `k` of `child` is some member of `parents`' gene `k`.
fn inherited(child: &[f64], parents: &[Vec<f64>], k: usize) -> bool {
    parents.iter().any(|p| p[k].to_bits() == child[k].to_bits())
}

#[test]
fn the_mean_is_the_mean() {
    let cfg = Evolve {
        population: 4,
        generations: 2,
        ..cfg(1)
    };
    let history = evolve(&genes(), &cfg, None, |_, _| 2.5);
    assert_eq!(history.len(), 2);
    for g in history {
        assert_eq!((g.best, g.mean), (2.5, 2.5));
    }
    assert_eq!(mean_over(&[1, 2, 3], math::convert::u64_to_f64), 2.0);
}

/// σ runs linearly from `sigma.0` at the first breeding to `sigma.1` at a
/// breeding after the last generation (never reached). From −x to x over
/// three generations it passes through exactly 0 at the second breeding:
/// the third generation's genes are unmutated copies of the second's,
/// where the second's own were mutated.
#[test]
fn sigma_runs_linearly_between_its_ends() {
    let cfg = Evolve {
        population: 12,
        generations: 3,
        elites: 0,
        sigma: (-0.1, 0.1),
        ..cfg(1)
    };
    let gens = scored(&genes(), &cfg);
    let (first, second, third) = (&gens[0], &gens[1], &gens[2]);
    let copies = |children: &[Vec<f64>], parents: &[Vec<f64>]| {
        children
            .iter()
            .flat_map(|c| (0..4).map(move |k| (c, k)))
            .filter(|&(c, k)| inherited(c, parents, k))
            .count()
    };
    assert_eq!(copies(third, second), 12 * 4, "σ = 0: every gene a copy");
    assert_eq!(copies(second, first), 0, "σ = −0.1: every gene mutated");
}

/// Crossover takes each gene from either parent: with no mutation, every
/// child gene is a first-generation gene, and some child mixes two
/// genomes (it equals no single one).
#[test]
fn crossover_mixes_two_parents_gene_by_gene() {
    let genes = vec![Gene { lo: -3.0, hi: 3.0 }; 16];
    let cfg = Evolve {
        population: 12,
        generations: 2,
        elites: 0,
        sigma: (0.0, 0.0),
        ..cfg(1)
    };
    let gens = scored(&genes, &cfg);
    let (first, second) = (&gens[0], &gens[1]);
    for c in second {
        assert!((0..16).all(|k| inherited(c, first, k)), "{c:?}");
    }
    let whole = |c: &Vec<f64>| first.iter().any(|p| p == c);
    let mixed = second.iter().filter(|c| !whole(c)).count();
    // Measured: 10 of 12 (the others drew one parent twice).
    assert!(mixed >= 6, "{mixed} of 12 mixed");
}

/// The run itself, pinned: selection, crossover and mutation draw from one
/// stream in a fixed order, and `libm` makes the deviates the same bits
/// everywhere (this runs as wasm too).
const GOLDEN_EVOLVE: u64 = 0x113b_67ac_6bd5_a405;

#[test]
fn the_golden_hash_is_unchanged() {
    let cfg = Evolve {
        generations: 6,
        ..cfg(1)
    };
    let mut h = math::Fnv1a::new();
    for g in evolve(&genes(), &cfg, None, toy) {
        for v in [g.best, g.mean].into_iter().chain(g.best_genome) {
            h.write(&v.to_bits().to_le_bytes());
        }
    }
    let h = h.finish();
    assert_eq!(
        h, GOLDEN_EVOLVE,
        "if intended, set GOLDEN_EVOLVE = {h:#018x}"
    );
}
