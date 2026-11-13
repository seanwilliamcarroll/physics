//! Wasm shell for the swarm track: raw `extern "C"` exports over a
//! [`SwarmDemo`](demo::SwarmDemo) (S1's boids), a
//! [`VicsekDemo`](vicsek_demo::VicsekDemo) (S2), an
//! [`AntDemo`](ant_demo::AntDemo) (S3, S5) and a
//! [`SlimeDemo`](slime_demo::SlimeDemo) (S4). Logic lives in the demos, tested natively;
//! `exports` is the boundary, as in the other web crates. The panic hook
//! and `FixedStep` come from `web-common`. Built with `simd128`
//! (`cargo xtask site`; `docs/15-swarm.md`, S1.4).

pub mod abi;
pub mod ant_demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod ant_exports;
pub mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
pub mod slime_demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod slime_exports;
pub mod vicsek_demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod vicsek_exports;
