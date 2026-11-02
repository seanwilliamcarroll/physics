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

mod smoke;

const USAGE: &str = "\
usage: cargo xtask <command>

commands:
  site           build crates/web for wasm32 (release) -> site/pkg/engine.wasm
  smoke          build the site, load the demo in headless Chrome, check it draws
  install-hooks  point git at the tracked hooks in .githooks/
  help           show this message";

/// Where `cargo build` puts the wasm artifact, relative to the target dir.
const WASM_ARTIFACT: &str = "wasm32-unknown-unknown/release/web.wasm";

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
enum Command {
    Site,
    Smoke,
    InstallHooks,
    Help,
}

/// Parses the arguments after `cargo xtask`. Pure, so it's unit-tested.
fn parse(args: &[String]) -> Result<Command, String> {
    match args {
        [] => Ok(Command::Help),
        [cmd] => match cmd.as_str() {
            "site" => Ok(Command::Site),
            "smoke" => Ok(Command::Smoke),
            "install-hooks" => Ok(Command::InstallHooks),
            "help" | "-h" | "--help" => Ok(Command::Help),
            other => Err(format!("unknown command `{other}`")),
        },
        [cmd, extra, ..] => Err(format!("`{cmd}` takes no arguments (got `{extra}`)")),
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
        Command::Smoke => smoke::smoke(&root),
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

/// Release-builds `web` for wasm32 and copies it to `site/pkg/engine.wasm`.
fn site(root: &Path) -> Result<(), String> {
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
        assert_eq!(parse(&args(&["install-hooks"])), Ok(Command::InstallHooks));
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
