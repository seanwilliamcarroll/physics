//! The panic hook and the `env.console_error` import it calls. Imports exist
//! only on wasm, so natively `install_panic_hook` is a no-op (std's hook
//! prints to stderr).

#[cfg(target_arch = "wasm32")]
mod wasm {
    use std::sync::Once;

    #[link(wasm_import_module = "env")]
    unsafe extern "C" {
        fn console_error(ptr: *const u8, len: usize);
    }

    static INSTALL: Once = Once::new();

    /// With `panic = "abort"` a wasm panic reaches JS as a bare
    /// `RuntimeError: unreachable`; the hook logs the message first.
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

#[cfg(not(target_arch = "wasm32"))]
pub const fn install_panic_hook() {}
