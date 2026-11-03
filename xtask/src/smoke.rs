//! `cargo xtask smoke`: load the demo in headless Chrome and check that the
//! whole pipeline (wasm load, stepping, drawing) produces particles on the
//! canvas. The page side lives in `site/js/smoke.js` (`?smoke` mode).

use std::env;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{self};

mod cases;
mod server;

use cases::{CASES, Check};
use server::Server;

/// How long Chrome waits before its screenshot (and exit). Smoke mode is
/// synchronous, so this only has to cover loading: about 1 s at 500k.
const CHROME_TIMEOUT_MS: u32 = 3000;

/// Window size for screenshots, CSS pixels.
const WINDOW_SIZE: &str = "1000,900";

/// Chrome's log line when it drops a draw command that's too large.
const SERIALIZE_FAILURE: &str = "Failed to serialize";

/// Prefix of the console line `site/js/wasm.js` writes for a Rust panic
/// (`engine.wasm ` + std's "panicked at <file:line:col>:").
const PANIC_CONSOLE_PREFIX: &str = "engine.wasm panicked at";

/// Where Chrome is usually installed, checked after `$CHROME`.
const CHROME_PATHS: [&str; 2] = [
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
    "/Applications/Chromium.app/Contents/MacOS/Chromium",
];
const CHROME_NAMES: [&str; 4] = [
    "google-chrome",
    "google-chrome-stable",
    "chromium",
    "chromium-browser",
];

/// A healthy page's report.
#[derive(Debug, PartialEq, Eq)]
pub(crate) struct Report {
    pub steps: u64,
    pub particle_px: u64,
}

/// The page's `SMOKE ok ...` fields, after the checks every case shares:
/// no dropped draw commands, a SMOKE line exists, and it isn't an error.
fn ok_fields(stderr: &str) -> Result<&str, String> {
    if stderr.contains(SERIALIZE_FAILURE) {
        return Err("Chrome dropped a draw command (\"Failed to serialize op\")".to_owned());
    }
    let line = stderr
        .lines()
        .find_map(|l| l.split_once("\"SMOKE ").map(|(_, rest)| rest))
        .ok_or("no SMOKE line: the page crashed, hung, or never loaded")?;
    // Chrome quotes the message: `"SMOKE ...", source: ...`.
    let msg = line.split_once('"').map_or(line, |(m, _)| m);
    if let Some(err) = msg.strip_prefix("error ") {
        return Err(format!("page error: {err}"));
    }
    msg.strip_prefix("ok ")
        .ok_or_else(|| format!("unrecognized report `{msg}`"))
}

/// Judges a panic-hook load: the page saw the panic text arrive through
/// the import (`panic_logged=1`), and Chrome's log shows the console line.
pub(crate) fn judge_panic(stderr: &str) -> Result<String, String> {
    let fields = ok_fields(stderr)?;
    if fields.split_whitespace().all(|kv| kv != "panic_logged=1") {
        return Err(format!("unexpected panic report `{fields}`"));
    }
    if !stderr.contains(PANIC_CONSOLE_PREFIX) {
        return Err(format!("no `{PANIC_CONSOLE_PREFIX}` console line"));
    }
    Ok("panic message reached the console".to_owned())
}

/// Judges a drawing load from Chrome's stderr. Pure, so it's unit-tested.
pub(crate) fn judge(stderr: &str) -> Result<Report, String> {
    let fields = ok_fields(stderr)?;
    let get = |key: &str| -> Result<u64, String> {
        fields
            .split_whitespace()
            .find_map(|kv| kv.strip_prefix(key)?.strip_prefix('='))
            .ok_or_else(|| format!("report `{fields}` has no `{key}`"))?
            .parse()
            .map_err(|e| format!("report `{fields}`: bad `{key}`: {e}"))
    };
    let report = Report {
        steps: get("steps")?,
        particle_px: get("particle_px")?,
    };
    if report.steps == 0 {
        return Err("physics took no steps".to_owned());
    }
    if report.particle_px == 0 {
        return Err("no particle pixels on the canvas".to_owned());
    }
    Ok(report)
}

/// Builds the site, serves it, and checks every case. Screenshots go to
/// `target/smoke/<case>.png` for a human look.
pub(crate) fn smoke(root: &Path) -> Result<(), String> {
    super::site(root)?;
    let chrome = find_chrome()?;
    let server = Server::start(&root.join("site"))?;
    let shots = root.join("target").join("smoke");
    fs::create_dir_all(&shots).map_err(|e| format!("creating {}: {e}", shots.display()))?;

    let mut failed = Vec::new();
    for case in &CASES {
        let url = format!(
            "http://127.0.0.1:{}/{}{}",
            server.port, case.page, case.query
        );
        let shot = shots.join(format!("{}.png", case.name));
        let verdict =
            run_chrome(&chrome, &url, &shot, case.name).and_then(|stderr| match case.check {
                Check::Draws => judge(&stderr)
                    .map(|r| format!("steps={} particle_px={}", r.steps, r.particle_px)),
                Check::PanicReported => judge_panic(&stderr),
            });
        match verdict {
            Ok(summary) => println!("smoke {:<8} ok   {summary}", case.name),
            Err(e) => {
                println!("smoke {:<8} FAIL {e}", case.name);
                failed.push(case.name);
            }
        }
    }
    println!("screenshots: {}", shots.display());
    if failed.is_empty() {
        Ok(())
    } else {
        Err(format!("smoke test failed: {}", failed.join(", ")))
    }
}

/// Runs headless Chrome once with a fresh profile (a reused profile can
/// serve stale JS from cache) and returns its stderr.
fn run_chrome(chrome: &Path, url: &str, shot: &Path, name: &str) -> Result<String, String> {
    let profile = env::temp_dir().join(format!("physics-smoke-{}-{name}", process::id()));
    // Absent is fine: this only clears leftovers from an interrupted run.
    let _ = fs::remove_dir_all(&profile);
    let output = process::Command::new(chrome)
        .arg("--headless=new")
        .arg(format!("--user-data-dir={}", profile.display()))
        .arg(format!("--window-size={WINDOW_SIZE}"))
        .arg("--hide-scrollbars")
        .arg(format!("--timeout={CHROME_TIMEOUT_MS}"))
        .args(["--enable-logging=stderr", "--v=0"])
        .arg(format!("--screenshot={}", shot.display()))
        .arg(url)
        .output()
        .map_err(|e| format!("failed to run {}: {e}", chrome.display()))?;
    let _ = fs::remove_dir_all(&profile);
    Ok(String::from_utf8_lossy(&output.stderr).into_owned())
}

/// `$CHROME` if set, else the usual install paths, else `$PATH`.
fn find_chrome() -> Result<PathBuf, String> {
    if let Some(path) = env::var_os("CHROME") {
        let path = PathBuf::from(path);
        return if path.is_file() {
            Ok(path)
        } else {
            Err(format!("CHROME={} is not a file", path.display()))
        };
    }
    let installed = CHROME_PATHS.iter().map(PathBuf::from).find(|p| p.is_file());
    let on_path = || {
        let dirs = env::var_os("PATH")?;
        env::split_paths(&dirs)
            .flat_map(|dir| CHROME_NAMES.iter().map(move |n| dir.join(n)))
            .find(|p| p.is_file())
    };
    installed.or_else(on_path).ok_or_else(|| {
        "Chrome/Chromium not found; install it or set CHROME=/path/to/chrome".to_owned()
    })
}

#[cfg(test)]
mod tests;
