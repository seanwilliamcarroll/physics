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

/// One page load to check: a name (for the screenshot) and a URL query.
struct Case {
    name: &'static str,
    query: &'static str,
}

/// Default settings, the other scalar, and the size that once rendered a
/// blank canvas (one path over Chrome's ~16 MiB draw-command limit).
const CASES: [Case; 3] = [
    Case {
        name: "default",
        query: "?smoke",
    },
    Case {
        name: "f64",
        query: "?smoke&scalar=f64&n=1000",
    },
    Case {
        name: "500k",
        query: "?smoke&n=500000",
    },
];

/// Page under test, relative to `site/`.
const DEMO_PATH: &str = "demos/m0-hello/";

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

/// Judges one page load from Chrome's stderr. Pure, so it's unit-tested.
pub fn judge(stderr: &str) -> Result<Report, String> {
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
    let fields = msg
        .strip_prefix("ok ")
        .ok_or_else(|| format!("unrecognized report `{msg}`"))?;
    let get = |key: &str| -> Result<u64, String> {
        fields
            .split_whitespace()
            .find_map(|kv| kv.strip_prefix(key)?.strip_prefix('='))
            .ok_or_else(|| format!("report `{msg}` has no `{key}`"))?
            .parse()
            .map_err(|e| format!("report `{msg}`: bad `{key}`: {e}"))
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
        let url = format!("http://127.0.0.1:{}/{DEMO_PATH}{}", server.port, case.query);
        let shot = shots.join(format!("{}.png", case.name));
        match run_chrome(&chrome, &url, &shot, case.name).and_then(|stderr| judge(&stderr)) {
            Ok(r) => println!(
                "smoke {:<8} ok   steps={} particle_px={}",
                case.name, r.steps, r.particle_px
            ),
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
mod tests {
    use super::{Report, judge};

    /// Real line shapes from Chrome's `--enable-logging=stderr` output.
    fn console(msg: &str) -> String {
        format!(
            "[1:2:1102/150000.000:INFO:CONSOLE:42] \"{msg}\", source: http://127.0.0.1:1/x.js (42)\n"
        )
    }
    const SERIALIZE: &str = "[1:2:1102/150000.000:ERROR:gpu/command_buffer/client/raster_implementation.cc:337] Failed to serialize op in 16777152 bytes.\n";

    #[test]
    fn accepts_a_healthy_report() {
        let log = format!("noise\n{}", console("SMOKE ok steps=30 particle_px=1502"));
        assert_eq!(
            judge(&log),
            Ok(Report {
                steps: 30,
                particle_px: 1502
            })
        );
    }

    #[test]
    fn rejects_dropped_draw_commands_even_if_the_page_reports_ok() {
        let log = format!("{SERIALIZE}{}", console("SMOKE ok steps=30 particle_px=9"));
        assert!(judge(&log).unwrap_err().contains("serialize"));
    }

    #[test]
    fn rejects_a_missing_report() {
        assert!(judge("just noise\n").unwrap_err().contains("no SMOKE line"));
    }

    #[test]
    fn rejects_page_errors() {
        let err = judge(&console("SMOKE error demo_new returned null")).unwrap_err();
        assert!(err.contains("demo_new returned null"), "{err}");
    }

    #[test]
    fn rejects_no_steps_or_no_particles_drawn() {
        assert!(judge(&console("SMOKE ok steps=0 particle_px=10")).is_err());
        assert!(judge(&console("SMOKE ok steps=30 particle_px=0")).is_err());
    }

    #[test]
    fn rejects_malformed_reports() {
        assert!(judge(&console("SMOKE ok steps=many particle_px=1")).is_err());
        assert!(judge(&console("SMOKE ok steps=30")).is_err());
    }
}
