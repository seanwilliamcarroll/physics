//! `cargo xtask mutants`: `cargo mutants` with its scratch space outside the
//! repo, and the defaults the compute node runs with.
//!
//! cargo-mutants copies the whole tree into `TMPDIR` for each build, and
//! has no setting for where. On a machine whose `/tmp` is a small quota'd
//! tmpfs that fails ("Disk quota exceeded (os error 122)"), so this sets
//! `TMPDIR` for the child to `$MUTANTS_TMPDIR`, or `$HOME/.cache/mutants-tmp`
//! by default, and refuses a directory inside the workspace (the copy would
//! copy itself). Leftover `cargo-mutants-*.tmp` build dirs from killed runs
//! are removed before and after; nothing else there is touched.

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;

/// Jobs when none are given: the compute node's 8.
const DEFAULT_JOBS: &str = "8";

/// Runs `cargo mutants` with `args` (after [`with_defaults`]) and exits
/// with its exit code.
pub(crate) fn mutants(root: &Path, args: &[String]) -> Result<(), String> {
    let scratch = scratch_dir(root)?;
    clean_leftovers(&scratch)?;
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let args = with_defaults(args, crate::has_nextest(&cargo));
    println!(
        "mutants: TMPDIR={} cargo mutants {}",
        scratch.display(),
        args.join(" ")
    );
    let status = process::Command::new(cargo)
        .current_dir(root)
        .arg("mutants")
        .args(&args)
        .env("TMPDIR", &scratch)
        .status()
        .map_err(|e| format!("failed to run cargo mutants: {e}"))?;
    clean_leftovers(&scratch)?;
    // cargo-mutants' exit code means something (2: mutants missed, 3:
    // timeouts, …): pass it through rather than collapsing it to 1.
    process::exit(status.code().unwrap_or(1));
}

/// `$MUTANTS_TMPDIR`, or `$HOME/.cache/mutants-tmp`, created if missing;
/// an error if it's inside the workspace `root`.
fn scratch_dir(root: &Path) -> Result<PathBuf, String> {
    let chosen = if let Some(dir) = env::var_os("MUTANTS_TMPDIR") {
        PathBuf::from(dir)
    } else {
        let home = env::var_os("HOME").ok_or("HOME isn't set; set MUTANTS_TMPDIR instead")?;
        Path::new(&home).join(".cache").join("mutants-tmp")
    };
    let absolute = if chosen.is_absolute() {
        chosen
    } else {
        env::current_dir()
            .map_err(|e| format!("current dir: {e}"))?
            .join(chosen)
    };
    let root = root
        .canonicalize()
        .map_err(|e| format!("workspace root {}: {e}", root.display()))?;
    // Checked before creating it (lexically), and again after (with links
    // resolved), so nothing is ever made inside the repo.
    refuse_inside(&absolute, &root)?;
    fs::create_dir_all(&absolute).map_err(|e| format!("creating {}: {e}", absolute.display()))?;
    let resolved = absolute
        .canonicalize()
        .map_err(|e| format!("{}: {e}", absolute.display()))?;
    refuse_inside(&resolved, &root)?;
    Ok(resolved)
}

/// An error if `dir` is `root` or inside it.
fn refuse_inside(dir: &Path, root: &Path) -> Result<(), String> {
    if dir.starts_with(root) {
        return Err(format!(
            "mutants scratch dir {} is inside the workspace ({}): cargo-mutants copies the \
             tree into it, so it would copy itself; set MUTANTS_TMPDIR outside the repo",
            dir.display(),
            root.display()
        ));
    }
    Ok(())
}

/// Removes every `cargo-mutants-*.tmp` entry directly under `dir`: build
/// dirs left by killed runs. Nothing else.
fn clean_leftovers(dir: &Path) -> Result<(), String> {
    let entries = fs::read_dir(dir).map_err(|e| format!("reading {}: {e}", dir.display()))?;
    for entry in entries.flatten() {
        if !is_leftover(&entry.file_name().to_string_lossy()) {
            continue;
        }
        let path = entry.path();
        let removed = if path.is_dir() {
            fs::remove_dir_all(&path)
        } else {
            fs::remove_file(&path)
        };
        removed.map_err(|e| format!("removing {}: {e}", path.display()))?;
    }
    Ok(())
}

/// Whether `name` is a cargo-mutants build dir: `cargo-mutants-*.tmp`.
#[expect(
    clippy::case_sensitive_file_extension_comparisons,
    reason = "cargo-mutants names its build dirs `.tmp` exactly; only those are ours to delete"
)]
fn is_leftover(name: &str) -> bool {
    name.starts_with("cargo-mutants-") && name.ends_with(".tmp")
}

/// `args` with the node's defaults where they don't say otherwise: `-j 8`
/// unless jobs are given (`-j`, `-jN`, `--jobs`, `--jobs=N`),
/// `--no-shuffle` unless `--shuffle` or `--no-shuffle` is, and, when
/// `nextest` is installed, `--test-tool nextest` unless a test tool is
/// given.
///
/// Nextest because each mutant's tests then run as one pool with a
/// process per test: measured on the node over one shard of 270 mutants,
/// 197 s against `cargo test`'s 294 s at `-j 8`, the same mutants missed
/// (`docs/04-testing.md`, "Mutation testing").
fn with_defaults(args: &[String], nextest: bool) -> Vec<String> {
    let has_jobs = args
        .iter()
        .any(|a| a.starts_with("-j") || a == "--jobs" || a.starts_with("--jobs="));
    let has_shuffle = args.iter().any(|a| a == "--shuffle" || a == "--no-shuffle");
    let has_tool = args
        .iter()
        .any(|a| a == "--test-tool" || a.starts_with("--test-tool="));
    let mut out = Vec::with_capacity(args.len() + 5);
    if !has_jobs {
        out.extend(["-j".to_owned(), DEFAULT_JOBS.to_owned()]);
    }
    if !has_shuffle {
        out.push("--no-shuffle".to_owned());
    }
    if nextest && !has_tool {
        out.extend(["--test-tool".to_owned(), "nextest".to_owned()]);
    }
    out.extend_from_slice(args);
    out
}

#[cfg(test)]
mod tests;
