//! The C-ABI surface JS calls. Each export is a thin adapter over [`Demo`];
//! all `unsafe` in the workspace lives in this file.
//!
//! Handles are opaque `*mut Demo` from `Box::into_raw`, so several demos can
//! coexist on one page. Wasm is single-threaded and JS never holds a Rust
//! reference, so a live handle is never aliased during a call.
//!
//! The exports are `pub(crate)`, not `pub`: what puts a function in the
//! `.wasm`'s export table is `#[no_mangle]` in a `cdylib`, not Rust
//! visibility, and `unreachable_pub` asks visibility to say only what
//! Rust code can reach.
//!
//! One file per group (`exports/{lifecycle, settings, readouts, drag,
//! collisions}.rs`);
//! the `unsafe_code` expectation on `mod exports` in `lib.rs` covers them.

mod collisions;
mod drag;
mod lifecycle;
mod readouts;
mod settings;

#[cfg(test)]
mod tests;
