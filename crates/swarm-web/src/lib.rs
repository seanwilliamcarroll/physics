//! Wasm shell for the swarm track (S1): raw `extern "C"` exports over a
//! [`SwarmDemo`](demo::SwarmDemo). Logic lives in `demo`, tested natively;
//! `exports` is the boundary, as in the other web crates. The panic hook
//! and `FixedStep` come from `web-common`. Built with `simd128`
//! (`cargo xtask site`; `docs/15-swarm.md`, S1.4).

pub mod abi;
pub mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
