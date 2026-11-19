//! The cheap model of a blow (`docs/14-piano.md`): the hammer against the
//! string's near end only. The wave launched toward the nut comes back
//! inverted after `STRIKE / f₀` (the round trip over an eighth of the
//! string), which is what throws the hammer off in the bass (4.5 ms at
//! A0). The far end's return comes later than any contact. `fit` fits the
//! hammers on it; the tests measure the full waveguide's contacts.

use super::keys::STRIKE;
use super::{Felt, Hammer};
use math::convert::{f64_to_usize, samples, usize_to_f64};

/// The longest blow simulated, s: past every measured contact.
const LONGEST: f64 = 0.05;

/// How long a hammer with `felt`, at `velocity`, stays on a string of
/// impedance `string_impedance` and pitch `fundamental_hz` with only its
/// near end, s: from the first touch to the last separation, interpolated
/// within the sample. `None` if it hasn't left within 50 ms.
#[must_use]
pub(crate) fn contact_time(
    sample_rate: f64,
    fundamental_hz: f64,
    felt: Felt,
    string_impedance: f64,
    velocity: f64,
) -> Option<f64> {
    contact_within(
        sample_rate,
        fundamental_hz,
        felt,
        string_impedance,
        velocity,
        LONGEST,
    )
}

/// [`contact_time`], giving up (`None`) once the blow outlasts `longest`
/// s: the fit only asks whether a blow is short enough.
pub(super) fn contact_within(
    sample_rate: f64,
    fundamental_hz: f64,
    felt: Felt,
    string_impedance: f64,
    velocity: f64,
    longest: f64,
) -> Option<f64> {
    let mut hammer = Hammer::new(felt, string_impedance, sample_rate, velocity)?;
    let lag = f64_to_usize(libm::round(STRIKE * sample_rate / fundamental_hz))?.max(1);
    let steps = samples(longest, sample_rate)? + 1;
    // What was launched toward the nut, `lag` samples back: a ring.
    let mut history = vec![0.0; lag];
    let mut last_separation = 0.0;
    // The compression at the end of the last sample, if the felt was
    // still compressed then (else 0).
    let mut previous = 0.0_f64;
    for step in 0..steps {
        let slot = step % lag;
        let returning = history.get(slot).copied().unwrap_or(0.0);
        let launched = hammer.step(-returning);
        if let Some(entry) = history.get_mut(slot) {
            *entry = launched;
        }
        let compression = hammer.compression();
        let sample = usize_to_f64(step);
        // Separated during this sample: where the compression crossed 0.
        // The compression, not `force() > 0`: the force is the sample's
        // mean, still positive in the sample where the compression crosses
        // 0, so testing it never interpolated. A blow always ends here: the
        // hammer retires only once the felt is uncompressed.
        if compression <= 0.0 && previous > 0.0 {
            last_separation = sample + previous / (previous - compression);
        }
        previous = compression.max(0.0);
        if hammer.retired() {
            let duration = last_separation / sample_rate;
            return (duration <= longest).then_some(duration);
        }
    }
    None
}
