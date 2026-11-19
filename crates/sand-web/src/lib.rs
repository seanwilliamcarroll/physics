//! Wasm shell for the falling-sand automaton: raw `extern "C"`
//! exports over a [`SandDemo`](demo::SandDemo). Logic lives in `demo`,
//! tested natively; `exports` is the boundary.

pub mod abi;
pub mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
