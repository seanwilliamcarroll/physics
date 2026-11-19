//! Methods that must misbehave (`docs/04-testing.md`, known-failure
//! catalog). The orbit demo shows these failures side by side; these tests
//! keep the demonstrations demonstrating.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::scenarios::{
    GRAVITATIONAL_CONSTANT, ORBIT_SEPARATION, ORBIT_TOTAL_MASS, newtonian, orbit,
};
use engine::{Integrator, Scalar, Softening, Vec2, World};
use test_support::{
    Tol, energy_errors, envelope, for_each_scalar, kg, nonzero, orbit_energy, s, separation,
    steps_for, time_step,
};

/// One 60 Hz frame: the step the demo uses.
const FINE_DT: f64 = 1.0 / 60.0;

/// Explicit Euler on the circular orbit, energy sampled once per orbit.
const EXPLICIT_EULER_ORBITS: usize = 5;
/// It must at least double the separation in `EXPLICIT_EULER_ORBITS` orbits
/// (measured: 2.13x, still accelerating outward).
const EXPLICIT_EULER_ESCAPE_FACTOR: f64 = 2.0;

/// `explicit_euler_gains_energy_on_orbit` (`docs/04-testing.md`): position
/// moves with the old velocity, so every step overshoots outward and the
/// orbit spirals out. Measured per-orbit ΔE/E: 0.25, 0.36, 0.41, 0.46,
/// 0.50 (energy rises toward 0, i.e. unbound).
fn explicit_euler_gains_energy_on_orbit<S: Tol>() {
    let mut world = orbit::<S>(Integrator::ExplicitEuler, 1.0).unwrap();
    let start_energy = orbit_energy(&world);
    let steps_per_orbit = steps_for(1.0, FINE_DT);
    let mut previous = 0.0;
    for orbit_number in 1..=EXPLICIT_EULER_ORBITS {
        for _ in 0..steps_per_orbit {
            world.step(time_step(FINE_DT));
        }
        let gain = (orbit_energy(&world) - start_energy) / start_energy.abs();
        assert!(
            gain > previous,
            "orbit {orbit_number}: ΔE/E {gain:e} didn't rise (previous {previous:e})"
        );
        previous = gain;
    }
    let grown = separation(&world) / ORBIT_SEPARATION;
    assert!(
        grown > EXPLICIT_EULER_ESCAPE_FACTOR,
        "separation only grew {grown:.2}x"
    );
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
fn periapsis_angle<S: Scalar>(world: &World<S>) -> f64 {
    let (positions, velocities) = (world.particles().pos(), world.particles().vel());
    let (relative_position, relative_velocity) =
        (positions[1] - positions[0], velocities[1] - velocities[0]);
    let (relative_x, relative_y, relative_vx, relative_vy) = (
        relative_position.x.to_f64(),
        relative_position.y.to_f64(),
        relative_velocity.x.to_f64(),
        relative_velocity.y.to_f64(),
    );
    let gravitational_parameter = GRAVITATIONAL_CONSTANT * ORBIT_TOTAL_MASS;
    let (speed_squared, position_dot_velocity, distance) = (
        relative_vx * relative_vx + relative_vy * relative_vy,
        relative_x * relative_vx + relative_y * relative_vy,
        relative_x.hypot(relative_y),
    );
    (relative_y * speed_squared
        - relative_vy * position_dot_velocity
        - gravitational_parameter * relative_y / distance)
        .atan2(
            relative_x * speed_squared
                - relative_vx * position_dot_velocity
                - gravitational_parameter * relative_x / distance,
        )
}

/// Precession over the run, wrapped to (-π, π].
fn precession<S: Tol>(dt: f64) -> (f64, Vec<f64>, (f64, f64)) {
    let mut world = orbit::<S>(Integrator::SymplecticEuler, ECCENTRIC_SPEED).unwrap();
    let start_angle = periapsis_angle(&world);
    let (errors, band) = energy_errors(&mut world, dt, steps_for(PRECESSION_ORBITS, dt));
    let full_turn = 2.0 * core::f64::consts::PI;
    let turned = (periapsis_angle(&world) - start_angle + core::f64::consts::PI)
        .rem_euclid(full_turn)
        - core::f64::consts::PI;
    (turned, errors, band)
}

/// "Large dt orbit" (`docs/04-testing.md`): symplectic Euler at a coarse
/// step visibly precesses, yet stays bounded. Bounded-but-wrong is the
/// point: energy can't run away, but the orbit's orientation drifts.
fn symplectic_euler_coarse_dt_precesses_but_stays_bounded<S: Tol>() {
    let (fine, _, _) = precession::<S>(FINE_DT);
    let (coarse, errors, (_, highest_separation)) = precession::<S>(COARSE_DT);
    assert!(
        coarse.abs() > PRECESSION_FACTOR * fine.abs(),
        "coarse {coarse:e} rad vs fine {fine:e} rad"
    );
    let max_error = envelope(&errors);
    assert!(
        max_error < COARSE_ENERGY_BOUND,
        "energy error {max_error:e}"
    );
    assert!(
        highest_separation <= COARSE_MAX_SEPARATION * ORBIT_SEPARATION,
        "separation reached {highest_separation}"
    );
}
for_each_scalar!(symplectic_euler_coarse_dt_precesses_but_stays_bounded);

/// Close-pass setup: two 10¹⁰ kg bodies 2 m apart closing at 1 m/s each,
/// offset by an impact parameter of 1 mm: a near miss.
const PASS_MASS_KG: f64 = 1.0e10;
const PASS_SPEED: f64 = 1.0;
const PASS_HALF_GAP_M: f64 = 1.0;
const PASS_IMPACT_M: f64 = 0.001;
/// 2 s: they meet at about 1 s.
const PASS_STEPS: u32 = 120;
/// Softened comparison: the property-test softening (10 cm).
const PASS_SOFTENING_M: f64 = 0.1;
/// Unsoftened peak speed must exceed the softened one by this factor.
/// Measured: 1024 m/s vs 2.77 m/s (370x); ε = 1 cm gives 39 m/s.
const SPIKE_FACTOR: f64 = 100.0;
/// "Bounded": the softened pass stays below this peak speed, m/s.
const SOFTENED_PEAK_MAX: f64 = 10.0;

/// Fastest speed reached by either body during the close pass.
fn close_pass_peak_speed<S: Scalar>(softening: f64) -> f64 {
    let mut world = World::<S>::new(Integrator::SymplecticEuler, nonzero(1));
    world.add_force(newtonian(Softening::new(s::<S>(softening)).unwrap()));
    let vec = |x: f64, y: f64| Vec2::from_f64(x, y);
    let half_impact = PASS_IMPACT_M / 2.0;
    world.add_particle(
        vec(-PASS_HALF_GAP_M, half_impact),
        vec(PASS_SPEED, 0.0),
        kg(PASS_MASS_KG),
    );
    world.add_particle(
        vec(PASS_HALF_GAP_M, -half_impact),
        vec(-PASS_SPEED, 0.0),
        kg(PASS_MASS_KG),
    );
    let mut peak = 0.0_f64;
    for _ in 0..PASS_STEPS {
        world.step(time_step(FINE_DT));
        for velocity in world.particles().vel() {
            peak = peak.max(velocity.length().to_f64());
        }
    }
    peak
}

/// `unsoftened_close_pass_spikes` (`docs/04-testing.md`): with zero
/// softening the pull grows as 1/r², and one step landing near the closest
/// approach gets an enormous kick: the bodies fling apart at hundreds of
/// times their approach speed. Softening caps the force.
fn unsoftened_close_pass_spikes<S: Tol>() {
    let unsoftened = close_pass_peak_speed::<S>(0.0);
    let softened = close_pass_peak_speed::<S>(PASS_SOFTENING_M);
    assert!(
        unsoftened >= SPIKE_FACTOR * softened,
        "peak {unsoftened:.3e} m/s unsoftened vs {softened:.3e} softened"
    );
    assert!(
        softened < SOFTENED_PEAK_MAX,
        "softened peak {softened:.3e} m/s"
    );
}
for_each_scalar!(unsoftened_close_pass_spikes);

/// `impulse_without_baumgarte_stretches` (`01-solvers.md`): zeroing the
/// rod's radial velocity is a linearization, so the bob leaves the circle
/// along the tangent every step and the rod stretches. Measured: 47 cm
/// on a 1 m rod in 10 s, in both scalars.
fn impulse_without_baumgarte_stretches<S: Tol>() {
    let run = test_support::pendulum_run::<S>(engine::Solver::Impulse, 0.0, 1);
    assert!(
        run.max_rod_error > 0.4,
        "rod error only {} m",
        run.max_rod_error
    );
}
for_each_scalar!(impulse_without_baumgarte_stretches);

/// `xpbd_single_substep_loses_energy` (`01-solvers.md`): projection acts
/// as numerical damping proportional to the step, so with one substep per
/// 60 Hz frame the pendulum nearly stops. Measured: 8.79 of the 9.81 J
/// swing lost in 10 s, in both scalars.
fn xpbd_single_substep_loses_energy<S: Tol>() {
    let run = test_support::pendulum_run::<S>(engine::Solver::Xpbd, 0.0, 1);
    assert!(run.energy_lost > 8.0, "lost only {} J", run.energy_lost);
}
for_each_scalar!(xpbd_single_substep_loses_energy);

/// `xpbd_f32_substeps_derive_noisy_velocities`: XPBD derives
/// `v = (x − x_prev) / h`. At 100 substeps the bob moves ~0.4 mm per
/// substep at radius 1 m, where f32's spacing is ~0.1 µm, so each derived
/// velocity carries ~1e-4 relative rounding noise, and it compounds. f64
/// loses 0.31 J over 10 s; f32 *gains* 0.11 J. More substeps, worse f32:
/// the reverse of "substeps fix everything".
#[test]
fn xpbd_f32_substeps_derive_noisy_velocities() {
    use engine::Solver;
    let f64_lost = test_support::pendulum_run::<f64>(Solver::Xpbd, 0.0, 100).energy_lost;
    let f32_lost = test_support::pendulum_run::<f32>(Solver::Xpbd, 0.0, 100).energy_lost;
    assert!(
        (f32_lost - f64_lost).abs() > 0.2,
        "f32 {f32_lost} J vs f64 {f64_lost} J: too close"
    );
}
