//! The local HTTP server Chrome loads the site from.

use std::net::{TcpListener, TcpStream};
use std::path::Path;
use std::process::{self, Child, Stdio};
use std::thread;
use std::time::Duration;

/// Server startup: poll this often, this many times (5 s total).
const SERVER_POLL: Duration = Duration::from_millis(100);
const SERVER_POLL_ATTEMPTS: u32 = 50;

/// `python3 -m http.server` on a free local port, killed on drop (including
/// when a check fails partway).
pub(super) struct Server {
    child: Child,
    pub(super) port: u16,
}

impl Server {
    pub(super) fn start(dir: &Path) -> Result<Self, String> {
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
