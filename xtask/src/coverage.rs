//! `cargo xtask coverage`: line and function coverage of the Rust tests
//! (cargo-llvm-cov) and the site JS unit tests (Node's built-in coverage).
//! Report only, no thresholds (`docs/04-testing.md`, Coverage).

use std::env;
use std::ffi::OsString;
use std::path::Path;
use std::process::{self, Stdio};

use crate::target_dir;

/// Files left out of the Rust report: `crates/test-support` and math's
/// `#[cfg(test)]` macros are test tooling, not code under test. (xtask
/// is excluded from the run itself.) cargo-llvm-cov's default filter
/// already drops `tests/` directories and the `foo/tests.rs` unit tests.
const IGNORE_FILES: &str = r"crates/test-support/|/test_util\.rs$";

/// Columns of the `llvm-cov report` table, 0-based after splitting on
/// whitespace: `Filename`, then Regions / Missed / Cover, Functions /
/// Missed / Executed, Lines / Missed / Cover, Branches / Missed / Cover.
const COL_FUNCTIONS: usize = 4;
/// See [`COL_FUNCTIONS`].
const COL_MISSED_FUNCTIONS: usize = 5;
/// See [`COL_FUNCTIONS`].
const COL_LINES: usize = 7;
/// See [`COL_FUNCTIONS`].
const COL_MISSED_LINES: usize = 8;

/// Covered/total counts for one crate (or the whole report).
#[derive(Debug, Default, PartialEq, Eq)]
pub(crate) struct Counts {
    pub name: String,
    pub lines: u32,
    pub missed_lines: u32,
    pub functions: u32,
    pub missed_functions: u32,
}

impl Counts {
    fn add(&mut self, lines: u32, missed_lines: u32, functions: u32, missed_functions: u32) {
        self.lines += lines;
        self.missed_lines += missed_lines;
        self.functions += functions;
        self.missed_functions += missed_functions;
    }
}

/// Sums an `llvm-cov report` text table per crate, in order of first
/// appearance, plus a total. A file's crate is the path component before
/// `src` (`engine/src/world.rs` -> `engine`); rows that don't parse
/// (header, rules, `TOTAL`) are skipped.
pub(crate) fn per_crate(table: &str) -> (Vec<Counts>, Counts) {
    let mut crates: Vec<Counts> = Vec::new();
    let mut total = Counts {
        name: "total".to_owned(),
        ..Counts::default()
    };
    for row in table.lines() {
        let cols: Vec<&str> = row.split_whitespace().collect();
        let num = |i: usize| cols.get(i).and_then(|c| c.parse::<u32>().ok());
        let (Some(file), Some(f), Some(mf), Some(l), Some(ml)) = (
            cols.first(),
            num(COL_FUNCTIONS),
            num(COL_MISSED_FUNCTIONS),
            num(COL_LINES),
            num(COL_MISSED_LINES),
        ) else {
            continue;
        };
        let Some(name) = crate_of(file) else {
            continue;
        };
        let i = crates
            .iter()
            .position(|c| c.name == name)
            .unwrap_or_else(|| {
                crates.push(Counts {
                    name: name.to_owned(),
                    ..Counts::default()
                });
                crates.len() - 1
            });
        if let Some(entry) = crates.get_mut(i) {
            entry.add(l, ml, f, mf);
        }
        total.add(l, ml, f, mf);
    }
    (crates, total)
}

/// The crate a source path belongs to: the component before `src`.
fn crate_of(file: &str) -> Option<&str> {
    let parts: Vec<&str> = file.split(['/', '\\']).collect();
    let src = parts.iter().rposition(|p| *p == "src")?;
    parts.get(src.checked_sub(1)?).copied()
}

/// `covered/total (pct%)`, or `-` when there is nothing to cover.
pub(crate) fn ratio(total: u32, missed: u32) -> String {
    if total == 0 {
        return "-".to_owned();
    }
    let covered = total.saturating_sub(missed);
    let pct = 100.0 * f64::from(covered) / f64::from(total);
    format!("{pct:6.2}% ({covered}/{total})")
}

pub(crate) fn coverage(root: &Path) -> Result<(), String> {
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    // Fail with an install hint, not cargo's "no such command: llvm-cov".
    let found = process::Command::new(&cargo)
        .args(["llvm-cov", "--version"])
        .stdout(Stdio::null())
        .stderr(Stdio::null())
        .status()
        .is_ok_and(|s| s.success());
    if !found {
        return Err("cargo-llvm-cov not found; install it with \
                    `cargo install cargo-llvm-cov` (see README)"
            .to_owned());
    }

    rust(root, &cargo)?;
    js(root)
}

/// Runs the workspace tests instrumented, writes the HTML report, and
/// prints a line per crate.
fn rust(root: &Path, cargo: &OsString) -> Result<(), String> {
    let llvm_cov = |args: &[&str]| {
        let mut cmd = process::Command::new(cargo);
        cmd.current_dir(root).arg("llvm-cov").args(args);
        cmd
    };

    // Run once (instrumented build in target/llvm-cov-target), then report
    // twice from the same profile data.
    // Under nextest when it's installed (`cargo llvm-cov nextest`), as the
    // other test runs are; the workspace has no doctests to merge in.
    let runner: &[&str] = if crate::has_nextest(cargo) {
        &["nextest"]
    } else {
        &[]
    };
    let status = llvm_cov(
        &[
            runner,
            &["--workspace", "--exclude", "xtask", "--no-report"],
        ]
        .concat(),
    )
    .status()
    .map_err(|e| format!("failed to run cargo llvm-cov: {e}"))?;
    if !status.success() {
        return Err(format!("tests failed under coverage ({status})"));
    }

    let out_dir = target_dir(root).join("llvm-cov");
    let out_dir_str = out_dir
        .to_str()
        .ok_or_else(|| format!("non-UTF-8 path: {}", out_dir.display()))?;
    let status = llvm_cov(&[
        "report",
        "--html",
        "--output-dir",
        out_dir_str,
        "--ignore-filename-regex",
        IGNORE_FILES,
    ])
    .status()
    .map_err(|e| format!("failed to run cargo llvm-cov report: {e}"))?;
    if !status.success() {
        return Err(format!("HTML coverage report failed ({status})"));
    }

    let table = llvm_cov(&["report", "--ignore-filename-regex", IGNORE_FILES])
        .stderr(Stdio::inherit())
        .output()
        .map_err(|e| format!("failed to run cargo llvm-cov report: {e}"))?;
    if !table.status.success() {
        return Err(format!("coverage summary failed ({})", table.status));
    }
    let (crates, total) = per_crate(&String::from_utf8_lossy(&table.stdout));

    println!("\nRust coverage (native cargo test; per crate):");
    for c in crates.iter().chain(std::iter::once(&total)) {
        println!(
            "  {:<8} lines {:<22} functions {}",
            c.name,
            ratio(c.lines, c.missed_lines),
            ratio(c.functions, c.missed_functions),
        );
    }
    println!(
        "  HTML report: {}",
        out_dir.join("html").join("index.html").display()
    );
    Ok(())
}

/// Runs the site JS unit tests with Node's built-in coverage; Node prints
/// its own table. Only modules the tests import appear in it.
fn js(root: &Path) -> Result<(), String> {
    println!("\nSite JS coverage (node --test):");
    let status = process::Command::new("node")
        .current_dir(root)
        .args([
            "--test",
            "--experimental-test-coverage",
            "--test-reporter=spec",
            // The test files themselves would otherwise count as covered code.
            "--test-coverage-exclude=tests/**",
            // A glob, not a directory: node --test treats a directory as a module.
            "tests/site/**/*.test.js",
        ])
        .status()
        .map_err(|e| format!("failed to run node: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!("site JS tests failed under coverage ({status})"))
    }
}

#[cfg(test)]
mod tests;
