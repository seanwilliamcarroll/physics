//! Wasm shell for the falling-sand automaton (M9): raw `extern "C"`
//! exports over a [`SandDemo`](demo::SandDemo). Logic lives in `demo`,
//! tested natively; `exports` is the boundary, as in `engine-web` and
//! `acoustic-web`. The panic hook and `FixedStep` come from `web-common`.

pub mod abi;
pub mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
