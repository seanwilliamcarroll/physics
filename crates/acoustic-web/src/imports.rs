//! Functions JS provides to the module, and the panic hook that uses them,
//! as in the `web` crate. The worklet provides `env.console_error`.
//! Natively (tests) there's no JS, so this is a no-op.

#[cfg(target_arch = "wasm32")]
mod wasm {
    use std::sync::Once;

    #[link(wasm_import_module = "env")]
    unsafe extern "C" {
        /// Decodes `len` UTF-8 bytes at `ptr` in wasm memory and passes
        /// them to `console.error`.
        fn console_error(ptr: *const u8, len: usize);
    }

    static INSTALL: Once = Once::new();

    /// Sends a panic's message to the browser console before the module
    /// traps (with `panic = "abort"`, JS would otherwise see only
    /// `RuntimeError: unreachable`).
    pub(crate) fn install_panic_hook() {
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
pub(crate) use wasm::install_panic_hook;

/// Native: nothing to install (std's default hook prints to stderr).
#[cfg(not(target_arch = "wasm32"))]
pub(crate) const fn install_panic_hook() {}
