use super::fit::{fit, smooth};
use super::keys::key_coordinate;
use super::{
    FITTED_AT, FORTISSIMO, Felt, Hammer, PIANISSIMO, SPREAD, contact_target, contact_time, felt,
    impedance, mean_force, mean_force_slope, mezzo_forte, spring,
};

#[test]
#[ignore = "regenerates hammer/table.rs: seconds in release"]
fn regenerate_the_table() {
    let fits: Vec<_> = (21..=108_u8)
        .map(|key| (key, fit(FITTED_AT, key).expect("every key fits")))
        .collect();
    for (key, fitted) in &fits {
        println!(
            "// MIDI {key}: fitted {:.3} g, K {:.3e}",
            fitted.mass * 1e3,
            fitted.stiffness
        );
    }
    let (mass, stiffness) = smooth(&fits).expect("a cubic");
    println!("pub(super) const MASS: [f64; 4] = {mass:?};");
    println!("pub(super) const STIFFNESS: [f64; 4] = {stiffness:?};");
}

#[test]
fn the_cubic_uses_the_fits_coordinate() {
    assert!((key_coordinate(21) + 1.0).abs() < 1e-12 && (key_coordinate(108) - 1.0).abs() < 1e-12);
    assert!(felt(20).is_none() && felt(109).is_none() && felt(60).is_some());
}

/// Against a rigid wall (an enormous `Z`, nothing incoming), a mass on a
/// `K c^p` spring bounces elastically, and its contact has a closed form:
/// `2 (c_max / v) √π Γ(1 + 1/n) / Γ(½ + 1/n)`, `n = p + 1`,
/// `c_max = ((p + 1) M v² / 2K)^(1/n)` (energy: `½ M v² = K c_max^n / n`).
#[test]
fn a_rigid_wall_bounce_is_elastic_and_hertzian() {
    const SAMPLE_RATE: f64 = 192_000.0;
    const RIGID: f64 = 1e12;
    for (mass, stiffness, exponent, velocity) in [
        (3e-3, 1e9, 2.3, 2.0),
        (2e-3, 1e11, 2.6, 0.5),
        (4e-3, 1e12, 3.0, 5.0),
    ] {
        let felt = Felt {
            mass,
            stiffness,
            exponent,
        };
        let mut hammer = Hammer::new(felt, RIGID, SAMPLE_RATE, velocity).unwrap();
        let initial_energy = hammer.energy();
        let mut last_contact = 0.0;
        let mut previous = 0.0_f64;
        let mut step_count = 0_u32;
        while !hammer.retired() {
            hammer.step(0.0);
            let compression = hammer.compression();
            if hammer.force() > 0.0 && compression > 0.0 {
                last_contact = f64::from(step_count + 1);
            } else if previous > 0.0 {
                last_contact = f64::from(step_count) + previous / (previous - compression);
            }
            previous = if compression > 0.0 { compression } else { 0.0 };
            step_count += 1;
        }
        let power = exponent + 1.0;
        let max_compression = libm::pow(
            power * mass * velocity * velocity / (2.0 * stiffness),
            1.0 / power,
        );
        let expected = 2.0 * max_compression / velocity
            * core::f64::consts::PI.sqrt()
            * libm::tgamma(1.0 + 1.0 / power)
            / libm::tgamma(0.5 + 1.0 / power);
        let contact = last_contact / SAMPLE_RATE;
        println!(
            "M {mass} K {stiffness:e} p {exponent} v {velocity}: contact {:.4} ms (Hertz {:.4}), energy kept {:.9}, rebound {:.6} m/s",
            contact * 1e3,
            expected * 1e3,
            hammer.energy() / initial_energy,
            hammer.velocity()
        );
        assert!(
            (contact / expected - 1.0).abs() < HERTZ_TOL,
            "{contact} vs {expected}"
        );
        assert!(
            (hammer.energy() / initial_energy - 1.0).abs() < ELASTIC_TOL,
            "{}",
            hammer.energy() / initial_energy
        );
        assert!(hammer.velocity() < 0.0, "it rebounds");
    }
}

/// Bounds from the printout: contact within 1 % of Hertz's.
const HERTZ_TOL: f64 = 0.01;
const ELASTIC_TOL: f64 = 1e-6;

/// The smoothed hammers in the model they were fitted on: each key's mf
/// contact near its target, and the spread from pp to ff near the
/// measured one.
#[test]
fn the_smoothed_hammers_meet_the_fit_targets() {
    for key in (21..=108_u8).step_by(9) {
        let fundamental_hz = 440.0 * 2f64.powf((f64::from(key) - 69.0) / 12.0);
        let (felt, string_impedance) = (felt(key).unwrap(), impedance(key));
        let contact_at = |velocity: f64| {
            contact_time(FITTED_AT, fundamental_hz, felt, string_impedance, velocity).unwrap()
        };
        let (pp, mf, ff) = (
            contact_at(PIANISSIMO),
            contact_at(mezzo_forte()),
            contact_at(FORTISSIMO),
        );
        let target = contact_target(key);
        println!(
            "MIDI {key}: M {:.2} g, K {:.2e}, p {:.2}: mf {:.2} ms ({:+.0}%), spread {:.2}",
            felt.mass * 1e3,
            felt.stiffness,
            felt.exponent,
            mf * 1e3,
            100.0 * (mf / target - 1.0),
            pp / ff
        );
        assert!((mf / target - 1.0).abs() < FIT_TOL, "MIDI {key}: {mf}");
        assert!(
            (pp / ff / SPREAD - 1.0).abs() < FIT_SPREAD_TOL,
            "MIDI {key}: {}",
            pp / ff
        );
    }
}

/// Bounds from the printout: mf contact within 35 % of target, spread
/// within 50 % of 1.5.
const FIT_TOL: f64 = 0.35;
const FIT_SPREAD_TOL: f64 = 0.5;

/// A linear felt (`p = 1`) on a string whose reflection is still far off
/// is a damped oscillator, `c'' + (K/2Z) c' + (K/m) c = 0`, in contact
/// for half its damped period, `π / √(K/m − (K/4Z)²)`: 1.6223 ms here.
/// The blow converges on it at second order (the midpoint rule). Without
/// interpolating the separation, every contact ran to the next whole
/// sample (1.625 ms at every rate).
#[test]
fn a_linear_blow_lasts_half_a_damped_period() {
    let felt = Felt {
        mass: 0.01,
        stiffness: 1e5,
        exponent: 1.0,
    };
    let string_impedance = 10.0;
    let exact = core::f64::consts::PI
        / (felt.stiffness / felt.mass - (felt.stiffness / (4.0 * string_impedance)).powi(2)).sqrt();
    // A0: the reflection returns after STRIKE / f0 = 4.5 ms, long after.
    let error = |sample_rate: f64| {
        contact_time(sample_rate, 27.5, felt, string_impedance, 1.0).unwrap() / exact - 1.0
    };
    let (error_48k, error_96k) = (error(48_000.0), error(96_000.0));
    assert!(error_48k.abs() < 1e-3, "48 kHz: {error_48k:+e}");
    let order = (error_48k / error_96k).log2();
    assert!((order - 2.0).abs() < 0.2, "converges at order {order}");
}

/// Returning 1.0, or √(pp + ff), would pass every other test, and mf is
/// the speed of every plain piano note on.
#[test]
fn mezzo_forte_is_the_geometric_mean_of_pp_and_ff() {
    assert_eq!(
        mezzo_forte().to_bits(),
        (PIANISSIMO * FORTISSIMO).sqrt().to_bits()
    );
    assert!((mezzo_forte() - 1.581).abs() < 1e-3);
}

// The mean force's two branches (the potential's difference quotient, and
// the spring at the midpoint when the ends are too close for the quotient)
// are tested directly: through whole blows, Newton's iteration hides a
// wrong slope.

const FELT: Felt = Felt {
    mass: 0.01,
    stiffness: 4e9,
    exponent: 2.5,
};

#[test]
fn with_no_change_the_mean_force_is_the_spring_and_its_slope_half_the_spring_s() {
    let compression = 2e-4;
    assert_eq!(
        mean_force(compression, compression, FELT),
        spring(compression, FELT)
    );
    let half_curvature =
        0.5 * FELT.stiffness * FELT.exponent * compression.powf(FELT.exponent - 1.0);
    let slope = mean_force_slope(compression, compression, FELT);
    assert!(
        (slope / half_curvature - 1.0).abs() < 1e-12,
        "{slope} vs {half_curvature}"
    );
}

#[test]
fn the_slope_is_the_mean_force_s_derivative() {
    // Far apart (the quotient branch) and close (the midpoint branch).
    for (after, before) in [(3e-4, 1e-4), (2e-4 * (1.0 + 1e-9), 2e-4)] {
        let nudge = after * 1e-6;
        let numeric = (mean_force(after + nudge, before, FELT)
            - mean_force(after - nudge, before, FELT))
            / (2.0 * nudge);
        let slope = mean_force_slope(after, before, FELT);
        assert!(
            (slope / numeric - 1.0).abs() < 1e-4,
            "({after}, {before}): {slope} vs {numeric}"
        );
    }
}
