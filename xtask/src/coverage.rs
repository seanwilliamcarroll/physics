//! `cargo xtask coverage`: line and function coverage of the Rust tests
//! (cargo-llvm-cov) and the site JS unit tests (Node's built-in coverage).
//! The Rust half is compared with the committed record (`docs/coverage.md`,
//! `record.rs`): where coverage fell is reported, never failed.
//! `--record` replaces the record (`docs/04-testing.md`, Coverage).

use std::env;
use std::ffi::OsString;
use std::fmt::Write as _;
use std::path::Path;
use std::process::{self, Stdio};

use crate::github;
use crate::target_dir;

mod record;

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

/// One entry per file in an `llvm-cov report` text table (header, rules
/// and `TOTAL` skipped), named by its path as the report prints it.
pub(crate) fn per_file(table: &str) -> Vec<Counts> {
    table
        .lines()
        .filter_map(|row| {
            let cols: Vec<&str> = row.split_whitespace().collect();
            let num = |i: usize| cols.get(i).and_then(|c| c.parse::<u32>().ok());
            let file = cols.first()?;
            crate_of(file)?;
            Some(Counts {
                name: (*file).to_owned(),
                lines: num(COL_LINES)?,
                missed_lines: num(COL_MISSED_LINES)?,
                functions: num(COL_FUNCTIONS)?,
                missed_functions: num(COL_MISSED_FUNCTIONS)?,
            })
        })
        .collect()
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

pub(crate) fn coverage(root: &Path, record: bool) -> Result<(), String> {
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

    if record {
        github::preflight(root, "coverage")?;
    }
    let table = rust(root, &cargo)?;
    let files = per_file(&table);
    compare(root, &files);
    if record {
        let (crates, total) = per_crate(&table);
        write_record(root, &crates, &total, &files)?;
    }
    js(root)
}

/// Prints (and, under GitHub Actions, adds to the job's summary) where
/// this run's coverage fell short of the record. Never fails.
fn compare(root: &Path, files: &[Counts]) {
    let Ok(text) = std::fs::read_to_string(root.join(record::PATH)) else {
        println!("coverage: no record ({}) to compare with", record::PATH);
        return;
    };
    let was = record::parse(&text);
    let fell = record::fell(&was, files);
    let rose = record::rose(&was, files);
    let missed = |f: &dyn Fn(&record::Kept) -> u32| was.values().map(f).sum::<u32>();
    let (was_lines, was_functions) = (missed(&|k| k.missed_lines), missed(&|k| k.missed_functions));
    let now_lines: u32 = files.iter().map(|f| f.missed_lines).sum();
    let now_functions: u32 = files.iter().map(|f| f.missed_functions).sum();
    let mut summary = format!(
        "coverage, against {}: lines missed {was_lines} -> {now_lines}, functions missed {was_functions} -> {now_functions}; {} file(s) better\n",
        record::PATH,
        rose
    );
    if fell.is_empty() {
        summary.push_str("coverage: no file has more missed than the record\n");
    } else {
        let _ = writeln!(
            summary,
            "coverage: {} file(s) with more missed than the record:",
            fell.len()
        );
        for f in &fell {
            let _ = writeln!(summary, "  {f}");
        }
    }
    print!("\n{summary}");
    if let Some(path) = env::var_os("GITHUB_STEP_SUMMARY") {
        let md = format!("## Coverage\n\n```\n{summary}```\n");
        let _ = std::fs::OpenOptions::new()
            .append(true)
            .open(path)
            .and_then(|mut f| std::io::Write::write_all(&mut f, md.as_bytes()));
    }
}

/// `--record`: `docs/coverage.md` replaced by this run's, in a pull request.
fn write_record(
    root: &Path,
    crates: &[Counts],
    total: &Counts,
    files: &[Counts],
) -> Result<(), String> {
    let run = |p: &str, a: &[&str]| github::output(root, p, a).unwrap_or_else(|| "?".to_owned());
    let meta = record::Meta {
        date: run("date", &["+%Y-%m-%d"]),
        commit: run("git", &["rev-parse", "--short", "HEAD"]),
        subject: run("git", &["log", "-1", "--format=%s"]),
        rustc: run("rustc", &["--version"]),
    };
    let text = record::document(&meta, crates, total, files);
    let branch = format!("coverage/{}-{}", meta.date, run("date", &["+%H%M%S"]));
    let title = format!("coverage: record of {}", meta.date);
    let body = format!(
        "{text}\nThe coverage record, which every later `cargo xtask coverage` compares with. Opened by `cargo xtask coverage --record`; not merged by it.\n"
    );
    github::propose(
        root,
        &[(record::PATH.to_owned(), Some(text))],
        &branch,
        &title,
        &body,
    )
}

/// Runs the workspace tests instrumented, writes the HTML report, prints
/// a line per crate, and returns llvm-cov's per-file table.
fn rust(root: &Path, cargo: &OsString) -> Result<String, String> {
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
    let table = String::from_utf8_lossy(&table.stdout).into_owned();
    let (crates, total) = per_crate(&table);

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
    Ok(table)
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
