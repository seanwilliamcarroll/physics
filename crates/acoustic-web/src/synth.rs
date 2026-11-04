//! [`Synth`]: the voices plus the page's settings, and the buffers the
//! worklet reads. Safe Rust, tested natively.

use acoustic::{DEFAULT_GAIN, Decay, Excitation, Voices, Voicing};

use crate::abi::{EXCITATION_NOISE, EXCITATION_TRIANGLE};

/// The most frames one [`Synth::render`] call produces: the output buffer
/// is allocated once at this size (no allocation on the audio thread).
/// 128 is the Web Audio default render quantum; `renderSizeHint` can ask
/// for more, and 4096 leaves room (a larger request is refused, not
/// allocated).
pub const MAX_FRAMES: usize = 4096;

/// A new synth's settings: tuned, a 3 s decay, noise.
pub const DEFAULT_T60: f64 = 3.0;

/// Where the triangle peaks by default: near one end, as the Piano Gloves
/// hammer did.
pub const DEFAULT_PEAK: f64 = 0.1;

/// Everything one audio worklet runs: [`Voices`] at the context's rate,
/// how the next notes are voiced and plucked, and two buffers JS reads.
#[derive(Debug)]
pub struct Synth {
    voices: Voices<f32>,
    voicing: Voicing,
    excitation: Excitation,
    /// The last render's samples (`MAX_FRAMES` long; the first `frames`
    /// are valid).
    out: Vec<f32>,
    /// The latest string's delay line, oldest first: what the page draws.
    snapshot: Vec<f32>,
}

impl Synth {
    /// A silent synth at `fs` Hz, noise seeded by `seed`. `None` for a rate
    /// that isn't positive and finite.
    #[must_use]
    pub fn new(fs: f64, seed: u64) -> Option<Self> {
        let voices = Voices::new(fs, seed)?;
        // The longest line: A0. Sized once, like the output.
        let longest = acoustic::KsString::<f32>::new(
            fs,
            acoustic::LOWEST_HZ,
            Voicing {
                tuned: false,
                decay: Decay::Loss(1.0),
            },
        )?
        .delay()
            + 1;
        Some(Self {
            voices,
            voicing: Voicing {
                tuned: true,
                decay: Decay::T60(DEFAULT_T60),
            },
            excitation: Excitation::Noise,
            out: vec![0.0; MAX_FRAMES],
            snapshot: Vec::with_capacity(longest),
        })
    }

    /// Renders `frames` samples into the output buffer and returns them;
    /// `None` (rendering nothing) above [`MAX_FRAMES`].
    pub fn render(&mut self, frames: usize) -> Option<&[f32]> {
        let out = self.out.get_mut(..frames)?;
        self.voices.render(out);
        Some(out)
    }

    /// Plays MIDI `key` with the current settings; `false` if it can't be
    /// played (below A0, or not a MIDI key).
    pub fn note_on(&mut self, key: u32) -> bool {
        u8::try_from(key)
            .is_ok_and(|k| k <= 127 && self.voices.note_on(k, self.voicing, self.excitation))
    }

    /// Releases MIDI `key`.
    pub fn note_off(&mut self, key: u32) {
        if let Ok(k) = u8::try_from(key) {
            self.voices.note_off(k);
        }
    }

    /// Tuned (the allpass) or the integer loop, from the next note.
    pub const fn set_tuned(&mut self, tuned: bool) {
        self.voicing.tuned = tuned;
    }

    /// The fundamental's decay time, s, from the next note. `false` unless
    /// positive and finite.
    pub fn set_t60(&mut self, t60: f64) -> bool {
        let ok = t60 > 0.0 && t60.is_finite();
        if ok {
            self.voicing.decay = Decay::T60(t60);
        }
        ok
    }

    /// The excitation from the next note: a code from [`crate::abi`], and
    /// the triangle's peak (a fraction of the line; ignored for noise).
    /// `false` for an unknown code or a peak outside `(0, 1)`.
    pub fn set_excitation(&mut self, code: u32, peak: f64) -> bool {
        let e = match code {
            EXCITATION_NOISE => Excitation::Noise,
            EXCITATION_TRIANGLE if peak > 0.0 && peak < 1.0 => Excitation::Triangle { peak },
            _ => return false,
        };
        self.excitation = e;
        true
    }

    /// Output gain, applied before the ±1 clamp. `false` unless `0 ≤ gain
    /// ≤ 1` (more would only clip).
    pub fn set_gain(&mut self, gain: f64) -> bool {
        let ok = (0.0..=1.0).contains(&gain);
        if ok {
            #[expect(
                clippy::cast_possible_truncation,
                reason = "a gain in [0, 1]; f32 is the output's precision"
            )]
            self.voices.set_gain(gain as f32);
        }
        ok
    }

    /// Copies the latest string's delay line into the snapshot buffer and
    /// returns it (empty before any note).
    pub fn snapshot(&mut self) -> &[f32] {
        self.snapshot.clear();
        if let Some(s) = self.voices.latest() {
            self.snapshot.extend(s.samples());
        }
        &self.snapshot
    }

    /// Where the snapshot's samples are (for the C ABI).
    #[must_use]
    pub fn snapshot_ptr(&self) -> *const f32 {
        self.snapshot.as_ptr()
    }

    /// Samples clamped to ±1 so far.
    #[must_use]
    pub const fn clipped(&self) -> u64 {
        self.voices.clipped()
    }

    /// Voices sounding.
    #[must_use]
    pub fn sounding(&self) -> usize {
        self.voices.sounding()
    }
}

/// The default gain, for the page's slider.
pub const GAIN: f64 = DEFAULT_GAIN;

#[cfg(test)]
mod tests;
