use super::{allpass_coefficient, phase_delay_lowpass};

/// The allpass's phase delay at `w`, from its frequency response.
fn allpass_delay(c: f64, w: f64) -> f64 {
    // H = (C + e^{−jw}) / (1 + C e^{−jw}); delay = −arg H / w.
    let (re_n, im_n) = (c + w.cos(), -w.sin());
    let (re_d, im_d) = (1.0 + c * w.cos(), -c * w.sin());
    let arg = im_n.atan2(re_n) - im_d.atan2(re_d);
    -arg / w
}

#[test]
fn the_allpass_delays_exactly_the_fraction_at_its_frequency() {
    for (fraction, w) in [(0.1, 0.01), (0.5, 0.3), (1.05, 1.5), (0.7, 2.5)] {
        let c = allpass_coefficient(fraction, w);
        let got = allpass_delay(c, w);
        assert!((got - fraction).abs() < 1e-12, "Δ {fraction} at {w}: {got}");
    }
    // Low frequencies: Jaffe & Smith's formula.
    let c = allpass_coefficient(0.4, 1e-6);
    assert!((c - 0.6 / 1.4).abs() < 1e-9, "{c}");
}

#[test]
fn the_classic_average_delays_half_a_sample_at_every_frequency() {
    for w in [0.01, 0.5, 1.0, 2.0, 3.0] {
        assert!((phase_delay_lowpass(0.5, w) - 0.5).abs() < 1e-12, "{w}");
    }
}
