//! Barnes–Hut against direct summation: accuracy vs θ and momentum drift
//! (`docs/barnes-hut.md`, where the measurements are recorded). Cost is
//! the criterion bench (`benches/step.rs`, group `barnes_hut_*`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::momentum;
use engine::scenarios::{cluster, cluster_gravity};
use engine::{Particles, Scalar, Vec2};
use test_support::{
    Tol, accelerations, cluster_barnes_hut, cluster_barnes_hut_force, for_each_scalar,
    momentum_drift_bound, momentum_scale, time_step,
};

const DT: f64 = 1.0 / 60.0;

/// Opening angles probed, and the bound on each one's force error:
/// `max |a_tree − a_direct| / RMS |a_direct|` over a cluster's bodies.
///
/// Normalized by the RMS acceleration, not by each body's own: a body
/// near the cluster's center has a small net |a| (pulls cancel), so its
/// *relative* error is large while its absolute error is typical. Worst
/// per-body relative errors measured: 0.57 at θ = 0.3, 5.1 at θ = 1
/// (n = 1024); medians 0.4% and 5.8% (`docs/barnes-hut.md`).
///
/// Measured with the `δ` opening test, worst over n ∈ {64, 256, 1024},
/// seeds 1–3, f32 and f64 (equal to 3 digits): 0.0101, 0.0506, 0.104,
/// 0.180 (the classic test: 0.0127, 0.0487, 0.198, 0.302). Bounds 10–20x
/// above. An independent Python Barnes–Hut agreed with the classic test's
/// to 1.7e-15 of RMS |a| (θ = 0.5), so these are the method's errors.
const THETA_BOUNDS: [(f64, f64); 4] = [(0.3, 0.13), (0.5, 0.5), (0.8, 2.0), (1.0, 3.0)];

/// Cluster sizes for the accuracy test: past the crossover (~200–256 bodies
/// at θ = 0.5), and deep enough for trees of several levels.
const SIZES: [usize; 3] = [64, 256, 1024];
const SEEDS: [u64; 3] = [1, 2, 3];

fn force_error<S: Scalar>(particles: &Particles<S>, theta: f64) -> f64 {
    let exact = accelerations(particles, &cluster_gravity::<S>().unwrap());
    let tree = accelerations(particles, &cluster_barnes_hut_force::<S>(theta));
    let mean_square = exact
        .iter()
        .map(|acceleration| acceleration.length_sq().to_f64())
        .sum::<f64>()
        / f64::from(len_u32(&exact));
    let worst = tree
        .iter()
        .zip(&exact)
        .map(|(&approximate, &direct)| (approximate - direct).length().to_f64())
        .fold(0.0, f64::max);
    worst / mean_square.sqrt()
}

fn len_u32<T>(slice: &[T]) -> u32 {
    u32::try_from(slice.len()).unwrap()
}

fn force_error_is_bounded_and_grows_with_theta<S: Tol>() {
    for body_count in SIZES {
        for seed in SEEDS {
            let world = cluster::<S>(body_count, seed).unwrap();
            let mut previous = 0.0;
            for (theta, bound) in THETA_BOUNDS {
                let error = force_error(world.particles(), theta);
                assert!(
                    error <= bound,
                    "n {body_count}, seed {seed}, θ {theta}: error {error:e} > {bound}"
                );
                assert!(
                    error > previous,
                    "n {body_count}, seed {seed}: error at θ {theta} ({error:e}) not above {previous:e}"
                );
                previous = error;
            }
        }
    }
}
for_each_scalar!(force_error_is_bounded_and_grows_with_theta);

const MOMENTUM_BODIES: usize = 64;
const MOMENTUM_STEPS: u32 = 1000;
const MOMENTUM_THETA: f64 = 0.5;

/// Momentum drift allowed after the run, as a fraction of `Σ m |v|`.
/// Measured with the `δ` opening test: 5.2e-3 (f64), 8.7e-3 (f32); bound
/// ~10x.
/// For scale: the cluster's initial momentum is about 4e-3 of `Σ m |v|`,
/// so Barnes–Hut changes the total momentum by more than it started with.
/// Other runs measured: θ = 1 drifts 7.0e-2 (f64), θ = 0.3 8.8e-4.
const MOMENTUM_DRIFT_REL: f64 = 0.1;

/// Barnes–Hut forces aren't equal and opposite, so momentum drifts
/// (`docs/barnes-hut.md`). Two checks:
///
/// 1. The derived law: each step changes momentum by `h Σ mᵢ aᵢ`, and the
///    exact forces sum to zero, so `|Δp| ≤ h Σ mᵢ |aᵢ − aᵢ*|` summed over
///    steps (plus rounding). Measured: the drift is 0.7% (f64) and 1.1%
///    (f32) of this bound (errors mostly cancel); the triangle inequality is loose, but
///    it is a law, not a fit.
/// 2. The measured size, [`MOMENTUM_DRIFT_REL`].
fn momentum_drift_is_bounded_by_force_error<S: Tol>() {
    let mut world = cluster_barnes_hut::<S>(MOMENTUM_BODIES, 1, MOMENTUM_THETA);
    let (exact_force, tree_force) = (
        cluster_gravity::<S>().unwrap(),
        cluster_barnes_hut_force::<S>(MOMENTUM_THETA),
    );
    let start_momentum = momentum(world.particles());
    let mut error_law = 0.0;
    for _ in 0..MOMENTUM_STEPS {
        let exact = accelerations(world.particles(), &exact_force);
        let tree = accelerations(world.particles(), &tree_force);
        error_law += DT
            * tree
                .iter()
                .zip(&exact)
                .zip(world.particles().inverse_mass())
                .map(|((&approximate, &direct), &inverse_mass)| {
                    (approximate - direct).length().to_f64() / inverse_mass.to_f64()
                })
                .sum::<f64>();
        world.step(time_step(DT));
    }
    let drift = (momentum(world.particles()) - start_momentum)
        .length()
        .to_f64();
    let scale = momentum_scale(world.particles());
    let rounding = momentum_drift_bound::<S>(MOMENTUM_STEPS, scale);
    assert!(
        drift <= error_law + rounding,
        "drift {drift:e} exceeds force-error law {error_law:e} + rounding {rounding:e}"
    );
    assert!(
        drift <= MOMENTUM_DRIFT_REL * scale,
        "drift {:e} of Σm|v|",
        drift / scale
    );
}
for_each_scalar!(momentum_drift_is_bounded_by_force_error);

/// θ = 0 is direct summation, so it should conserve momentum like
/// `PairwiseGravity`. Not guaranteed by construction (each body's sum is
/// separate, so the pair forces aren't one value applied ±), but rounding
/// is all that's left. Measured: 4.1e-16 (f64) and 3.2e-7 (f32) of
/// `Σ m |v|`, ~400–500x under the property tests' `steps · ε · Σ m|v|` law.
fn theta_zero_conserves_momentum_to_rounding<S: Tol>() {
    let mut world = cluster_barnes_hut::<S>(MOMENTUM_BODIES, 1, 0.0);
    let start_momentum = momentum(world.particles());
    for _ in 0..MOMENTUM_STEPS {
        world.step(time_step(DT));
    }
    let drift = (momentum(world.particles()) - start_momentum)
        .length()
        .to_f64();
    let bound = momentum_drift_bound::<S>(MOMENTUM_STEPS, momentum_scale(world.particles()));
    assert!(drift <= bound, "drift {drift:e} vs bound {bound:e}");
}
for_each_scalar!(theta_zero_conserves_momentum_to_rounding);

fn cluster_runs_finite_for_every_theta<S: Tol>() {
    for (theta, _) in THETA_BOUNDS {
        let mut world = cluster_barnes_hut::<S>(MOMENTUM_BODIES, 2, theta);
        for _ in 0..300 {
            world.step(time_step(DT));
        }
        let finite =
            |vector: &Vec2<S>| vector.x.to_f64().is_finite() && vector.y.to_f64().is_finite();
        assert!(
            world.particles().positions().iter().all(finite),
            "θ {theta}"
        );
        assert!(
            world.particles().velocities().iter().all(finite),
            "θ {theta}"
        );
    }
}
for_each_scalar!(cluster_runs_finite_for_every_theta);
