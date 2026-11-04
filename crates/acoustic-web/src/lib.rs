//! Wasm shell for the acoustic track: raw `extern "C"` exports over a
//! [`Synth`](synth::Synth), the audio worklet's whole interface
//! (`docs/12-acoustic-foundations.md`). Logic lives in `synth`, tested
//! natively; `exports` is the boundary, as in the `web` crate.

pub mod abi;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
// Only wasm builds contain unsafe here (the import call).
#[cfg_attr(
    target_arch = "wasm32",
    expect(
        unsafe_code,
        reason = "calling a JS import with a pointer into wasm memory"
    )
)]
mod imports;
pub mod synth;
