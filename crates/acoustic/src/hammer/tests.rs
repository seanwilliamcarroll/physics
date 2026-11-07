use super::fit::{fit, smooth};
use super::keys::key_coordinate;
use super::{
    FITTED_AT, FORTISSIMO, Felt, Hammer, PIANISSIMO, SPREAD, contact_target, contact_time, felt,
    impedance, mezzo_forte,
};

#[test]
#[ignore = "regenerates hammer/table.rs: seconds in release"]
fn regenerate_the_table() {
    let fits: Vec<_> = (21..=108_u8)
        .map(|key| (key, fit(FITTED_AT, key).expect("every key fits")))
        .collect();
    for (key, f) in &fits {
        println!(
            "// MIDI {key}: fitted {:.3} g, K {:.3e}",
            f.mass * 1e3,
            f.stiffness
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
    const FS: f64 = 192_000.0;
    const RIGID: f64 = 1e12;
    for (mass, k, p, v) in [
        (3e-3, 1e9, 2.3, 2.0),
        (2e-3, 1e11, 2.6, 0.5),
        (4e-3, 1e12, 3.0, 5.0),
    ] {
        let felt = Felt {
            mass,
            stiffness: k,
            exponent: p,
        };
        let mut h = Hammer::new(felt, RIGID, FS, v).unwrap();
        let e0 = h.energy();
        let mut last = 0.0;
        let mut previous = 0.0_f64;
        let mut n = 0_u32;
        while !h.retired() {
            h.step(0.0);
            let c = h.compression();
            if h.force() > 0.0 && c > 0.0 {
                last = f64::from(n + 1);
            } else if previous > 0.0 {
                last = f64::from(n) + previous / (previous - c);
            }
            previous = if c > 0.0 { c } else { 0.0 };
            n += 1;
        }
        let n_ = p + 1.0;
        let c_max = libm::pow(n_ * mass * v * v / (2.0 * k), 1.0 / n_);
        let want = 2.0 * c_max / v * core::f64::consts::PI.sqrt() * libm::tgamma(1.0 + 1.0 / n_)
            / libm::tgamma(0.5 + 1.0 / n_);
        let got = last / FS;
        println!(
            "M {mass} K {k:e} p {p} v {v}: contact {:.4} ms (Hertz {:.4}), energy kept {:.9}, rebound {:.6} m/s",
            got * 1e3,
            want * 1e3,
            h.energy() / e0,
            h.velocity()
        );
        assert!((got / want - 1.0).abs() < HERTZ_TOL, "{got} vs {want}");
        assert!(
            (h.energy() / e0 - 1.0).abs() < ELASTIC_TOL,
            "{}",
            h.energy() / e0
        );
        assert!(h.velocity() < 0.0, "it rebounds");
    }
}

/// See the printout (A3.3).
const HERTZ_TOL: f64 = 0.01;
const ELASTIC_TOL: f64 = 1e-6;

/// The smoothed hammers in the model they were fitted on: each key's mf
/// contact near its target, and the spread from pp to ff near the
/// measured one.
#[test]
fn the_smoothed_hammers_meet_the_fit_targets() {
    for key in (21..=108_u8).step_by(9) {
        let f0 = 440.0 * 2f64.powf((f64::from(key) - 69.0) / 12.0);
        let (f, z) = (felt(key).unwrap(), impedance(key));
        let at = |v: f64| contact_time(FITTED_AT, f0, f, z, v).unwrap();
        let (pp, mf, ff) = (at(PIANISSIMO), at(mezzo_forte()), at(FORTISSIMO));
        let target = contact_target(key);
        println!(
            "MIDI {key}: M {:.2} g, K {:.2e}, p {:.2}: mf {:.2} ms ({:+.0}%), spread {:.2}",
            f.mass * 1e3,
            f.stiffness,
            f.exponent,
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

/// See the printout (A3.3).
const FIT_TOL: f64 = 0.35;
const FIT_SPREAD_TOL: f64 = 0.5;

/// A linear felt (`p = 1`) on a string whose reflection is still far off
/// is a damped oscillator, `c'' + (K/2Z) c' + (K/m) c = 0`, in contact
/// for half its damped period, `π / √(K/m − (K/4Z)²)`: 1.6223 ms here.
/// The blow converges on it at second order (the midpoint rule); before
/// the fix, separation was never interpolated and every contact ran to
/// the next whole sample (1.625 ms at every rate; found by cargo-mutants).
#[test]
fn a_linear_blow_lasts_half_a_damped_period() {
    let felt = Felt {
        mass: 0.01,
        stiffness: 1e5,
        exponent: 1.0,
    };
    let z = 10.0;
    let exact = core::f64::consts::PI
        / (felt.stiffness / felt.mass - (felt.stiffness / (4.0 * z)).powi(2)).sqrt();
    // A0: the reflection returns after STRIKE / f0 = 4.5 ms, long after.
    let error = |fs: f64| contact_time(fs, 27.5, felt, z, 1.0).unwrap() / exact - 1.0;
    let (e48, e96) = (error(48_000.0), error(96_000.0));
    assert!(e48.abs() < 1e-3, "48 kHz: {e48:+e}");
    let order = (e48 / e96).log2();
    assert!((order - 2.0).abs() < 0.2, "converges at order {order}");
}
