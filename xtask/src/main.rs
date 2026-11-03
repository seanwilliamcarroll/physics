//! Build helper, run as `cargo xtask <command>` (alias in `.cargo/config.toml`).
//! Std only. See `docs/repo-layout.md`.
// A CLI prints by design; Cargo can't mix `workspace = true` lints with
// per-crate overrides, so the override lives here (docs/lint-policy.md).
#![allow(clippy::print_stdout, clippy::print_stderr)]

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{self, ExitCode};

mod serve;
mod smoke;

const USAGE: &str = "\
usage: cargo xtask <command>

commands:
  site           compile site TypeScript, build crates/web for wasm32 -> site/pkg/engine.wasm
  smoke          build the site, load the demo in headless Chrome, check it draws
  test-wasm      run the math and engine tests as wasm32-wasip1 under wasmtime
  serve          build the site, then serve it (default port 8000) with
                 `tsc --watch` alongside; Ctrl-C stops both. [--port N]
  install-hooks  point git at the tracked hooks in .githooks/
  help           show this message";

/// Where `cargo build` puts the wasm artifact, relative to the target dir.
const WASM_ARTIFACT: &str = "wasm32-unknown-unknown/release/web.wasm";

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
enum Command {
    Site,
    Serve { port: u16 },
    Smoke,
    TestWasm,
    InstallHooks,
    Help,
}

/// Parses the arguments after `cargo xtask`. Pure, so it's unit-tested.
fn parse(args: &[String]) -> Result<Command, String> {
    match args {
        [] => Ok(Command::Help),
        [cmd, rest @ ..] if cmd == "serve" => parse_serve(rest),
        [cmd] => match cmd.as_str() {
            "site" => Ok(Command::Site),
            "smoke" => Ok(Command::Smoke),
            "test-wasm" => Ok(Command::TestWasm),
            "install-hooks" => Ok(Command::InstallHooks),
            "help" | "-h" | "--help" => Ok(Command::Help),
            other => Err(format!("unknown command `{other}`")),
        },
        [cmd, extra, ..] => Err(format!("`{cmd}` takes no arguments (got `{extra}`)")),
    }
}

/// `serve [--port N]`: N must be 1–65535.
fn parse_serve(rest: &[String]) -> Result<Command, String> {
    match rest {
        [] => Ok(Command::Serve {
            port: serve::DEFAULT_PORT,
        }),
        [flag, value] if flag == "--port" => match value.parse::<u16>() {
            Ok(port) if port != 0 => Ok(Command::Serve { port }),
            _ => Err(format!(
                "`--port` needs a port number 1–65535, got `{value}`"
            )),
        },
        [flag] if flag == "--port" => Err("`--port` needs a value".to_owned()),
        [other, ..] => Err(format!("`serve` doesn't take `{other}`")),
    }
}

fn main() -> ExitCode {
    let args: Vec<String> = env::args().skip(1).collect();
    let result = parse(&args)
        .map_err(|e| format!("{e}\n\n{USAGE}"))
        .and_then(run);
    match result {
        Ok(()) => ExitCode::SUCCESS,
        Err(e) => {
            eprintln!("xtask: {e}");
            ExitCode::FAILURE
        }
    }
}

fn run(cmd: Command) -> Result<(), String> {
    let root = workspace_root()?;
    match cmd {
        Command::Site => site(&root),
        Command::Serve { port } => serve::serve(&root, port),
        Command::Smoke => smoke::smoke(&root),
        Command::TestWasm => test_wasm(&root),
        Command::InstallHooks => install_hooks(&root),
        Command::Help => {
            println!("{USAGE}");
            Ok(())
        }
    }
}

/// The workspace root: this crate's manifest dir is `<root>/xtask`, baked
/// in at compile time, so commands work from any working directory.
fn workspace_root() -> Result<PathBuf, String> {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .map(Path::to_path_buf)
        .ok_or_else(|| "xtask manifest has no parent directory".to_owned())
}

/// Compiles `site/**/*.ts` to `.js` (+ source maps) with the pinned
/// TypeScript (`tsconfig.json`). The emitted files are gitignored, so
/// the site isn't servable until this runs.
fn site_ts(root: &Path) -> Result<(), String> {
    let tsc = root.join("node_modules").join(".bin").join("tsc");
    if !tsc.is_file() {
        return Err("TypeScript not installed; run `npm ci` (see README)".to_owned());
    }
    let status = process::Command::new(&tsc)
        .current_dir(root)
        .args(["-p", "tsconfig.json"])
        .status()
        .map_err(|e| format!("failed to run tsc: {e}"))?;
    if !status.success() {
        return Err(format!("TypeScript build failed ({status})"));
    }
    println!("compiled site/**/*.ts");
    Ok(())
}

/// Builds the site: the TypeScript library, then the release wasm, copied
/// to `site/pkg/engine.wasm`.
fn site(root: &Path) -> Result<(), String> {
    site_ts(root)?;
    // `cargo run` sets CARGO to the cargo binary running us; reuse it so the
    // pinned toolchain builds the wasm too.
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "build",
            "--release",
            "--target",
            "wasm32-unknown-unknown",
            "-p",
            "web",
        ])
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if !status.success() {
        return Err(format!("wasm build failed ({status})"));
    }

    let target_dir =
        env::var_os("CARGO_TARGET_DIR").map_or_else(|| root.join("target"), |d| root.join(d));
    let src = target_dir.join(WASM_ARTIFACT);
    let dest_dir = root.join("site").join("pkg");
    let dest = dest_dir.join("engine.wasm");
    fs::create_dir_all(&dest_dir).map_err(|e| format!("creating {}: {e}", dest_dir.display()))?;
    let bytes = fs::copy(&src, &dest).map_err(|e| format!("copying {}: {e}", src.display()))?;
    println!("wrote {} ({bytes} bytes)", dest.display());
    Ok(())
}

/// Runs the math and engine test suites compiled to `wasm32-wasip1`,
/// executed by wasmtime (the runner set in `.cargo/config.toml`). The same
/// golden hashes then have to match on wasm as natively: the cross-platform
/// determinism check (`docs/04-testing.md`).
fn test_wasm(root: &Path) -> Result<(), String> {
    // Fail with an install hint, not cargo's "cannot execute binary file".
    let found = process::Command::new("wasmtime")
        .arg("--version")
        .stdout(process::Stdio::null())
        .status()
        .is_ok_and(|s| s.success());
    if !found {
        return Err(
            "wasmtime not found; install it with `cargo install wasmtime-cli` \
                    (or MacPorts: `sudo port install wasmtime`)"
                .to_owned(),
        );
    }
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "test",
            "--quiet",
            "-p",
            "math",
            "-p",
            "engine",
            "--target",
            "wasm32-wasip1",
        ])
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!("wasm tests failed ({status})"))
    }
}

/// Points git at `.githooks/` (fmt + clippy on commit, tests + wasm check
/// on push). Per clone, because git never copies hook config.
fn install_hooks(root: &Path) -> Result<(), String> {
    let status = process::Command::new("git")
        .current_dir(root)
        .args(["config", "core.hooksPath", ".githooks"])
        .status()
        .map_err(|e| format!("failed to run git: {e}"))?;
    if !status.success() {
        return Err(format!("git config failed ({status})"));
    }
    println!("git hooks enabled: core.hooksPath = .githooks");
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::{Command, parse};

    fn args(a: &[&str]) -> Vec<String> {
        a.iter().map(|s| (*s).to_owned()).collect()
    }

    #[test]
    fn parses_known_commands() {
        assert_eq!(parse(&args(&["site"])), Ok(Command::Site));
        assert_eq!(parse(&args(&["smoke"])), Ok(Command::Smoke));
        assert_eq!(parse(&args(&["test-wasm"])), Ok(Command::TestWasm));
        assert_eq!(parse(&args(&["install-hooks"])), Ok(Command::InstallHooks));
    }

    #[test]
    fn serve_takes_an_optional_port() {
        assert_eq!(parse(&args(&["serve"])), Ok(Command::Serve { port: 8000 }));
        assert_eq!(
            parse(&args(&["serve", "--port", "9001"])),
            Ok(Command::Serve { port: 9001 })
        );
        assert!(parse(&args(&["serve", "--port"])).is_err(), "missing value");
        assert!(parse(&args(&["serve", "--port", "0"])).is_err(), "port 0");
        assert!(
            parse(&args(&["serve", "--port", "http"])).is_err(),
            "not a number"
        );
        assert!(parse(&args(&["serve", "--fast"])).is_err(), "unknown flag");
    }

    #[test]
    fn no_args_or_help_shows_usage() {
        assert_eq!(parse(&args(&[])), Ok(Command::Help));
        assert_eq!(parse(&args(&["help"])), Ok(Command::Help));
        assert_eq!(parse(&args(&["--help"])), Ok(Command::Help));
    }

    #[test]
    fn rejects_unknown_commands_and_extra_args() {
        assert!(parse(&args(&["deploy"])).is_err());
        assert!(parse(&args(&["site", "--fast"])).is_err());
    }
}
