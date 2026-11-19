use super::{Evolve, Gene, evolve, mean_over, normal};
use math::SplitMix64;

fn settings(threads: usize) -> Evolve {
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

/// A shifted quadratic in 4 dimensions, maximized at `peak`, with seeded
/// noise: the algorithm finds it.
fn noisy_quadratic(genome: &[f64], seeds: &[u64]) -> f64 {
    let peak = [0.3, -1.2, 2.0, 0.0];
    let distance_squared: f64 = genome
        .iter()
        .zip(peak)
        .map(|(value, peak)| (value - peak) * (value - peak))
        .sum();
    mean_over(seeds, |seed| {
        -distance_squared + 0.001 * (SplitMix64::new(seed).next_unit_f64() - 0.5)
    })
}

fn genes() -> Vec<Gene> {
    vec![
        Gene {
            min: -3.0,
            max: 3.0
        };
        4
    ]
}

#[test]
fn it_finds_the_maximum_of_a_noisy_quadratic() {
    let history = evolve(&genes(), &settings(1), None, noisy_quadratic);
    assert_eq!(history.len(), 40);
    let last = history.last().unwrap();
    let error: f64 = last
        .best_genome
        .iter()
        .zip([0.3, -1.2, 2.0, 0.0])
        .map(|(value, peak)| (value - peak).abs())
        .fold(0.0, f64::max);
    assert!(error < 0.1, "best {:?}, error {error}", last.best_genome);
    assert!(history.first().unwrap().best < last.best, "improved");
}

#[test]
fn the_result_is_the_same_on_any_number_of_threads() {
    let one_thread = evolve(&genes(), &settings(1), None, noisy_quadratic);
    for threads in [2, 3, 8] {
        assert_eq!(
            evolve(&genes(), &settings(threads), None, noisy_quadratic),
            one_thread,
            "{threads} threads"
        );
    }
}

#[test]
fn genes_stay_in_range_and_the_start_is_in_the_first_generation() {
    let narrow = vec![Gene { min: 0.0, max: 1.0 }, Gene { min: 5.0, max: 5.0 }];
    let ten_generations = Evolve {
        generations: 10,
        ..settings(1)
    };
    // Fitness pushes x up past its range: it must clamp at 1.
    let history = evolve(
        &narrow,
        &ten_generations,
        Some(&[0.5, 99.0]),
        |genome, _| genome[0],
    );
    for generation in &history {
        assert!(
            (0.0..=1.0).contains(&generation.best_genome[0])
                && (generation.best_genome[1] - 5.0).abs() < 1e-12,
            "{generation:?}"
        );
    }
    assert!((history.last().unwrap().best_genome[0] - 1.0).abs() < 1e-9);
    // The start alone, if it's the best of generation 0, is its record.
    let history = evolve(
        &narrow,
        &Evolve {
            generations: 1,
            ..ten_generations
        },
        Some(&[1.0, 5.0]),
        |genome, _| genome[0],
    );
    assert_eq!(history[0].best_genome, vec![1.0, 5.0]);
}

#[test]
fn unusable_settings_give_nothing() {
    let none: Vec<super::Generation> = Vec::new();
    assert_eq!(evolve(&[], &settings(1), None, noisy_quadratic), none);
    let too_many_elites = Evolve {
        population: 2,
        elites: 2,
        ..settings(1)
    };
    assert_eq!(
        evolve(&genes(), &too_many_elites, None, noisy_quadratic),
        none
    );
    assert_eq!(
        evolve(
            &[Gene { min: 1.0, max: 0.0 }],
            &settings(1),
            None,
            |_, _| 0.0
        ),
        none
    );
}

#[test]
fn a_nan_score_never_wins() {
    let history = evolve(
        &genes(),
        &Evolve {
            generations: 3,
            ..settings(1)
        },
        None,
        |genome, _| if genome[0] > 0.0 { f64::NAN } else { genome[0] },
    );
    assert!(
        history
            .iter()
            .all(|generation| generation.best.is_finite() && generation.best_genome[0] <= 0.0)
    );
}

#[test]
fn normal_deviates_have_mean_zero_and_variance_one() {
    let mut rng = SplitMix64::new(3);
    let count = 200_000;
    let deviates: Vec<f64> = (0..count).map(|_| normal(&mut rng)).collect();
    let mean = deviates.iter().sum::<f64>() / f64::from(count);
    let variance = deviates
        .iter()
        .map(|deviate| (deviate - mean) * (deviate - mean))
        .sum::<f64>()
        / f64::from(count);
    assert!(
        mean.abs() < 0.01 && (variance - 1.0).abs() < 0.02,
        "{mean} {variance}"
    );
}

use std::sync::Mutex;

/// Every genome scored, in order (one thread), `population` a generation.
fn scored(genes: &[Gene], settings: &Evolve) -> Vec<Vec<Vec<f64>>> {
    let seen = Mutex::new(Vec::new());
    let history = evolve(genes, settings, None, |genome, _| {
        seen.lock().unwrap().push(genome.to_vec());
        genome.iter().sum()
    });
    assert_eq!(history.len(), settings.generations as usize);
    let seen = seen.into_inner().unwrap();
    assert_eq!(
        seen.len(),
        settings.population * settings.generations as usize,
        "each generation is exactly the population"
    );
    seen.chunks(settings.population)
        .map(<[_]>::to_vec)
        .collect()
}

/// Whether gene `gene` of `child` is some member of `parents`' same gene.
fn inherited(child: &[f64], parents: &[Vec<f64>], gene: usize) -> bool {
    parents
        .iter()
        .any(|parent| parent[gene].to_bits() == child[gene].to_bits())
}

#[test]
fn the_mean_is_the_mean() {
    let four_individuals = Evolve {
        population: 4,
        generations: 2,
        ..settings(1)
    };
    let history = evolve(&genes(), &four_individuals, None, |_, _| 2.5);
    assert_eq!(history.len(), 2);
    for generation in history {
        assert_eq!((generation.best, generation.mean), (2.5, 2.5));
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
    let settings = Evolve {
        population: 12,
        generations: 3,
        elites: 0,
        sigma: (-0.1, 0.1),
        ..settings(1)
    };
    let generations = scored(&genes(), &settings);
    let (first, second, third) = (&generations[0], &generations[1], &generations[2]);
    let copies = |children: &[Vec<f64>], parents: &[Vec<f64>]| {
        children
            .iter()
            .flat_map(|child| (0..4).map(move |gene| (child, gene)))
            .filter(|&(child, gene)| inherited(child, parents, gene))
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
    let genes = vec![
        Gene {
            min: -3.0,
            max: 3.0
        };
        16
    ];
    let settings = Evolve {
        population: 12,
        generations: 2,
        elites: 0,
        sigma: (0.0, 0.0),
        ..settings(1)
    };
    let generations = scored(&genes, &settings);
    let (first, second) = (&generations[0], &generations[1]);
    for child in second {
        assert!(
            (0..16).all(|gene| inherited(child, first, gene)),
            "{child:?}"
        );
    }
    let whole = |child: &Vec<f64>| first.iter().any(|parent| parent == child);
    let mixed = second.iter().filter(|child| !whole(child)).count();
    // Measured: 10 of 12 (the others drew one parent twice).
    assert!(mixed >= 6, "{mixed} of 12 mixed");
}

/// The run itself is repeatable: selection, crossover and mutation draw
/// from one stream in a fixed order.
#[test]
fn a_run_is_repeatable() {
    let run = || {
        let six_generations = Evolve {
            generations: 6,
            ..settings(1)
        };
        let mut bits = Vec::new();
        for generation in evolve(&genes(), &six_generations, None, noisy_quadratic) {
            for value in [generation.best, generation.mean]
                .into_iter()
                .chain(generation.best_genome)
            {
                bits.push(value.to_bits());
            }
        }
        bits
    };
    assert_eq!(run(), run());
}
