//! Wasm shell for the swarm track: raw `extern "C"` exports over the
//! demos in `swarm-view`: a [`SwarmDemo`](demo::SwarmDemo) (S1's boids),
//! a [`VicsekDemo`](vicsek_demo::VicsekDemo) (S2), an
//! [`AntDemo`](ant_demo::AntDemo) (S3, S5) and a
//! [`SlimeDemo`](slime_demo::SlimeDemo) (S4). The logic and drawing live
//! there, tested and benchmarked natively; this crate is only the
//! boundary, as in the other web crates. The panic hook and `FixedStep`
//! come from `web-common`. Built with `simd128` (`cargo xtask site`;
//! `docs/15-swarm.md`, S1.4).

pub use swarm_view::{abi, ant_demo, demo, slime_demo, vicsek_demo};

#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod ant_exports;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod slime_exports;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod vicsek_exports;
