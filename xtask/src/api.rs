//! `cargo xtask api`: each library crate's public API, snapshotted in
//! `docs/api/<crate>.txt` (`docs/api-audit.md`, "Keeping it narrow").
//!
//! A PR that changes a surface then shows it as a plain diff beside the
//! code, and `--check` (in pre-push) fails while a snapshot is stale, as
//! the `.d.ts` check does for the C ABI. The listing is `cargo public-api`
//! (rustdoc JSON, so a nightly), with auto-trait, blanket and derived
//! impls left out (`-sss`); the nightly is pinned so the format doesn't
//! shift under us. The build itself stays on the pinned stable.

use std::fs;
use std::path::Path;
use std::process::{Command, Stdio};

/// The nightly `cargo public-api` reads rustdoc JSON with. Pinned: newer
/// nightlies can change the JSON and with it the listing's wording.
pub(crate) const NIGHTLY: &str = "nightly-2026-10-15";

/// Every library crate whose API is snapshotted (`api/tests.rs` checks
/// none is missing).
pub(crate) const CRATES: [&str; 6] = ["math", "engine", "acoustic", "sand", "swarm", "web-common"];

/// Writes every snapshot, or with `check`, compares them and fails on any
/// that's stale. Without the tool or the pinned nightly, writing fails
/// (with how to install them) and checking skips with a message.
pub(crate) fn api(root: &Path, check: bool) -> Result<(), String> {
    if let Err(missing) = tools_present() {
        if check {
            println!("api: skipped ({missing})");
            return Ok(());
        }
        return Err(missing);
    }
    let dir = root.join("docs").join("api");
    fs::create_dir_all(&dir).map_err(|e| format!("creating {}: {e}", dir.display()))?;
    let mut stale = Vec::new();
    for krate in CRATES {
        let listing = public_api(root, krate)?;
        let path = dir.join(format!("{krate}.txt"));
        if check {
            let saved = fs::read_to_string(&path).unwrap_or_default();
            if saved != listing {
                stale.push(krate);
            }
        } else {
            fs::write(&path, listing).map_err(|e| format!("writing {}: {e}", path.display()))?;
            println!("wrote {}", path.display());
        }
    }
    if stale.is_empty() {
        if check {
            println!("api: docs/api matches every crate's public API");
        }
        Ok(())
    } else {
        Err(format!(
            "public API changed in {}: review the change, then run `cargo xtask api` to record it",
            stale.join(", ")
        ))
    }
}

/// `cargo public-api` and the pinned nightly, or what's missing.
fn tools_present() -> Result<(), String> {
    let ok = |cmd: &mut Command| {
        cmd.stdout(Stdio::null())
            .stderr(Stdio::null())
            .status()
            .is_ok_and(|s| s.success())
    };
    if !ok(Command::new("cargo-public-api").arg("--version")) {
        return Err(
            "cargo-public-api not installed: cargo install --locked cargo-public-api".to_owned(),
        );
    }
    if !ok(Command::new("rustup").args(["run", NIGHTLY, "rustc", "--version"])) {
        return Err(format!(
            "{NIGHTLY} not installed: rustup toolchain install {NIGHTLY} --profile minimal"
        ));
    }
    Ok(())
}

/// One crate's public API, as `cargo public-api` lists it.
fn public_api(root: &Path, krate: &str) -> Result<String, String> {
    let out = Command::new("cargo")
        .current_dir(root)
        .args([
            &format!("+{NIGHTLY}"),
            "public-api",
            "-p",
            krate,
            "-sss",
            "--color=never",
        ])
        .stderr(Stdio::inherit())
        .output()
        .map_err(|e| format!("running cargo public-api: {e}"))?;
    if !out.status.success() {
        return Err(format!(
            "cargo public-api -p {krate} failed ({})",
            out.status
        ));
    }
    String::from_utf8(out.stdout).map_err(|e| format!("cargo public-api output: {e}"))
}

#[cfg(test)]
mod tests;
