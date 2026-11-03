//! `cargo xtask serve`: build the site, then serve it with `tsc --watch`
//! running alongside, so editing a `.ts` file only needs a reload. Every
//! response says `Cache-Control: no-store` (`xtask/serve.py`). Rust
//! changes still need a rerun (it doesn't watch the wasm build).

use std::path::Path;
use std::process::{self, Child};

/// Python's `http.server` default, so links in the README work either way.
pub(crate) const DEFAULT_PORT: u16 = 8000;

/// A child process that's killed when this goes out of scope, including on
/// an early return: if the server fails to start, the watcher mustn't
/// outlive xtask.
struct KillOnDrop(Child);

impl Drop for KillOnDrop {
    fn drop(&mut self) {
        // Best effort: it may already have exited (e.g. after Ctrl-C).
        let _ = self.0.kill();
        let _ = self.0.wait();
    }
}

/// Builds the site, starts `tsc --watch`, then serves `site/` on `port`
/// until the server exits. Ctrl-C reaches every process in the terminal's
/// foreground group (cargo, xtask, tsc, python), so one press stops all.
pub(crate) fn serve(root: &Path, port: u16) -> Result<(), String> {
    super::site(root)?;

    let tsc = root.join("node_modules").join(".bin").join("tsc");
    let _watch = KillOnDrop(
        process::Command::new(&tsc)
            .current_dir(root)
            .args(["-p", "tsconfig.json", "--watch", "--preserveWatchOutput"])
            .spawn()
            .map_err(|e| format!("failed to start tsc --watch: {e}"))?,
    );

    println!("serving site/ at http://127.0.0.1:{port}/  (Ctrl-C to stop)");
    println!("  .ts edits recompile automatically; reload the page");
    println!("  Rust edits need `cargo xtask serve` again (it rebuilds the wasm)");
    // `xtask/serve.py`: `http.server` plus `Cache-Control: no-store`, so a
    // reload never pairs a new page with a cached old `engine.wasm`.
    let mut server = KillOnDrop(
        process::Command::new("python3")
            .current_dir(root)
            .args([
                "xtask/serve.py",
                "--port",
                &port.to_string(),
                "--bind",
                "127.0.0.1",
                "--directory",
                "site",
            ])
            .spawn()
            .map_err(|e| format!("failed to start python3 xtask/serve.py: {e}"))?,
    );
    let status = server
        .0
        .wait()
        .map_err(|e| format!("waiting for the server: {e}"))?;
    // Ctrl-C ends the server with a signal; any other exit (e.g. the port is
    // taken) is an error worth reporting.
    if status.success() || status.code().is_none() {
        Ok(())
    } else {
        Err(format!(
            "the server exited ({status}); is port {port} in use?"
        ))
    }
}
