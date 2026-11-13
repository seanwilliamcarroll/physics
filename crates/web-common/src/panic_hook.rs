//! The panic hook and the import it uses (`env.console_error`, which every
//! page's loader provides). With the `*-web` crates' `exports`, the only
//! `unsafe` code in the workspace: `exports` is JS calling in, this is
//! Rust calling out.
//!
//! Imports exist only on wasm. Native builds (tests, the native cdylib)
//! have no JS to link against, so everything here is `cfg`-gated and
//! `install_panic_hook` is a no-op natively (std's default hook already
//! prints to stderr there).

#[cfg(target_arch = "wasm32")]
mod wasm {
    use std::sync::Once;

    // Provided by each module's loader (`site/js/engine-loader.ts`, the synth
    // worklet) under the default import module, "env".
    #[link(wasm_import_module = "env")]
    unsafe extern "C" {
        /// Decodes `len` UTF-8 bytes at `ptr` in wasm memory and passes
        /// them to `console.error`.
        fn console_error(ptr: *const u8, len: usize);
    }

    static INSTALL: Once = Once::new();

    /// With `panic = "abort"`, a wasm panic reaches JS as a bare
    /// `RuntimeError: unreachable`. The hook runs first, so it can send the
    /// message and location ("panicked at src/x.rs:1:2:\n<message>") to the
    /// browser console before the module traps.
    pub fn install_panic_hook() {
        INSTALL.call_once(|| {
            std::panic::set_hook(Box::new(|info| {
                let text = info.to_string();
                // SAFETY: `text` is a live, valid UTF-8 buffer for the whole
                // call; JS only reads `len` bytes at `ptr` and keeps no
                // reference after returning.
                unsafe { console_error(text.as_ptr(), text.len()) };
            }));
        });
    }
}

#[cfg(target_arch = "wasm32")]
pub use wasm::install_panic_hook;

/// Native: nothing to install (std's default hook prints to stderr).
#[cfg(not(target_arch = "wasm32"))]
pub const fn install_panic_hook() {}
