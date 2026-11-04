//! [`Fft`]: a radix-2 FFT we write ourselves, and [`Spectrum`], which turns
//! a block of samples into dB magnitudes (`docs/13-waveguide.md`, "The
//! spectrum").

use core::f64::consts::TAU;

use crate::Scalar;

/// A forward FFT of one power-of-two size: radix-2 Cooley–Tukey (1965),
/// in place and iterative (a bit-reversal permutation, then `log₂ n`
/// passes of butterflies).
///
/// Everything size-dependent (twiddle factors, the bit-reversal table) is
/// computed once in [`new`](Self::new), so [`forward`](Self::forward)
/// never allocates: the audio thread's rule. Twiddles come from `libm`, so
/// they're the same bits on every platform (A1's reasoning).
#[derive(Clone, Debug)]
pub struct Fft<S> {
    n: usize,
    /// `e^(−2πik/n)` for `k < n/2`, as `(cos, sin)`.
    twiddles: Vec<(S, S)>,
    /// Each index's bit reversal (`log₂ n` bits).
    reversed: Vec<usize>,
}

impl<S: Scalar> Fft<S> {
    /// An FFT of `n` points; `None` unless `n` is a power of two, at least 2.
    #[must_use]
    pub fn new(n: usize) -> Option<Self> {
        if n < 2 || !n.is_power_of_two() {
            return None;
        }
        let bits = n.trailing_zeros();
        #[expect(clippy::cast_precision_loss, reason = "FFT sizes are far below 2^53")]
        let twiddles = (0..n / 2)
            .map(|k| {
                let a = -TAU * k as f64 / n as f64;
                (S::from_f64(libm::cos(a)), S::from_f64(libm::sin(a)))
            })
            .collect();
        let reversed = (0..n)
            .map(|i| i.reverse_bits() >> (usize::BITS - bits))
            .collect();
        Some(Self {
            n,
            twiddles,
            reversed,
        })
    }

    /// The size.
    #[must_use]
    pub const fn len(&self) -> usize {
        self.n
    }

    /// Never true: an FFT has at least 2 points.
    #[must_use]
    pub const fn is_empty(&self) -> bool {
        self.n == 0
    }

    /// Transforms `(re, im)` in place: `X[k] = Σ x[t] e^(−2πikt/n)`, no
    /// scaling. `false`, changing nothing, unless both have `n` samples.
    pub fn forward(&self, re: &mut [S], im: &mut [S]) -> bool {
        if re.len() != self.n || im.len() != self.n {
            return false;
        }
        for (i, &j) in self.reversed.iter().enumerate() {
            if j > i {
                re.swap(i, j);
                im.swap(i, j);
            }
        }
        let mut len = 2;
        while len <= self.n {
            let half = len / 2;
            let step = self.n / len;
            for (re, im) in re.chunks_exact_mut(len).zip(im.chunks_exact_mut(len)) {
                let (re_lo, re_hi) = re.split_at_mut(half);
                let (im_lo, im_hi) = im.split_at_mut(half);
                let butterflies = re_lo
                    .iter_mut()
                    .zip(im_lo.iter_mut())
                    .zip(re_hi.iter_mut().zip(im_hi.iter_mut()));
                for (((ar, ai), (br, bi)), &(wr, wi)) in
                    butterflies.zip(self.twiddles.iter().step_by(step))
                {
                    let tr = wr * *br - wi * *bi;
                    let ti = wr * *bi + wi * *br;
                    *br = *ar - tr;
                    *bi = *ai - ti;
                    *ar += tr;
                    *ai += ti;
                }
            }
            len *= 2;
        }
        true
    }
}

/// The quietest level [`Spectrum`] reports, dB: silence (and rounding)
/// floors here instead of going to −∞.
pub const FLOOR_DB: f64 = -200.0;

/// Turns `n` samples into `n / 2` magnitudes in dB (0 dB = a full-scale
/// sine in its bin): a Hann window, an [`Fft`], and the single-sided
/// amplitude, `|X| · 2 / (n · ½)` (the window's average is ½). All its
/// buffers are allocated in [`new`](Self::new).
#[derive(Clone, Debug)]
pub struct Spectrum<S> {
    fft: Fft<S>,
    window: Vec<S>,
    re: Vec<S>,
    im: Vec<S>,
    db: Vec<S>,
}

impl<S: Scalar> Spectrum<S> {
    /// An analyzer for `n` samples (a power of two, at least 2).
    #[must_use]
    pub fn new(n: usize) -> Option<Self> {
        let fft = Fft::new(n)?;
        #[expect(clippy::cast_precision_loss, reason = "FFT sizes are far below 2^53")]
        let window = (0..n)
            .map(|t| S::from_f64(0.5 - 0.5 * libm::cos(TAU * t as f64 / n as f64)))
            .collect();
        Some(Self {
            fft,
            window,
            re: vec![S::ZERO; n],
            im: vec![S::ZERO; n],
            db: vec![S::ZERO; n / 2],
        })
    }

    /// The dB magnitudes of `signal` (exactly `n` samples), bin `k` at
    /// `k fs / n` Hz; `None` for the wrong length.
    pub fn analyze(&mut self, signal: &[S]) -> Option<&[S]> {
        if signal.len() != self.fft.len() {
            return None;
        }
        for (((r, i), &x), &w) in self
            .re
            .iter_mut()
            .zip(&mut self.im)
            .zip(signal)
            .zip(&self.window)
        {
            *r = x * w;
            *i = S::ZERO;
        }
        self.fft.forward(&mut self.re, &mut self.im);
        #[expect(clippy::cast_precision_loss, reason = "FFT sizes are far below 2^53")]
        let scale = 4.0 / self.fft.len() as f64;
        for ((d, r), i) in self.db.iter_mut().zip(&self.re).zip(&self.im) {
            let amp = (r.to_f64() * r.to_f64() + i.to_f64() * i.to_f64()).sqrt() * scale;
            let level = if amp > 0.0 {
                20.0 * libm::log10(amp)
            } else {
                FLOOR_DB
            };
            *d = S::from_f64(level.max(FLOOR_DB));
        }
        Some(&self.db)
    }
}

#[cfg(test)]
mod tests;
