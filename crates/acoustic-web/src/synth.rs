//! [`Synth`]: the voices plus the page's settings, and the buffers the
//! worklet reads. Safe Rust, tested natively.

use acoustic::fft::Spectrum;
use acoustic::{DEFAULT_GAIN, Decay, Excitation, Model, Voices, Voicing};

use crate::abi::{EXCITATION_NOISE, EXCITATION_TRIANGLE, MODEL_LOOP, MODEL_PIANO, MODEL_WAVEGUIDE};

/// The most frames one [`Synth::render`] call produces: the output buffer
/// is allocated once at this size (no allocation on the audio thread).
/// 128 is the Web Audio default render quantum; `renderSizeHint` can ask
/// for more, and 4096 leaves room (a larger request is refused, not
/// allocated).
pub const MAX_FRAMES: usize = 4096;

/// The spectrum's size, samples: 4096 at 48 kHz is 85 ms of output and
/// 11.7 Hz per bin (`docs/13-waveguide.md`, "The spectrum").
pub const SPECTRUM_SIZE: usize = 4096;

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
    /// The latest strike's hammer force, N, as `f32` (allocated once).
    trace: Vec<f32>,
    /// The last `SPECTRUM_SIZE` output samples (a ring; `history_at` is
    /// the oldest), a linear copy of them, and the analyzer: all
    /// allocated once.
    history: Vec<f32>,
    history_at: usize,
    linear: Vec<f32>,
    spectrum: Spectrum<f32>,
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
                inharmonicity: 0.0,
            },
        )?
        .delay()
            + 1;
        Some(Self {
            voices,
            voicing: Voicing {
                tuned: true,
                decay: Decay::T60(DEFAULT_T60),
                inharmonicity: 0.0,
            },
            excitation: Excitation::Noise,
            out: vec![0.0; MAX_FRAMES],
            snapshot: Vec::with_capacity(longest),
            #[expect(
                clippy::cast_possible_truncation,
                clippy::cast_sign_loss,
                reason = "a positive, small sample count (fs checked by Voices::new)"
            )]
            trace: Vec::with_capacity((acoustic::TRACE_SECONDS * fs).ceil() as usize),
            history: vec![0.0; SPECTRUM_SIZE],
            history_at: 0,
            linear: vec![0.0; SPECTRUM_SIZE],
            spectrum: Spectrum::new(SPECTRUM_SIZE)?,
        })
    }

    /// Renders `frames` samples into the output buffer and returns them;
    /// `None` (rendering nothing) above [`MAX_FRAMES`].
    pub fn render(&mut self, frames: usize) -> Option<&[f32]> {
        let out = self.out.get_mut(..frames)?;
        self.voices.render(out);
        for &x in out.iter() {
            if let Some(slot) = self.history.get_mut(self.history_at) {
                *slot = x;
            }
            self.history_at = (self.history_at + 1) % SPECTRUM_SIZE;
        }
        Some(out)
    }

    /// The last `SPECTRUM_SIZE` output samples' spectrum, dB (0 dB = a
    /// full-scale sine), `SPECTRUM_SIZE / 2` bins of `fs / SPECTRUM_SIZE`
    /// Hz. Computed now, on request (the A1 page never asks).
    pub fn spectrum(&mut self) -> &[f32] {
        let (newer, older) = self.history.split_at(self.history_at);
        for (dst, &x) in self.linear.iter_mut().zip(older.iter().chain(newer)) {
            *dst = x;
        }
        self.spectrum.analyze(&self.linear).unwrap_or_default()
    }

    /// The model new notes play: a code from [`crate::abi`]; `false` for an
    /// unknown one.
    pub fn set_model(&mut self, code: u32) -> bool {
        let model = match code {
            MODEL_LOOP => Model::Loop,
            MODEL_WAVEGUIDE => Model::Waveguide,
            MODEL_PIANO => Model::Piano,
            _ => return false,
        };
        self.voices.set_model(model);
        true
    }

    /// Every waveguide's pickup, from the bridge, live; `false` outside
    /// `[0, 1]` (or NaN).
    pub fn set_pickup(&mut self, s: f64) -> bool {
        let ok = (0.0..=1.0).contains(&s);
        if ok {
            self.voices.set_pickup(s);
        }
        ok
    }

    /// Plays MIDI `key` with the current settings; `false` if it can't be
    /// played (below A0, or not a MIDI key).
    pub fn note_on(&mut self, key: u32) -> bool {
        u8::try_from(key)
            .is_ok_and(|k| k <= 127 && self.voices.note_on(k, self.voicing, self.excitation))
    }

    /// Strikes piano key `key` with the hammer at `velocity` m/s (pp 0.5
    /// to ff 5), whatever the model; `false` off the keyboard or for a
    /// velocity that isn't positive and finite.
    pub fn note_on_velocity(&mut self, key: u32, velocity: f64) -> bool {
        u8::try_from(key).is_ok_and(|k| self.voices.strike(k, velocity))
    }

    /// Whether the piano's strings are stiff, from the next strike.
    pub const fn set_stiffness(&mut self, stiff: bool) {
        self.voices.set_stiffness(stiff);
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
        self.voices.latest_shape(&mut self.snapshot);
        &self.snapshot
    }

    /// Where the last spectrum's bins are (for the C ABI).
    #[must_use]
    pub fn spectrum_ptr(&self) -> *const f32 {
        self.spectrum.last().as_ptr()
    }

    /// Copies the latest strike's hammer force (N, a sample at a time from
    /// impact) into the trace buffer and returns it (empty before any
    /// strike).
    pub fn strike_trace(&mut self) -> &[f32] {
        self.trace.clear();
        #[expect(
            clippy::cast_possible_truncation,
            reason = "f32 is the page's precision"
        )]
        self.trace
            .extend(self.voices.strike_trace().iter().map(|&f| f as f32));
        &self.trace
    }

    /// Where the trace's samples are (for the C ABI).
    #[must_use]
    pub fn trace_ptr(&self) -> *const f32 {
        self.trace.as_ptr()
    }

    /// Where the snapshot's samples are (for the C ABI).
    #[must_use]
    pub fn snapshot_ptr(&self) -> *const f32 {
        self.snapshot.as_ptr()
    }

    /// How far the latest note's loop is from its pitch, cents (0 tuned);
    /// 0 before any note.
    #[must_use]
    pub fn latest_cents(&self) -> f64 {
        self.voices.latest_detune().unwrap_or(0.0)
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
