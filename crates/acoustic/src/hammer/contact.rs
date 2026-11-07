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
/// impedance `z` and pitch `f0` with only its near end (the cheap
/// model), s: from the first touch to the last separation, interpolated
/// within the sample. `None` if it hasn't left within 50 ms.
#[must_use]
pub fn contact_time(fs: f64, f0: f64, felt: Felt, z: f64, velocity: f64) -> Option<f64> {
    contact_within(fs, f0, felt, z, velocity, LONGEST)
}

/// [`contact_time`], giving up (`None`) once the blow outlasts `longest`
/// s: the fit only asks whether a blow is short enough.
pub(super) fn contact_within(
    fs: f64,
    f0: f64,
    felt: Felt,
    z: f64,
    velocity: f64,
    longest: f64,
) -> Option<f64> {
    let mut hammer = Hammer::new(felt, z, fs, velocity)?;
    let lag = f64_to_usize(libm::round(STRIKE * fs / f0))?.max(1);
    let steps = samples(longest, fs)? + 1;
    // What was launched toward the nut, `lag` samples back: a ring.
    let mut history = vec![0.0; lag];
    let mut last = 0.0;
    // The compression at the end of the last sample, if the felt was
    // still compressed then (else 0).
    let mut previous = 0.0_f64;
    for n in 0..steps {
        let slot = n % lag;
        let back = history.get(slot).copied().unwrap_or(0.0);
        let launched = hammer.step(-back);
        if let Some(h) = history.get_mut(slot) {
            *h = launched;
        }
        let c = hammer.compression();
        let t = usize_to_f64(n);
        // Separated during this sample: where the compression crossed 0.
        // The compression, not `force() > 0`: the force is the sample's
        // mean, still positive in the sample where the compression crosses
        // 0, so testing it never interpolated (every contact ran to the
        // next whole sample; found by cargo-mutants). A blow always ends
        // here: the hammer retires only once the felt is uncompressed.
        if c <= 0.0 && previous > 0.0 {
            last = t + previous / (previous - c);
        }
        previous = c.max(0.0);
        if hammer.retired() {
            return (last / fs <= longest).then_some(last / fs);
        }
    }
    None
}
