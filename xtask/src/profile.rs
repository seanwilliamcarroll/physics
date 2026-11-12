//! `cargo xtask profile`: one example or bench built with debug info
//! (`[profile.profiling]`), run under `samply`, and its hottest functions
//! and source lines printed (`docs/profiling.md`). The profile is kept
//! under `target/profile/` for samply's own viewer.

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;

/// What to profile: an example or a criterion bench of a package.
#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) enum Target {
    Example(String),
    Bench(String),
}

/// The last executable in cargo's `--message-format=json` output: the
/// artifact just built. A string search, not a JSON parser (as
/// `bench_wasm::mean_point_estimate`): one field of a stable format.
#[must_use]
pub(crate) fn executable(json: &str) -> Option<PathBuf> {
    json.lines()
        .filter_map(|l| {
            let (_, rest) = l.split_once("\"executable\":\"")?;
            let (path, _) = rest.split_once('"')?;
            Some(PathBuf::from(path))
        })
        .next_back()
}

/// The arguments the profiled program runs with: a criterion bench is
/// told to run its cases for `seconds` each without measuring
/// (`--profile-time`); an example gets `args` as given.
#[must_use]
pub(crate) fn run_args(target: &Target, seconds: u32, args: &[String]) -> Vec<String> {
    let mut out = match target {
        Target::Example(_) => Vec::new(),
        Target::Bench(_) => vec![
            "--bench".to_owned(),
            "--profile-time".to_owned(),
            seconds.to_string(),
        ],
    };
    out.extend(args.iter().cloned());
    out
}

/// Builds, records, and prints the top `top` functions and lines.
pub(crate) fn profile(
    root: &Path,
    package: &str,
    target: &Target,
    seconds: u32,
    top: u32,
    args: &[String],
) -> Result<(), String> {
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let (kind, name) = match target {
        Target::Example(n) => ("--example", n),
        Target::Bench(n) => ("--bench", n),
    };
    let built = process::Command::new(cargo)
        .current_dir(root)
        .args(["build", "--profile", "profiling", "-p", package, kind, name])
        .arg("--message-format=json")
        .stderr(process::Stdio::inherit())
        .output()
        .map_err(|e| format!("failed to run cargo build: {e}"))?;
    if !built.status.success() {
        return Err(format!("cargo build failed ({})", built.status));
    }
    let binary = executable(&String::from_utf8_lossy(&built.stdout))
        .ok_or_else(|| format!("cargo built no executable for {kind} {name}"))?;
    let dir = super::target_dir(root).join("profile");
    fs::create_dir_all(&dir).map_err(|e| format!("failed to create {}: {e}", dir.display()))?;
    let out = dir.join(format!("{package}-{name}.json.gz"));
    println!("profile: recording {}", binary.display());
    // --save-only: don't open the viewer; --unstable-presymbolicate: write
    // the symbols beside the profile, so it can be read without samply.
    let status = process::Command::new("samply")
        .current_dir(root)
        .args(["record", "--save-only", "--unstable-presymbolicate", "-o"])
        .arg(&out)
        .arg(&binary)
        .args(run_args(target, seconds, args))
        .status()
        .map_err(|e| format!("failed to run samply (cargo install --locked samply): {e}"))?;
    if !status.success() {
        return Err(format!("samply failed ({status})"));
    }
    let status = process::Command::new("node")
        .current_dir(root)
        .arg(root.join("xtask").join("profile_top.mjs"))
        .arg(&out)
        .arg(top.to_string())
        .arg("--lines")
        .arg(&binary)
        .status()
        .map_err(|e| format!("failed to run node: {e}"))?;
    if !status.success() {
        return Err(format!("profile_top.mjs failed ({status})"));
    }
    println!(
        "\nprofile: saved {} (flame graph: samply load {})",
        out.display(),
        out.display()
    );
    Ok(())
}

#[cfg(test)]
mod tests;
