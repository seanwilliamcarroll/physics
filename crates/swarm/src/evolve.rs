//! [`evolve`]: a small evolutionary algorithm over a bounded real vector
//! (`docs/15-swarm.md`, "Evolving the ants"). Elites re-scored every
//! generation, tournament selection, uniform crossover, Gaussian mutation
//! shrinking over the run. Scoring runs on any number of threads; the
//! result is the same for all of them.

use math::SplitMix64;
use math::convert::{u64_to_f64, usize_to_f64};

/// One gene's range, inclusive.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Gene {
    pub min: f64,
    pub max: f64,
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
    /// The best fitness (NaN scores lose).
    pub best: f64,
    /// The mean of the finite fitnesses.
    pub mean: f64,
    /// The genome that scored `best`.
    pub best_genome: Vec<f64>,
}

/// Evolves genomes over `genes` to maximize `fitness(genome, seeds)`.
/// `start`, if given, is one of the first generation (clamped): a known
/// setting the run can't then do worse than on its own seeds. Returns
/// one record per generation. Empty for unusable settings.
pub fn evolve<F>(
    genes: &[Gene],
    settings: &Evolve,
    start: Option<&[f64]>,
    fitness: F,
) -> Vec<Generation>
where
    F: Fn(&[f64], &[u64]) -> f64 + Sync,
{
    let usable = !genes.is_empty()
        && genes
            .iter()
            .all(|gene| gene.min.is_finite() && gene.max.is_finite() && gene.min <= gene.max)
        && settings.population > settings.elites
        && settings.tournament >= 1
        && settings.seeds >= 1;
    if !usable {
        return Vec::new();
    }
    let mut rng = SplitMix64::new(settings.seed);
    let clamp_to_genes = |genome: &mut Vec<f64>| {
        for (value, gene) in genome.iter_mut().zip(genes) {
            *value = if value.is_finite() {
                value.clamp(gene.min, gene.max)
            } else {
                gene.min
            };
        }
    };
    let mut population: Vec<Vec<f64>> = (0..settings.population)
        .map(|_| {
            genes
                .iter()
                .map(|gene| rng.range(gene.min, gene.max.max(gene.min)))
                .collect()
        })
        .collect();
    if let (Some(start), Some(first)) = (start, population.first_mut()) {
        first.clone_from(
            &start
                .iter()
                .copied()
                .chain(core::iter::repeat(0.0))
                .take(genes.len())
                .collect(),
        );
        clamp_to_genes(first);
    }
    let mut history = Vec::new();
    for generation in 0..settings.generations {
        let seeds: Vec<u64> = (0..settings.seeds).map(|_| rng.next_u64()).collect();
        let scores = score(&population, &seeds, settings.threads.max(1), &fitness);
        // Best first; NaN last; ties by index (deterministic).
        let mut ranking: Vec<usize> = (0..population.len()).collect();
        let sort_key = |index: usize| {
            scores
                .get(index)
                .copied()
                .filter(|score| !score.is_nan())
                .unwrap_or(f64::NEG_INFINITY)
        };
        ranking.sort_by(|&first, &second| {
            sort_key(second)
                .total_cmp(&sort_key(first))
                .then(first.cmp(&second))
        });
        let best = ranking.first().copied().unwrap_or(0);
        let finite: Vec<f64> = scores
            .iter()
            .copied()
            .filter(|score| score.is_finite())
            .collect();
        history.push(Generation {
            best: sort_key(best),
            mean: finite.iter().sum::<f64>() / usize_to_f64(finite.len().max(1)),
            best_genome: population.get(best).cloned().unwrap_or_default(),
        });
        if generation + 1 == settings.generations {
            break;
        }
        // σ shrinks linearly from sigma.0 to sigma.1.
        let progress = if settings.generations > 1 {
            f64::from(generation) / f64::from(settings.generations - 1)
        } else {
            1.0
        };
        let sigma = settings.sigma.0 + (settings.sigma.1 - settings.sigma.0) * progress;
        let mut next: Vec<Vec<f64>> = ranking
            .iter()
            .take(settings.elites)
            .filter_map(|&index| population.get(index).cloned())
            .collect();
        while next.len() < settings.population {
            let first_index = tournament(&mut rng, &scores, settings.tournament);
            let second_index = tournament(&mut rng, &scores, settings.tournament);
            let (Some(first_parent), Some(second_parent)) =
                (population.get(first_index), population.get(second_index))
            else {
                break;
            };
            let mut child =
                crossover_and_mutate(&mut rng, first_parent, second_parent, genes, sigma);
            clamp_to_genes(&mut child);
            next.push(child);
        }
        population = next;
    }
    history
}

/// A child of two parents: each gene from one or the other (a coin flip
/// apiece), plus Gaussian mutation of σ times the gene's range. Not yet
/// clamped to the genes' ranges.
fn crossover_and_mutate(
    rng: &mut SplitMix64,
    first_parent: &[f64],
    second_parent: &[f64],
    genes: &[Gene],
    sigma: f64,
) -> Vec<f64> {
    first_parent
        .iter()
        .zip(second_parent)
        .zip(genes)
        .map(|((&from_first, &from_second), gene)| {
            let picked = if rng.next_u64() & 1 == 0 {
                from_first
            } else {
                from_second
            };
            picked + normal(rng) * sigma * (gene.max - gene.min)
        })
        .collect()
}

/// Every genome's fitness, split across `threads` by slot: the same
/// numbers in the same places whatever the count. Where a thread can't be
/// started (wasm32-wasip1 has none), that chunk is scored here instead:
/// same numbers, just not parallel.
fn score<F>(genomes: &[Vec<f64>], seeds: &[u64], threads: usize, fitness: &F) -> Vec<f64>
where
    F: Fn(&[f64], &[u64]) -> f64 + Sync,
{
    let score_chunk = |chunk: &[Vec<f64>]| {
        chunk
            .iter()
            .map(|genome| fitness(genome, seeds))
            .collect::<Vec<f64>>()
    };
    if threads <= 1 {
        return score_chunk(genomes);
    }
    let chunk_size = genomes.len().div_ceil(threads).max(1);
    std::thread::scope(|scope| {
        let chunks: Vec<_> = genomes
            .chunks(chunk_size)
            .map(|chunk| {
                (
                    chunk,
                    std::thread::Builder::new()
                        .spawn_scoped(scope, move || score_chunk(chunk))
                        .ok(),
                )
            })
            .collect();
        chunks
            .into_iter()
            .flat_map(|(chunk, handle)| {
                handle
                    .and_then(|handle| handle.join().ok())
                    .unwrap_or_else(|| score_chunk(chunk))
            })
            .collect()
    })
}

/// The index of the best of `size` drawn at random (NaN loses).
fn tournament(rng: &mut SplitMix64, scores: &[f64], size: usize) -> usize {
    let count = u64::try_from(scores.len()).unwrap_or(1).max(1);
    let mut best: Option<(usize, f64)> = None;
    for _ in 0..size {
        let index = usize::try_from(rng.next_u64() % count).unwrap_or(0);
        let score = scores
            .get(index)
            .copied()
            .filter(|score| !score.is_nan())
            .unwrap_or(f64::NEG_INFINITY);
        if best.is_none_or(|(_, best_score)| score > best_score) {
            best = Some((index, score));
        }
    }
    best.map_or(0, |(index, _)| index)
}

/// A standard normal deviate (Box–Muller; `libm`, so the same bits on
/// every platform).
fn normal(rng: &mut SplitMix64) -> f64 {
    // In (0, 1]: never log(0).
    let radius_uniform = 1.0 - rng.next_unit_f64();
    let angle_uniform = rng.next_unit_f64();
    libm::sqrt(-2.0 * libm::log(radius_uniform)) * libm::cos(core::f64::consts::TAU * angle_uniform)
}

/// The mean of `fitness` over `seeds` (a convenience for noisy fitness).
#[must_use]
pub fn mean_over(seeds: &[u64], fitness: impl Fn(u64) -> f64) -> f64 {
    seeds.iter().map(|&seed| fitness(seed)).sum::<f64>()
        / u64_to_f64(u64::try_from(seeds.len()).unwrap_or(1).max(1))
}

#[cfg(test)]
mod tests;
