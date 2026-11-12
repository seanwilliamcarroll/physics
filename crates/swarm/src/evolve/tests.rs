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
