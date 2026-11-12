//! [`evolve`]: a small evolutionary algorithm over a bounded real vector
//! (`docs/15-swarm.md`, S5). Elites re-scored every generation,
//! tournament selection, uniform crossover, Gaussian mutation shrinking
//! over the run. Scoring runs on any number of threads; the result is the
//! same for all of them.

use math::SplitMix64;
use math::convert::{u64_to_f64, usize_to_f64};

/// One gene's range.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Gene {
    pub lo: f64,
    pub hi: f64,
}

/// The run's settings.
#[derive(Clone, Debug, PartialEq)]
pub struct Evolve {
    /// Individuals a generation (at least `elites + 1`).
    pub population: usize,
    pub generations: u32,
    /// The best kept unchanged each generation (and re-scored).
    pub elites: usize,
    /// Tournament size.
    pub tournament: usize,
    /// Mutation σ as a fraction of each gene's range: at the start and
    /// at the end (linear between).
    pub sigma: (f64, f64),
    /// Seeds per score: each individual's fitness gets the generation's
    /// common seeds.
    pub seeds: usize,
    /// Threads scoring the population (1: on this thread).
    pub threads: usize,
    /// The run's seed: initial genomes, selection, mutation, the
    /// generations' common seeds.
    pub seed: u64,
}

/// One generation's record.
#[derive(Clone, Debug, PartialEq)]
pub struct Generation {
    pub best: f64,
    pub mean: f64,
    pub best_genome: Vec<f64>,
}

/// Evolves genomes over `genes` to maximize `fitness(genome, seeds)`.
/// `start`, if given, is one of the first generation (clamped): a known
/// setting the run can't then do worse than on its own seeds. Returns
/// one record per generation. Empty for unusable settings.
pub fn evolve<F>(genes: &[Gene], cfg: &Evolve, start: Option<&[f64]>, fitness: F) -> Vec<Generation>
where
    F: Fn(&[f64], &[u64]) -> f64 + Sync,
{
    let usable = !genes.is_empty()
        && genes
            .iter()
            .all(|g| g.lo.is_finite() && g.hi.is_finite() && g.lo <= g.hi)
        && cfg.population > cfg.elites
        && cfg.tournament >= 1
        && cfg.seeds >= 1;
    if !usable {
        return Vec::new();
    }
    let mut rng = SplitMix64::new(cfg.seed);
    let clamp = |v: &mut Vec<f64>| {
        for (x, g) in v.iter_mut().zip(genes) {
            *x = if x.is_finite() {
                x.clamp(g.lo, g.hi)
            } else {
                g.lo
            };
        }
    };
    let mut pop: Vec<Vec<f64>> = (0..cfg.population)
        .map(|_| {
            genes
                .iter()
                .map(|g| rng.range(g.lo, g.hi.max(g.lo)))
                .collect()
        })
        .collect();
    if let (Some(s), Some(first)) = (start, pop.first_mut()) {
        first.clone_from(
            &s.iter()
                .copied()
                .chain(core::iter::repeat(0.0))
                .take(genes.len())
                .collect(),
        );
        clamp(first);
    }
    let mut history = Vec::new();
    for generation in 0..cfg.generations {
        let seeds: Vec<u64> = (0..cfg.seeds).map(|_| rng.next_u64()).collect();
        let scores = score(&pop, &seeds, cfg.threads.max(1), &fitness);
        // Best first; NaN last; ties by index (deterministic).
        let mut order: Vec<usize> = (0..pop.len()).collect();
        let key = |i: usize| {
            scores
                .get(i)
                .copied()
                .filter(|s| !s.is_nan())
                .unwrap_or(f64::NEG_INFINITY)
        };
        order.sort_by(|&a, &b| key(b).total_cmp(&key(a)).then(a.cmp(&b)));
        let best = order.first().copied().unwrap_or(0);
        let finite: Vec<f64> = scores.iter().copied().filter(|s| s.is_finite()).collect();
        history.push(Generation {
            best: key(best),
            mean: finite.iter().sum::<f64>() / usize_to_f64(finite.len().max(1)),
            best_genome: pop.get(best).cloned().unwrap_or_default(),
        });
        if generation + 1 == cfg.generations {
            break;
        }
        // σ shrinks linearly from sigma.0 to sigma.1.
        let t = if cfg.generations > 1 {
            f64::from(generation) / f64::from(cfg.generations - 1)
        } else {
            1.0
        };
        let sigma = cfg.sigma.0 + (cfg.sigma.1 - cfg.sigma.0) * t;
        let mut next: Vec<Vec<f64>> = order
            .iter()
            .take(cfg.elites)
            .filter_map(|&i| pop.get(i).cloned())
            .collect();
        while next.len() < cfg.population {
            let a = tournament(&mut rng, &scores, cfg.tournament);
            let b = tournament(&mut rng, &scores, cfg.tournament);
            let (Some(pa), Some(pb)) = (pop.get(a), pop.get(b)) else {
                break;
            };
            let mut child: Vec<f64> = pa
                .iter()
                .zip(pb)
                .zip(genes)
                .map(|((&x, &y), g)| {
                    let pick = if rng.next_u64() & 1 == 0 { x } else { y };
                    pick + normal(&mut rng) * sigma * (g.hi - g.lo)
                })
                .collect();
            clamp(&mut child);
            next.push(child);
        }
        pop = next;
    }
    history
}

/// Every genome's fitness, split across `threads` by slot: the same
/// numbers in the same places whatever the count.
fn score<F>(pop: &[Vec<f64>], seeds: &[u64], threads: usize, fitness: &F) -> Vec<f64>
where
    F: Fn(&[f64], &[u64]) -> f64 + Sync,
{
    if threads <= 1 {
        return pop.iter().map(|g| fitness(g, seeds)).collect();
    }
    let chunk = pop.len().div_ceil(threads).max(1);
    std::thread::scope(|s| {
        let handles: Vec<_> = pop
            .chunks(chunk)
            .map(|part| {
                s.spawn(move || part.iter().map(|g| fitness(g, seeds)).collect::<Vec<f64>>())
            })
            .collect();
        handles
            .into_iter()
            .flat_map(|h| h.join().unwrap_or_default())
            .collect()
    })
}

/// The index of the best of `k` drawn at random (NaN loses).
fn tournament(rng: &mut SplitMix64, scores: &[f64], k: usize) -> usize {
    let n = u64::try_from(scores.len()).unwrap_or(1).max(1);
    let mut best: Option<(usize, f64)> = None;
    for _ in 0..k {
        let i = usize::try_from(rng.next_u64() % n).unwrap_or(0);
        let s = scores
            .get(i)
            .copied()
            .filter(|s| !s.is_nan())
            .unwrap_or(f64::NEG_INFINITY);
        if best.is_none_or(|(_, b)| s > b) {
            best = Some((i, s));
        }
    }
    best.map_or(0, |(i, _)| i)
}

/// A standard normal deviate (Box–Muller; `libm`, so the same bits on
/// every platform).
fn normal(rng: &mut SplitMix64) -> f64 {
    // u in (0, 1]: never log(0).
    let u = 1.0 - rng.next_unit_f64();
    let v = rng.next_unit_f64();
    libm::sqrt(-2.0 * libm::log(u)) * libm::cos(core::f64::consts::TAU * v)
}

/// The mean of `f` over `seeds` (a convenience for noisy fitness).
#[must_use]
pub fn mean_over(seeds: &[u64], f: impl Fn(u64) -> f64) -> f64 {
    seeds.iter().map(|&s| f(s)).sum::<f64>()
        / u64_to_f64(u64::try_from(seeds.len()).unwrap_or(1).max(1))
}

#[cfg(test)]
mod tests;
