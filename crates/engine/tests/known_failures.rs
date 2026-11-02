//! Methods that must misbehave (`docs/04-testing.md`, known-failure
//! catalog). The M1 demo shows these failures side by side; these tests
//! keep the demonstrations demonstrating.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

#[macro_use]
mod common;

use common::{Tol, energy_errors, envelope, orbit_energy, s, separation, steps_for};
use engine::scenarios::{GRAVITATIONAL_CONSTANT, ORBIT_SEPARATION, ORBIT_TOTAL_MASS, orbit};
use engine::{Integrator, Scalar, World};

/// One 60 Hz frame: the step the demo uses.
const FINE_DT: f64 = 1.0 / 60.0;

/// Explicit Euler on the circular orbit, energy sampled once per orbit.
const EE_ORBITS: usize = 5;
/// It must at least double the separation in `EE_ORBITS` orbits (measured:
/// 2.13x, still accelerating outward).
const EE_ESCAPE_FACTOR: f64 = 2.0;

/// `explicit_euler_gains_energy_on_orbit` (docs/04-testing.md): position
/// moves with the old velocity, so every step overshoots outward and the
/// orbit spirals out. Measured per-orbit ΔE/E: 0.25, 0.36, 0.41, 0.46,
/// 0.50 (energy rises toward 0, i.e. unbound).
fn explicit_euler_gains_energy_on_orbit<S: Tol>() {
    let mut w = orbit::<S>(Integrator::ExplicitEuler, 1.0).unwrap();
    let e0 = orbit_energy(&w);
    let per_orbit = steps_for(1.0, FINE_DT);
    let mut previous = 0.0;
    for k in 1..=EE_ORBITS {
        for _ in 0..per_orbit {
            w.step(s(FINE_DT));
        }
        let gain = (orbit_energy(&w) - e0) / e0.abs();
        assert!(
            gain > previous,
            "orbit {k}: ΔE/E {gain:e} didn't rise (previous {previous:e})"
        );
        previous = gain;
    }
    let grown = separation(&w) / ORBIT_SEPARATION;
    assert!(grown > EE_ESCAPE_FACTOR, "separation only grew {grown:.2}x");
}
for_each_scalar!(explicit_euler_gains_energy_on_orbit);

/// Coarse step for the precession test: 10 Hz, ~30 steps per orbit.
const COARSE_DT: f64 = 1.0 / 10.0;
/// Launch at 80% of circular speed: an ellipse (e ≈ 0.36), so the orbit has
/// an orientation to precess.
const ECCENTRIC_SPEED: f64 = 0.8;
const PRECESSION_ORBITS: f64 = 3.0;
/// Coarse-dt precession must exceed fine-dt precession by this factor.
/// Measured over 3 orbits: 1.216 rad vs 0.044 rad (27x).
const PRECESSION_FACTOR: f64 = 10.0;
/// "Stays bounded": energy error below this, and the planet never gets
/// farther than this many starting separations (it starts at apoapsis).
/// Measured: 0.25 and 1.016.
const COARSE_ENERGY_BOUND: f64 = 0.5;
const COARSE_MAX_SEPARATION: f64 = 1.05;

/// Orientation of the ellipse: the angle of the Laplace–Runge–Lenz vector
/// `A = r |v|² − v (r·v) − μ r̂` of the relative orbit, which points at
/// periapsis and is fixed for an exact Kepler orbit. (Uses `atan2`: fine in
/// a test, never in the engine.)
fn periapsis_angle<S: Scalar>(w: &World<S>) -> f64 {
    let (p, v) = (w.particles.pos(), w.particles.vel());
    let (r, u) = (p[1] - p[0], v[1] - v[0]);
    let (rx, ry, ux, uy) = (r.x.to_f64(), r.y.to_f64(), u.x.to_f64(), u.y.to_f64());
    let mu = GRAVITATIONAL_CONSTANT * ORBIT_TOTAL_MASS;
    let (uu, ru, rl) = (ux * ux + uy * uy, rx * ux + ry * uy, rx.hypot(ry));
    (ry * uu - uy * ru - mu * ry / rl).atan2(rx * uu - ux * ru - mu * rx / rl)
}

/// Precession over the run, wrapped to (-π, π].
fn precession<S: Tol>(dt: f64) -> (f64, Vec<f64>, (f64, f64)) {
    let mut w = orbit::<S>(Integrator::SymplecticEuler, ECCENTRIC_SPEED).unwrap();
    let a0 = periapsis_angle(&w);
    let (errors, band) = energy_errors(&mut w, dt, steps_for(PRECESSION_ORBITS, dt));
    let tau = 2.0 * core::f64::consts::PI;
    let turned =
        (periapsis_angle(&w) - a0 + core::f64::consts::PI).rem_euclid(tau) - core::f64::consts::PI;
    (turned, errors, band)
}

/// "Large dt orbit" (docs/04-testing.md): symplectic Euler at a coarse
/// step visibly precesses, yet stays bounded. Bounded-but-wrong is the
/// point: energy can't run away, but the orbit's orientation drifts.
fn symplectic_euler_coarse_dt_precesses_but_stays_bounded<S: Tol>() {
    let (fine, _, _) = precession::<S>(FINE_DT);
    let (coarse, errors, (_, hi)) = precession::<S>(COARSE_DT);
    assert!(
        coarse.abs() > PRECESSION_FACTOR * fine.abs(),
        "coarse {coarse:e} rad vs fine {fine:e} rad"
    );
    let max = envelope(&errors);
    assert!(max < COARSE_ENERGY_BOUND, "energy error {max:e}");
    assert!(
        hi <= COARSE_MAX_SEPARATION * ORBIT_SEPARATION,
        "separation reached {hi}"
    );
}
for_each_scalar!(symplectic_euler_coarse_dt_precesses_but_stays_bounded);
