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
    momentum_drift_bound, s,
};

/// One step: a 60 Hz frame, as the demos use.
const DT: f64 = 1.0 / 60.0;

/// Opening angles probed, and the bound on each one's force error:
/// `max |a_tree − a_direct| / RMS |a_direct|` over a cluster's bodies.
///
/// Normalized by the RMS acceleration, not by each body's own: a body
/// near the cluster's center has a small net |a| (pulls cancel), so its
/// *relative* error is large while its absolute error is typical. Worst
/// per-body relative errors measured: 0.65 at θ = 0.3, 7.7 at θ = 1
/// (n = 1024); medians 0.4% and 6.4% (`docs/barnes-hut.md`).
///
/// Measured (2026-11-02), worst over n ∈ {64, 256, 1024}, seeds 1–3, f32
/// and f64 (equal to 3 digits): 0.0127, 0.0487, 0.198, 0.302. Bounds ~10x
/// above. An independent Python Barnes–Hut on the same 256 bodies agreed
/// to 1.7e-15 of RMS |a| (θ = 0.5), so these are the method's errors.
const THETA_BOUNDS: [(f64, f64); 4] = [(0.3, 0.13), (0.5, 0.5), (0.8, 2.0), (1.0, 3.0)];

/// Cluster sizes for the accuracy test: past the crossover (~200–256 bodies
/// at θ = 0.5), and deep enough for trees of several levels.
const SIZES: [usize; 3] = [64, 256, 1024];
const SEEDS: [u64; 3] = [1, 2, 3];

/// `max |a_tree − a_direct| / RMS |a_direct|` for the cluster in `p`.
fn force_error<S: Scalar>(p: &Particles<S>, theta: f64) -> f64 {
    let exact = accelerations(p, &cluster_gravity::<S>().unwrap());
    let tree = accelerations(p, &cluster_barnes_hut_force::<S>(theta));
    let mean_sq =
        exact.iter().map(|a| a.length_sq().to_f64()).sum::<f64>() / f64::from(len_u32(&exact));
    let worst = tree
        .iter()
        .zip(&exact)
        .map(|(&t, &e)| (t - e).length().to_f64())
        .fold(0.0, f64::max);
    worst / mean_sq.sqrt()
}

fn len_u32<T>(v: &[T]) -> u32 {
    u32::try_from(v.len()).unwrap()
}

/// Force error stays under each θ's bound, and grows with θ.
fn force_error_is_bounded_and_grows_with_theta<S: Tol>() {
    for n in SIZES {
        for seed in SEEDS {
            let w = cluster::<S>(n, seed).unwrap();
            let mut previous = 0.0;
            for (theta, bound) in THETA_BOUNDS {
                let err = force_error(&w.particles, theta);
                assert!(
                    err <= bound,
                    "n {n}, seed {seed}, θ {theta}: error {err:e} > {bound}"
                );
                assert!(
                    err > previous,
                    "n {n}, seed {seed}: error at θ {theta} ({err:e}) not above {previous:e}"
                );
                previous = err;
            }
        }
    }
}
for_each_scalar!(force_error_is_bounded_and_grows_with_theta);

/// Momentum run: 64 bodies, 1000 steps (16.7 s), θ = 0.5.
const MOMENTUM_N: usize = 64;
const MOMENTUM_STEPS: u32 = 1000;
const MOMENTUM_THETA: f64 = 0.5;

/// Momentum drift allowed after the run, as a fraction of `Σ m |v|`.
/// Measured (2026-11-02): 1.04e-2 (f64), 5.3e-3 (f32); bound ~10x.
/// For scale: the cluster's initial momentum is about 4e-3 of `Σ m |v|`,
/// so Barnes–Hut changes the total momentum by more than it started with.
/// Other runs measured: θ = 1 drifts 7.1e-2 (f64), θ = 0.3 4.7e-3.
const MOMENTUM_DRIFT_REL: f64 = 0.1;

/// `Σ m |v|` of the dynamic bodies: the scale momentum drift is judged on.
fn momentum_scale<S: Scalar>(p: &Particles<S>) -> f64 {
    p.vel()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .map(|(v, w)| v.length().to_f64() / w.to_f64())
        .sum()
}

/// Barnes–Hut forces aren't equal and opposite, so momentum drifts
/// (`docs/barnes-hut.md`). Two checks:
///
/// 1. The derived law: each step changes momentum by `h Σ mᵢ aᵢ`, and the
///    exact forces sum to zero, so `|Δp| ≤ h Σ mᵢ |aᵢ − aᵢ*|` summed over
///    steps (plus rounding). Measured: the drift is 0.9% (f64) and 0.4%
///    (f32) of this bound (errors mostly cancel); the triangle inequality is loose, but
///    it is a law, not a fit.
/// 2. The measured size, [`MOMENTUM_DRIFT_REL`].
fn momentum_drift_is_bounded_by_force_error<S: Tol>() {
    let mut w = cluster_barnes_hut::<S>(MOMENTUM_N, 1, MOMENTUM_THETA);
    let (exact_force, tree_force) = (
        cluster_gravity::<S>().unwrap(),
        cluster_barnes_hut_force::<S>(MOMENTUM_THETA),
    );
    let p0 = momentum(&w.particles);
    let mut error_law = 0.0;
    for _ in 0..MOMENTUM_STEPS {
        let exact = accelerations(&w.particles, &exact_force);
        let tree = accelerations(&w.particles, &tree_force);
        error_law += DT
            * tree
                .iter()
                .zip(&exact)
                .zip(w.particles.inv_mass())
                .map(|((&t, &e), &inv_m)| (t - e).length().to_f64() / inv_m.to_f64())
                .sum::<f64>();
        w.step(s(DT));
    }
    let drift = (momentum(&w.particles) - p0).length().to_f64();
    let scale = momentum_scale(&w.particles);
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
    let mut w = cluster_barnes_hut::<S>(MOMENTUM_N, 1, 0.0);
    let p0 = momentum(&w.particles);
    for _ in 0..MOMENTUM_STEPS {
        w.step(s(DT));
    }
    let drift = (momentum(&w.particles) - p0).length().to_f64();
    let bound = momentum_drift_bound::<S>(MOMENTUM_STEPS, momentum_scale(&w.particles));
    assert!(drift <= bound, "drift {drift:e} vs bound {bound:e}");
}
for_each_scalar!(theta_zero_conserves_momentum_to_rounding);

/// Inside `World::step` (not just `accumulate`), a cluster stays finite
/// for every θ: a smoke test of the force in a real run.
fn cluster_runs_finite_for_every_theta<S: Tol>() {
    for (theta, _) in THETA_BOUNDS {
        let mut w = cluster_barnes_hut::<S>(MOMENTUM_N, 2, theta);
        for _ in 0..300 {
            w.step(s(DT));
        }
        let finite = |v: &Vec2<S>| v.x.to_f64().is_finite() && v.y.to_f64().is_finite();
        assert!(w.particles.pos().iter().all(finite), "θ {theta}");
        assert!(w.particles.vel().iter().all(finite), "θ {theta}");
    }
}
for_each_scalar!(cluster_runs_finite_for_every_theta);
