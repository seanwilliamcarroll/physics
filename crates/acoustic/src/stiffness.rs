//! The inharmonicity coefficient `B` along the keyboard
//! (`docs/14-piano.md`, "`B` across the keyboard"): Rigaud, David & Daudet
//! (2011)'s two lines in `log B`, one per bridge,
//! `B(m) = e^(s_B m + y_B) + e^(s_T m + y_T)`.

/// The treble line, as measured (the same for every piano).
const TREBLE_SLOPE: f64 = 9.26e-2;
const TREBLE_INTERCEPT: f64 = -13.64;

/// The bass line, **our choice**: through A0 = 2 · 10⁻⁴ (a Steinway grand,
/// Ortiz-Berenguer et al. 2004), meeting the treble line at C2.
const BASS_SLOPE: f64 = -0.1193;
const BASS_INTERCEPT: f64 = -6.012;

/// `B` for MIDI key `midi` (21 is A0, 108 is C8).
#[must_use]
pub fn inharmonicity(midi: u8) -> f64 {
    let m = f64::from(midi);
    libm::exp(BASS_SLOPE * m + BASS_INTERCEPT) + libm::exp(TREBLE_SLOPE * m + TREBLE_INTERCEPT)
}

#[cfg(test)]
mod tests;
