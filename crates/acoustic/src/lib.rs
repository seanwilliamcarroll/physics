//! Physical-modeling sound synthesis, the acoustic track
//! (`docs/12-acoustic-foundations.md`): a Karplus–Strong string (A1), and
//! the measurements that check it, offline.
//!
//! Generic over [`Scalar`]: `f32` at run time (the audio worklet), `f32`
//! and `f64` in tests. Independent of the physics engine; shares only
//! `math`.

pub mod body;
mod bridge;
mod delay_line;
mod dispersion;
mod excitation;
pub mod fft;
pub mod hammer;
pub mod measure;
mod solve;
mod stiffness;
mod string;
pub mod unison;
mod voices;
mod voicing;
mod waveguide;

pub use delay_line::DelayLine;
pub use excitation::Excitation;
pub use math::Scalar;
pub use stiffness::inharmonicity;
pub use string::KsString;
pub use voices::{DEFAULT_GAIN, LOWEST_HZ, Model, RELEASE_T60, VOICES, Voices};
pub use voicing::{Decay, Voicing};
pub use waveguide::{DEFAULT_PICKUP, Waveguide};
