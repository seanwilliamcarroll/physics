//! Physical-modeling sound synthesis, the acoustic track
//! (`docs/12-acoustic-foundations.md`): a Karplus–Strong string (A1), and
//! the measurements that check it, offline.
//!
//! Generic over [`Scalar`]: `f32` at run time (the audio worklet), `f32`
//! and `f64` in tests. Independent of the physics engine; shares only
//! `math`.

mod delay_line;
mod excitation;
pub mod measure;
mod string;
mod voices;

pub use delay_line::DelayLine;
pub use excitation::Excitation;
pub use math::Scalar;
pub use string::{Decay, KsString, Voicing};
pub use voices::{DEFAULT_GAIN, LOWEST_HZ, RELEASE_T60, VOICES, Voices};
