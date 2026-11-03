//! `cargo xtask smoke`: load the demo in headless Chrome and check that the
//! whole pipeline (wasm load, stepping, drawing) produces particles on the
//! canvas. The page side lives in `site/js/smoke.js` (`?smoke` mode).

use std::env;
use std::fs;
use std::net::{TcpListener, TcpStream};
use std::path::{Path, PathBuf};
use std::process::{self, Child, Stdio};
use std::thread;
use std::time::Duration;

/// What a case must show.
#[derive(Copy, Clone)]
enum Check {
    /// Physics stepped and particles were drawn ([`judge`]).
    Draws,
    /// A deliberate Rust panic reached the console via the hook ([`judge_panic`]).
    PanicReported,
}

/// One page load to check: a name (for the screenshot), the page (relative
/// to `site/`), a URL query, and what it must show.
struct Case {
    name: &'static str,
    page: &'static str,
    query: &'static str,
    check: Check,
}

const M0: &str = "demos/m0-hello/";
const M1: &str = "demos/m1-orbits/";
const M2: &str = "demos/m2-cluster/";

/// M0: default settings, the other scalar, the size that once rendered a
/// blank canvas (one path over Chrome's ~16 MiB draw-command limit), and
/// the panic hook. M1: all three orbit panels must draw and report finite
/// energy, in both scalars. M2: both panels on the default disk, the
/// unsoftened collapse (energy must stay finite through the blow-up), and
/// a heavier cluster.
const CASES: [Case; 9] = [
    Case {
        name: "default",
        page: M0,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "f64",
        page: M0,
        query: "?smoke&scalar=f64&n=1000",
        check: Check::Draws,
    },
    Case {
        name: "500k",
        page: M0,
        query: "?smoke&n=500000",
        check: Check::Draws,
    },
    Case {
        name: "panic",
        page: M0,
        query: "?smoke&panic",
        check: Check::PanicReported,
    },
    Case {
        name: "orbits",
        page: M1,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "orbits32",
        page: M1,
        query: "?smoke&scalar=f32",
        check: Check::Draws,
    },
    Case {
        name: "m2",
        page: M2,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m2eps0",
        page: M2,
        query: "?smoke&scene=collapse&eps_mm=0",
        check: Check::Draws,
    },
    Case {
        name: "m2n1024",
        page: M2,
        query: "?smoke&scene=cluster&n=1024",
        check: Check::Draws,
    },
];

/// How long Chrome waits before its screenshot (and exit). Smoke mode is
/// synchronous, so this only has to cover loading: about 1 s at 500k.
const CHROME_TIMEOUT_MS: u32 = 3000;

/// Window size for screenshots, CSS pixels.
const WINDOW_SIZE: &str = "1000,900";

/// Server startup: poll this often, this many times (5 s total).
const SERVER_POLL: Duration = Duration::from_millis(100);
const SERVER_POLL_ATTEMPTS: u32 = 50;

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
pub struct Report {
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
pub fn judge_panic(stderr: &str) -> Result<String, String> {
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
pub fn judge(stderr: &str) -> Result<Report, String> {
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
pub fn smoke(root: &Path) -> Result<(), String> {
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

/// `python3 -m http.server` on a free local port, killed on drop (including
/// when a check fails partway).
struct Server {
    child: Child,
    port: u16,
}

impl Server {
    fn start(dir: &Path) -> Result<Self, String> {
        // Ask the OS for a free port, then release it for the server. Another
        // process could grab it in between; unlikely on a dev machine.
        let port = TcpListener::bind(("127.0.0.1", 0))
            .and_then(|l| l.local_addr())
            .map_err(|e| format!("finding a free port: {e}"))?
            .port();
        let child = process::Command::new("python3")
            .args([
                "-m",
                "http.server",
                &port.to_string(),
                "--bind",
                "127.0.0.1",
                "-d",
            ])
            .arg(dir)
            .stdout(Stdio::null())
            .stderr(Stdio::null())
            .spawn()
            .map_err(|e| format!("failed to start python3 http.server: {e}"))?;
        let server = Self { child, port };
        for _ in 0..SERVER_POLL_ATTEMPTS {
            if TcpStream::connect(("127.0.0.1", port)).is_ok() {
                return Ok(server);
            }
            thread::sleep(SERVER_POLL);
        }
        Err(format!("http.server didn't start on port {port}"))
    }
}

impl Drop for Server {
    fn drop(&mut self) {
        // Best effort: the process may already have exited.
        let _ = self.child.kill();
        let _ = self.child.wait();
    }
}

#[cfg(test)]
mod tests;
