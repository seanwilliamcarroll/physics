use super::{allpass_coefficient, phase_delay_lowpass};

fn allpass_delay(coefficient: f64, omega: f64) -> f64 {
    // H = (C + e^{−jω}) / (1 + C e^{−jω}); delay = −arg H / ω.
    let (numerator_re, numerator_im) = (coefficient + omega.cos(), -omega.sin());
    let (denominator_re, denominator_im) =
        (1.0 + coefficient * omega.cos(), -coefficient * omega.sin());
    let argument = numerator_im.atan2(numerator_re) - denominator_im.atan2(denominator_re);
    -argument / omega
}

#[test]
fn the_allpass_delays_exactly_the_fraction_at_its_frequency() {
    for (fraction, omega) in [(0.1, 0.01), (0.5, 0.3), (1.05, 1.5), (0.7, 2.5)] {
        let coefficient = allpass_coefficient(fraction, omega);
        let delay = allpass_delay(coefficient, omega);
        assert!(
            (delay - fraction).abs() < 1e-12,
            "Δ {fraction} at {omega}: {delay}"
        );
    }
    // Low frequencies: Jaffe & Smith's formula.
    let coefficient = allpass_coefficient(0.4, 1e-6);
    assert!((coefficient - 0.6 / 1.4).abs() < 1e-9, "{coefficient}");
}

#[test]
fn the_classic_average_delays_half_a_sample_at_every_frequency() {
    for omega in [0.01, 0.5, 1.0, 2.0, 3.0] {
        assert!(
            (phase_delay_lowpass(0.5, omega) - 0.5).abs() < 1e-12,
            "{omega}"
        );
    }
}
