//! Fitting the hammers offline (`docs/14-piano.md`): each key's mass and
//! felt stiffness for which the cheap model ([`contact_time`]) gives the
//! key's contact time at mf **and** the measured spread from pp to ff.
//! Two measurements, two unknowns: fitting the stiffness alone drove the
//! tenor's felt nearly rigid (its target sits near the string's own
//! floor), and then velocity barely changed the sound.
//!
//! The per-key fit is jagged (the near return is a whole number of
//! samples, and the fit hops between branches where a contact pulse
//! appears), so the piano uses a smooth cubic through it in `log M` and
//! `log K`, [`smooth`]: an even keyboard, the targets met within the
//! tests' measured margins.

use super::contact::contact_within;
use super::keys::{
    FORTISSIMO, PIANISSIMO, SPREAD, contact_target, exponent, impedance, mezzo_forte,
};
use super::{Felt, contact_time};

/// The equal-tempered frequency of `midi`.
fn frequency(midi: u8) -> f64 {
    440.0 * libm::pow(2.0, (f64::from(midi) - 69.0) / 12.0)
}

/// The stiffness search, in `log₁₀ K`: up from soft felt in steps until
/// contact is short enough, then bisected (contact time isn't monotonic
/// in `K` past its minimum, so the first crossing from below is the one).
const STIFFNESS_FROM: f64 = 5.0;
const STIFFNESS_TO: f64 = 15.0;
const STIFFNESS_STEP: f64 = 0.25;
const STIFFNESS_BISECTIONS: u32 = 25;

/// The mass search: a grid from 0.5 g in steps of `√2` to 32 g, then
/// bisected in `log M` between the two masses whose spreads straddle the
/// target.
const MASS_FROM: f64 = 0.5e-3;
const MASS_STEPS: i32 = 13;
const MASS_BISECTIONS: u32 = 20;

/// The stiffness giving contact `target` at mf for hammer mass `mass`.
fn stiffness_for(fs: f64, f0: f64, mass: f64, p: f64, z: f64, target: f64) -> Option<f64> {
    let felt = |e: f64| Felt {
        mass,
        stiffness: libm::pow(10.0, e),
        exponent: p,
    };
    let short_enough = |e: f64| contact_within(fs, f0, felt(e), z, mezzo_forte(), target).is_some();
    let mut e = STIFFNESS_FROM;
    while !short_enough(e + STIFFNESS_STEP) {
        e += STIFFNESS_STEP;
        if e > STIFFNESS_TO {
            return None;
        }
    }
    let (mut lo, mut hi) = (e, e + STIFFNESS_STEP);
    for _ in 0..STIFFNESS_BISECTIONS {
        let mid = f64::midpoint(lo, hi);
        if short_enough(mid) {
            hi = mid;
        } else {
            lo = mid;
        }
    }
    Some(libm::pow(10.0, hi))
}

/// For hammer mass `mass`: the stiffness hitting the mf target, and the
/// resulting pp-to-ff spread.
fn spread_for(fs: f64, f0: f64, mass: f64, p: f64, z: f64, target: f64) -> Option<(Felt, f64)> {
    let stiffness = stiffness_for(fs, f0, mass, p, z, target)?;
    let felt = Felt {
        mass,
        stiffness,
        exponent: p,
    };
    let soft = contact_time(fs, f0, felt, z, PIANISSIMO)?;
    let hard = contact_time(fs, f0, felt, z, FORTISSIMO)?;
    Some((felt, soft / hard))
}

/// The hammer for `midi` at `fs` Hz, fitted to its contact time and
/// spread. Where no mass gives the spread exactly (the spread can jump
/// as contact pulses appear), the grid mass closest to it.
#[must_use]
pub(crate) fn fit(fs: f64, midi: u8) -> Option<Felt> {
    let (f0, p, z, target) = (
        frequency(midi),
        exponent(midi),
        impedance(midi),
        contact_target(midi),
    );
    let mass_at = |i: f64| MASS_FROM * libm::pow(2.0, 0.5 * i);
    let grid: Vec<(f64, Option<(Felt, f64)>)> = (0..MASS_STEPS)
        .map(f64::from)
        .map(|i| (i, spread_for(fs, f0, mass_at(i), p, z, target)))
        .collect();
    // The spread falls as the hammer gets heavier: the first pair that
    // straddles the target.
    let straddle = grid.windows(2).find_map(|w| match w {
        [(a, Some((_, ra))), (b, Some((_, rb)))] if *ra >= SPREAD && *rb < SPREAD => Some((*a, *b)),
        _ => None,
    });
    let Some((mut lo, mut hi)) = straddle else {
        return grid
            .iter()
            .filter_map(|(_, s)| *s)
            .min_by(|a, b| (a.1 - SPREAD).abs().total_cmp(&(b.1 - SPREAD).abs()))
            .map(|(f, _)| f);
    };
    let mut best = None;
    for _ in 0..MASS_BISECTIONS {
        let mid = f64::midpoint(lo, hi);
        match spread_for(fs, f0, mass_at(mid), p, z, target) {
            Some((f, r)) => {
                best = Some(f);
                if r >= SPREAD {
                    lo = mid;
                } else {
                    hi = mid;
                }
            }
            None => hi = mid,
        }
    }
    best.or_else(|| spread_for(fs, f0, mass_at(lo), p, z, target).map(|(f, _)| f))
}

/// Polynomial degree of the smoothing.
const DEGREE: usize = 3;

/// Where `midi` sits on the keyboard, −1 (A0) to 1 (C8): the cubic's
/// variable, scaled so the least squares are well conditioned.
pub(super) fn key_coordinate(midi: u8) -> f64 {
    (f64::from(midi) - 64.5) / 43.5
}

/// The least-squares cubics through `fits` in `log M` and `log K` against
/// [`key_coordinate`]: coefficients, constant term first.
pub(super) fn smooth(fits: &[(u8, Felt)]) -> Option<([f64; DEGREE + 1], [f64; DEGREE + 1])> {
    let cubic = |value: &dyn Fn(Felt) -> f64| -> Option<[f64; DEGREE + 1]> {
        let mut system = vec![vec![0.0; DEGREE + 2]; DEGREE + 1];
        for &(key, f) in fits {
            let t = key_coordinate(key);
            let powers: Vec<f64> = core::iter::successors(Some(1.0), |p| Some(p * t))
                .take(DEGREE + 1)
                .collect();
            for (row, &pi) in system.iter_mut().zip(&powers) {
                for (cell, &pj) in row.iter_mut().zip(&powers) {
                    *cell += pi * pj;
                }
                if let Some(rhs) = row.last_mut() {
                    *rhs += pi * value(f);
                }
            }
        }
        let x = crate::solve::solve(&mut system)?;
        x.try_into().ok()
    };
    Some((
        cubic(&|f| libm::log(f.mass))?,
        cubic(&|f| libm::log(f.stiffness))?,
    ))
}
