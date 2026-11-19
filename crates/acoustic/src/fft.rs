//! [`Fft`]: a radix-2 FFT we write ourselves, and [`Spectrum`], which turns
//! a block of samples into dB magnitudes (`docs/13-waveguide.md`, "The
//! spectrum").

use core::f64::consts::TAU;
use math::convert::usize_to_f64;

use crate::Scalar;

/// A forward FFT of one power-of-two size: radix-2 Cooley–Tukey (1965),
/// in place and iterative (a bit-reversal permutation, then `log₂ n`
/// passes of butterflies).
///
/// Everything size-dependent (twiddle factors, the bit-reversal table) is
/// computed once in [`new`](Self::new), so [`forward`](Self::forward)
/// never allocates: the audio thread's rule. Twiddles come from `libm`, so
/// they're the same bits on every platform.
#[derive(Clone, Debug)]
pub struct Fft<S> {
    size: usize,
    /// `e^(−2πik/n)` for `k < n/2`, as `(cos, sin)`.
    twiddles: Vec<(S, S)>,
    /// Each index's bit reversal (`log₂ n` bits).
    reversed: Vec<usize>,
}

impl<S: Scalar> Fft<S> {
    /// An FFT of `size` points; `None` unless `size` is a power of two, at
    /// least 2.
    #[must_use]
    pub fn new(size: usize) -> Option<Self> {
        if size < 2 || !size.is_power_of_two() {
            return None;
        }
        let bits = size.trailing_zeros();
        let twiddles = (0..size / 2)
            .map(|index| {
                let angle = -TAU * usize_to_f64(index) / usize_to_f64(size);
                (S::from_f64(libm::cos(angle)), S::from_f64(libm::sin(angle)))
            })
            .collect();
        let reversed = (0..size)
            .map(|index| index.reverse_bits() >> (usize::BITS - bits))
            .collect();
        Some(Self {
            size,
            twiddles,
            reversed,
        })
    }

    /// The size.
    #[must_use]
    pub const fn len(&self) -> usize {
        self.size
    }

    /// Never true: an FFT has at least 2 points.
    #[must_use]
    pub const fn is_empty(&self) -> bool {
        self.size == 0
    }

    /// Transforms `(real, imaginary)` in place: `X[k] = Σ x[t] e^(−2πikt/n)`,
    /// no scaling. `false`, changing nothing, unless both have `n` samples.
    pub fn forward(&self, real: &mut [S], imaginary: &mut [S]) -> bool {
        if real.len() != self.size || imaginary.len() != self.size {
            return false;
        }
        for (index, &partner) in self.reversed.iter().enumerate() {
            if partner > index {
                real.swap(index, partner);
                imaginary.swap(index, partner);
            }
        }
        let mut block_length = 2;
        while block_length <= self.size {
            let half = block_length / 2;
            let twiddle_stride = self.size / block_length;
            for (real_block, imaginary_block) in real
                .chunks_exact_mut(block_length)
                .zip(imaginary.chunks_exact_mut(block_length))
            {
                let (real_lower, real_upper) = real_block.split_at_mut(half);
                let (imaginary_lower, imaginary_upper) = imaginary_block.split_at_mut(half);
                let butterflies = real_lower
                    .iter_mut()
                    .zip(imaginary_lower.iter_mut())
                    .zip(real_upper.iter_mut().zip(imaginary_upper.iter_mut()));
                for (
                    ((lower_real, lower_imaginary), (upper_real, upper_imaginary)),
                    &(twiddle_real, twiddle_imaginary),
                ) in butterflies.zip(self.twiddles.iter().step_by(twiddle_stride))
                {
                    let rotated_real =
                        twiddle_real * *upper_real - twiddle_imaginary * *upper_imaginary;
                    let rotated_imaginary =
                        twiddle_real * *upper_imaginary + twiddle_imaginary * *upper_real;
                    *upper_real = *lower_real - rotated_real;
                    *upper_imaginary = *lower_imaginary - rotated_imaginary;
                    *lower_real += rotated_real;
                    *lower_imaginary += rotated_imaginary;
                }
            }
            block_length *= 2;
        }
        true
    }
}

/// The quietest level [`Spectrum`] reports, dB: silence (and rounding)
/// floors here instead of going to −∞.
pub(crate) const FLOOR_DB: f64 = -200.0;

/// Turns `n` samples into `n / 2` magnitudes in dB (0 dB = a full-scale
/// sine in its bin): a Hann window, an [`Fft`], and the single-sided
/// amplitude, `|X| · 2 / (n · ½)` (the window's average is ½). All its
/// buffers are allocated in [`new`](Self::new).
#[derive(Clone, Debug)]
pub struct Spectrum<S> {
    fft: Fft<S>,
    window: Vec<S>,
    real: Vec<S>,
    imaginary: Vec<S>,
    levels_db: Vec<S>,
}

impl<S: Scalar> Spectrum<S> {
    /// An analyzer for `size` samples (a power of two, at least 2).
    #[must_use]
    pub fn new(size: usize) -> Option<Self> {
        let fft = Fft::new(size)?;
        let window = (0..size)
            .map(|index| {
                S::from_f64(0.5 - 0.5 * libm::cos(TAU * usize_to_f64(index) / usize_to_f64(size)))
            })
            .collect();
        Some(Self {
            fft,
            window,
            real: vec![S::ZERO; size],
            imaginary: vec![S::ZERO; size],
            levels_db: vec![S::ZERO; size / 2],
        })
    }

    /// The magnitudes the last [`analyze`](Self::analyze) computed (zeros
    /// before the first).
    #[must_use]
    pub fn last(&self) -> &[S] {
        &self.levels_db
    }

    /// The dB magnitudes of `signal` (exactly `n` samples), bin `k` at
    /// `k · sample_rate / n` Hz; `None` for the wrong length.
    pub fn analyze(&mut self, signal: &[S]) -> Option<&[S]> {
        if signal.len() != self.fft.len() {
            return None;
        }
        for (((real, imaginary), &sample), &window) in self
            .real
            .iter_mut()
            .zip(&mut self.imaginary)
            .zip(signal)
            .zip(&self.window)
        {
            *real = sample * window;
            *imaginary = S::ZERO;
        }
        self.fft.forward(&mut self.real, &mut self.imaginary);
        let scale = 4.0 / usize_to_f64(self.fft.len());
        for ((level_db, real), imaginary) in self
            .levels_db
            .iter_mut()
            .zip(&self.real)
            .zip(&self.imaginary)
        {
            let amplitude =
                (real.to_f64() * real.to_f64() + imaginary.to_f64() * imaginary.to_f64()).sqrt()
                    * scale;
            let level = if amplitude > 0.0 {
                20.0 * libm::log10(amplitude)
            } else {
                FLOOR_DB
            };
            *level_db = S::from_f64(level.max(FLOOR_DB));
        }
        Some(&self.levels_db)
    }
}

#[cfg(test)]
mod tests;
