//! Fitting the hammers offline (`docs/14-piano.md`): each key's mass and
//! felt stiffness for which the cheap model ([`contact_time`]) gives the
//! key's contact time at mf **and** the measured pp-to-ff spread. The
//! per-key fit is jagged, so the piano uses a smooth cubic, [`smooth`].

use super::contact::contact_within;
use super::keys::{
    FORTISSIMO, PIANISSIMO, SPREAD, contact_target, exponent, impedance, key_coordinate,
    mezzo_forte,
};
use super::{Felt, contact_time};
use crate::piano::frequency;

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

fn stiffness_for(
    sample_rate: f64,
    fundamental_hz: f64,
    mass: f64,
    exponent: f64,
    string_impedance: f64,
    target: f64,
) -> Option<f64> {
    let felt = |log_stiffness: f64| Felt {
        mass,
        stiffness: libm::pow(10.0, log_stiffness),
        exponent,
    };
    let short_enough = |log_stiffness: f64| {
        contact_within(
            sample_rate,
            fundamental_hz,
            felt(log_stiffness),
            string_impedance,
            mezzo_forte(),
            target,
        )
        .is_some()
    };
    let mut log_stiffness = STIFFNESS_FROM;
    while !short_enough(log_stiffness + STIFFNESS_STEP) {
        log_stiffness += STIFFNESS_STEP;
        if log_stiffness > STIFFNESS_TO {
            return None;
        }
    }
    let (mut lower, mut upper) = (log_stiffness, log_stiffness + STIFFNESS_STEP);
    for _ in 0..STIFFNESS_BISECTIONS {
        let midpoint = f64::midpoint(lower, upper);
        if short_enough(midpoint) {
            upper = midpoint;
        } else {
            lower = midpoint;
        }
    }
    Some(libm::pow(10.0, upper))
}

fn spread_for(
    sample_rate: f64,
    fundamental_hz: f64,
    mass: f64,
    exponent: f64,
    string_impedance: f64,
    target: f64,
) -> Option<(Felt, f64)> {
    let stiffness = stiffness_for(
        sample_rate,
        fundamental_hz,
        mass,
        exponent,
        string_impedance,
        target,
    )?;
    let felt = Felt {
        mass,
        stiffness,
        exponent,
    };
    let soft = contact_time(
        sample_rate,
        fundamental_hz,
        felt,
        string_impedance,
        PIANISSIMO,
    )?;
    let hard = contact_time(
        sample_rate,
        fundamental_hz,
        felt,
        string_impedance,
        FORTISSIMO,
    )?;
    Some((felt, soft / hard))
}

/// The hammer for `midi` at `sample_rate` Hz, fitted to its contact time
/// and spread. Where no mass gives the spread exactly (the spread can jump
/// as contact pulses appear), the grid mass closest to it.
#[must_use]
pub(crate) fn fit(sample_rate: f64, midi: u8) -> Option<Felt> {
    let (fundamental_hz, felt_exponent, string_impedance, target) = (
        frequency(midi),
        exponent(midi),
        impedance(midi),
        contact_target(midi),
    );
    let mass_at = |step: f64| MASS_FROM * libm::pow(2.0, 0.5 * step);
    let spread_at = |step: f64| {
        spread_for(
            sample_rate,
            fundamental_hz,
            mass_at(step),
            felt_exponent,
            string_impedance,
            target,
        )
    };
    let grid: Vec<(f64, Option<(Felt, f64)>)> = (0..MASS_STEPS)
        .map(f64::from)
        .map(|step| (step, spread_at(step)))
        .collect();
    // The spread falls as the hammer gets heavier: the first pair that
    // straddles the target.
    let straddle = grid.windows(2).find_map(|pair| match pair {
        [
            (light, Some((_, light_spread))),
            (heavy, Some((_, heavy_spread))),
        ] if *light_spread >= SPREAD && *heavy_spread < SPREAD => Some((*light, *heavy)),
        _ => None,
    });
    let Some((mut light, mut heavy)) = straddle else {
        return grid
            .iter()
            .filter_map(|(_, fitted)| *fitted)
            .min_by(|first, second| {
                (first.1 - SPREAD)
                    .abs()
                    .total_cmp(&(second.1 - SPREAD).abs())
            })
            .map(|(felt, _)| felt);
    };
    let mut best = None;
    for _ in 0..MASS_BISECTIONS {
        let midpoint = f64::midpoint(light, heavy);
        match spread_at(midpoint) {
            Some((felt, spread)) => {
                best = Some(felt);
                if spread >= SPREAD {
                    light = midpoint;
                } else {
                    heavy = midpoint;
                }
            }
            None => heavy = midpoint,
        }
    }
    best.or_else(|| spread_at(light).map(|(felt, _)| felt))
}

/// Polynomial degree of the smoothing.
const DEGREE: usize = 3;

/// The least-squares cubics through `fits` in `log M` and `log K` against
/// [`key_coordinate`]: coefficients, constant term first.
pub(super) fn smooth(fits: &[(u8, Felt)]) -> Option<([f64; DEGREE + 1], [f64; DEGREE + 1])> {
    let cubic = |value: &dyn Fn(Felt) -> f64| -> Option<[f64; DEGREE + 1]> {
        let mut system = vec![vec![0.0; DEGREE + 2]; DEGREE + 1];
        for &(key, felt) in fits {
            let coordinate = key_coordinate(key);
            let powers: Vec<f64> =
                core::iter::successors(Some(1.0), |power| Some(power * coordinate))
                    .take(DEGREE + 1)
                    .collect();
            for (row, &row_power) in system.iter_mut().zip(&powers) {
                for (cell, &column_power) in row.iter_mut().zip(&powers) {
                    *cell += row_power * column_power;
                }
                if let Some(right_side) = row.last_mut() {
                    *right_side += row_power * value(felt);
                }
            }
        }
        let coefficients = crate::solve::solve(&mut system)?;
        coefficients.try_into().ok()
    };
    Some((
        cubic(&|felt| libm::log(felt.mass))?,
        cubic(&|felt| libm::log(felt.stiffness))?,
    ))
}
