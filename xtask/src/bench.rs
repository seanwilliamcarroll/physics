//! `cargo xtask bench`: every criterion benchmark in the workspace (or
//! those matching a filter), run, saved as a named baseline, or compared
//! with one (`docs/benchmarks.md`); then a table of the results
//! (`table.rs`). A comparison also reads criterion's own
//! `change/estimates.json` files and lists every benchmark whose mean
//! moved past a threshold: regressions fail the command, improvements are
//! reported.

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;
use std::time::SystemTime;

mod table;

use crate::bench_wasm::mean_point_estimate;

/// What to do with the baseline.
pub(crate) enum Mode<'a> {
    /// Neither: just run (criterion still keeps the results as `base`).
    Run,
    /// `--save-baseline NAME`: record.
    Save(&'a str),
    /// `--baseline NAME`: compare.
    Compare(&'a str),
}

/// One benchmark's relative change in its mean (0.1 is 10% slower).
#[derive(Debug, PartialEq)]
pub(crate) struct Change {
    pub name: String,
    pub change: f64,
}

/// Splits changes past `threshold` (a fraction) into regressions (slower)
/// and improvements (faster), each sorted worst or best first. Pure.
#[must_use]
pub(crate) fn classify(changes: Vec<Change>, threshold: f64) -> (Vec<Change>, Vec<Change>) {
    let (mut worse, mut better): (Vec<Change>, Vec<Change>) = changes
        .into_iter()
        .filter(|c| c.change.abs() > threshold)
        .partition(|c| c.change > 0.0);
    worse.sort_by(|a, b| b.change.total_cmp(&a.change));
    better.sort_by(|a, b| a.change.total_cmp(&b.change));
    (worse, better)
}

/// Every `change/estimates.json` under criterion's directory, as a
/// benchmark name (its path) and the mean's relative change.
fn changes(criterion: &Path) -> Vec<Change> {
    let mut out = Vec::new();
    let mut stack = vec![criterion.to_path_buf()];
    while let Some(dir) = stack.pop() {
        let Ok(entries) = fs::read_dir(&dir) else {
            continue;
        };
        for e in entries.flatten() {
            let path = e.path();
            if path.is_dir() {
                if path.file_name().is_some_and(|n| n == "change") {
                    let file = path.join("estimates.json");
                    if let Some(change) = fs::read_to_string(&file)
                        .ok()
                        .as_deref()
                        .and_then(mean_point_estimate)
                    {
                        let name = dir.strip_prefix(criterion).map_or_else(
                            |_| dir.display().to_string(),
                            |p| p.display().to_string(),
                        );
                        out.push(Change { name, change });
                    }
                } else {
                    stack.push(path);
                }
            }
        }
    }
    out
}

/// Runs every bench (`cargo bench --workspace --benches`), saving or
/// comparing a baseline; for a comparison, lists what moved past
/// `threshold_pct` and fails on any regression.
pub(crate) fn bench(
    root: &Path,
    mode: &Mode<'_>,
    filter: Option<&str>,
    threshold_pct: f64,
) -> Result<(), String> {
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let criterion: PathBuf = env::var_os("CARGO_TARGET_DIR")
        .map_or_else(|| root.join("target"), |d| root.join(d))
        .join("criterion");
    let baseline = match mode {
        Mode::Run => None,
        Mode::Save(n) => Some(("--save-baseline", *n)),
        Mode::Compare(n) => Some(("--baseline", *n)),
    };
    if let Mode::Compare(_) = mode {
        // Stale change files from an earlier comparison would be read as
        // this one's: remove them first.
        for c in changes(&criterion) {
            let _ = fs::remove_dir_all(criterion.join(&c.name).join("change"));
        }
    }
    let mut cmd = process::Command::new(cargo);
    cmd.current_dir(root)
        .args(["bench", "--workspace", "--benches", "--"])
        // Criterion's results only, not its progress lines: the table
        // below gathers them.
        .arg("--quiet");
    if let Some((flag, name)) = baseline {
        cmd.args([flag, name]);
    }
    if let Some(f) = filter {
        cmd.arg(f);
    }
    let started = SystemTime::now();
    let status = cmd
        .status()
        .map_err(|e| format!("failed to run cargo bench: {e}"))?;
    if !status.success() {
        return Err(format!("cargo bench failed ({status})"));
    }
    let mut rows = table::collect(&criterion, started);
    println!("\n{}", table::format(&mut rows));
    // What criterion compared each mean with.
    let against = match mode {
        Mode::Compare(name) => format!("baseline `{name}`"),
        Mode::Run | Mode::Save(_) => "each benchmark's previous run".to_owned(),
    };
    println!(
        "Time: the mean per iteration; ±: half its 95% confidence interval; Change: from {against}."
    );
    let name = match mode {
        Mode::Run => return Ok(()),
        Mode::Save(name) => {
            println!(
                "bench: saved baseline `{name}` under {}",
                criterion.display()
            );
            return Ok(());
        }
        Mode::Compare(name) => name,
    };
    let (worse, better) = classify(changes(&criterion), threshold_pct / 100.0);
    for c in &better {
        println!("bench: faster  {:+6.1}%  {}", c.change * 100.0, c.name);
    }
    for c in &worse {
        println!("bench: SLOWER  {:+6.1}%  {}", c.change * 100.0, c.name);
    }
    if worse.is_empty() {
        println!("bench: nothing slower than `{name}` by more than {threshold_pct}%");
        Ok(())
    } else {
        Err(format!(
            "{} benchmark(s) slower than `{name}` by more than {threshold_pct}%",
            worse.len()
        ))
    }
}

#[cfg(test)]
mod tests;
