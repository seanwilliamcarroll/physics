//! `cargo xtask bench`: every criterion benchmark in the workspace (or
//! those matching a filter), run and compared (`docs/benchmarks.md`):
//! by default with this machine's committed record (`store.rs`), else
//! with the previous local run, or with a named local baseline. Then a
//! table of the results (`table.rs`), and the benchmarks whose mean moved
//! past a threshold. Only `--baseline NAME` fails on a regression; the
//! others report. `--record` updates the record (`record.rs`).

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;
use std::time::SystemTime;

mod record;
mod store;
mod table;

use crate::bench_wasm::mean_point_estimate;

/// What to compare with.
pub(crate) enum Mode<'a> {
    /// This machine's committed record if there is one, else as `Local`.
    Default,
    /// `--compare-local`: each benchmark's previous run here (criterion
    /// keeps it as `base`).
    Local,
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

/// Runs every bench (`cargo bench --workspace --bench '*'`, or those matching
/// `filter`), compared as `mode` says; prints the table and what moved
/// past `threshold_pct`; with `record`, updates this machine's record.
/// Fails on a regression only with `--baseline NAME`.
pub(crate) fn bench(
    root: &Path,
    mode: &Mode<'_>,
    filter: Option<&str>,
    threshold_pct: f64,
    record: bool,
) -> Result<(), String> {
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let criterion: PathBuf = env::var_os("CARGO_TARGET_DIR")
        .map_or_else(|| root.join("target"), |d| root.join(d))
        .join("criterion");
    if record {
        record::preflight(root)?;
    }
    let machine = record::machine(root);
    let record_dir = root.join(store::data_dir(&machine));
    let recorded = store::read_record(&record_dir);
    let use_record = matches!(mode, Mode::Default) && !recorded.is_empty();
    if matches!(mode, Mode::Default) && !use_record {
        println!(
            "bench: no record for `{machine}` ({}/): comparing with each benchmark's previous run",
            store::data_dir(&machine)
        );
    }
    if use_record {
        let n = store::load(&record_dir, &criterion)?;
        println!("bench: comparing with the record for `{machine}` ({n} benchmarks)");
        warn_if_toolchain_differs(root, &record_dir);
    }
    if let Mode::Compare(_) = mode {
        // Stale change files from an earlier comparison would be read as
        // this one's: remove them first.
        for c in changes(&criterion) {
            let _ = fs::remove_dir_all(criterion.join(&c.name).join("change"));
        }
    }
    let flag = match mode {
        Mode::Save(n) => Some(("--save-baseline", *n)),
        Mode::Compare(n) => Some(("--baseline", *n)),
        // Lenient: a benchmark the record doesn't have runs uncompared.
        Mode::Default if use_record => Some(("--baseline-lenient", store::BASELINE)),
        Mode::Default | Mode::Local => None,
    };
    let started = SystemTime::now();
    run_criterion(root, &cargo, flag, filter)?;
    let mut rows = table::collect(&criterion, started);
    println!("\n{}", table::format(&mut rows));
    let against = match mode {
        Mode::Compare(name) => format!("baseline `{name}`"),
        Mode::Default if use_record => format!("the record for `{machine}`"),
        _ => "each benchmark's previous run".to_owned(),
    };
    println!(
        "Time: the mean per iteration; ±: half its 95% confidence interval; Change: from {against}."
    );
    if use_record {
        warn_if_not_compared(&rows, &store::ids(&recorded));
    }
    if record {
        write_record(
            root, &criterion, started, filter, &against, &recorded, &rows,
        )?;
    }
    if let Mode::Save(name) = mode {
        println!(
            "bench: saved baseline `{name}` under {}",
            criterion.display()
        );
    }
    let compared = matches!(mode, Mode::Compare(_)) || use_record;
    if !compared {
        return Ok(());
    }
    let slower = report(&rows, threshold_pct, &against);
    match mode {
        Mode::Compare(_) if slower > 0 => Err(format!(
            "{slower} benchmark(s) slower than {against} by more than {threshold_pct}%"
        )),
        _ => Ok(()),
    }
}

/// Lists what moved past `threshold_pct`, faster and slower; returns how
/// many got slower.
fn report(rows: &[table::Row], threshold_pct: f64, against: &str) -> usize {
    let moved = rows
        .iter()
        .filter_map(|r| {
            r.change.map(|change| Change {
                name: r.id.clone(),
                change,
            })
        })
        .collect();
    let (worse, better) = classify(moved, threshold_pct / 100.0);
    for c in &better {
        println!("bench: faster  {:+6.1}%  {}", c.change * 100.0, c.name);
    }
    for c in &worse {
        println!("bench: SLOWER  {:+6.1}%  {}", c.change * 100.0, c.name);
    }
    if worse.is_empty() {
        println!("bench: nothing slower than {against} by more than {threshold_pct}%");
    }
    worse.len()
}

/// `--record`: this run merged into the machine's record (all of it
/// replaced after a full run, the measured benchmarks after a filtered
/// one), its table rebuilt from the merged data, and the whole proposed.
fn write_record(
    root: &Path,
    criterion: &Path,
    started: SystemTime,
    filter: Option<&str>,
    against: &str,
    recorded: &store::Files,
    rows: &[table::Row],
) -> Result<(), String> {
    let ctx = record::context(root, filter, against);
    let measured = store::measured(criterion, started);
    let next = store::merge(recorded, &measured, filter.is_none());
    let by_id = rows
        .iter()
        .filter_map(|r| r.change.map(|c| (r.id.clone(), c)))
        .collect();
    let mut record_rows = store::rows(&next, &by_id);
    let lock = fs::read_to_string(root.join("Cargo.lock")).unwrap_or_default();
    let meta = store::meta(
        &ctx.rustc,
        store::criterion_version(&lock).unwrap_or("?"),
        &ctx.commit,
        &ctx.date,
    );
    let files = record::changes(&ctx, recorded, &next, &meta, &mut record_rows);
    record::record(root, &ctx, &files)
}

/// `cargo bench --workspace --bench '*' -- [FLAG NAME] [FILTER]`.
fn run_criterion(
    root: &Path,
    cargo: &OsString,
    flag: Option<(&str, &str)>,
    filter: Option<&str>,
) -> Result<(), String> {
    let mut cmd = process::Command::new(cargo);
    // `--bench '*'`: the benches/ targets only. `--benches` also runs each
    // library's own tests in bench mode, whose harness rejects criterion's
    // options (`--save-baseline` and `--baseline` never worked with it).
    cmd.current_dir(root)
        .args(["bench", "--workspace", "--bench", "*", "--"]);
    if let Some((flag, name)) = flag {
        cmd.args([flag, name]);
    }
    if let Some(f) = filter {
        cmd.arg(f);
    }
    let status = cmd
        .status()
        .map_err(|e| format!("failed to run cargo bench: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!("cargo bench failed ({status})"))
    }
}

/// A record measured with another compiler or criterion doesn't compare
/// like for like: say so.
fn warn_if_toolchain_differs(root: &Path, record_dir: &Path) {
    let meta = fs::read_to_string(record_dir.join(store::META)).unwrap_or_default();
    let rustc = process::Command::new("rustc")
        .arg("--version")
        .current_dir(root)
        .output()
        .map(|o| String::from_utf8_lossy(&o.stdout).trim().to_owned())
        .unwrap_or_default();
    if let Some(was) = store::meta_value(&meta, "rustc")
        && was != rustc
    {
        println!("bench: warning: the record was measured with {was}, this run with {rustc}");
    }
    let lock = fs::read_to_string(root.join("Cargo.lock")).unwrap_or_default();
    if let (Some(was), Some(now)) = (
        store::meta_value(&meta, "criterion"),
        store::criterion_version(&lock),
    ) && was != now
    {
        println!(
            "bench: warning: the record was saved by criterion {was}, this run uses {now}: check it still compares (docs/benchmarks.md)"
        );
    }
}

/// Criterion skips a baseline it can't read (lenient mode) without a
/// word: a measured benchmark the record has, but with no change, means
/// the record wasn't used, most likely because a criterion upgrade
/// changed its files.
fn warn_if_not_compared(rows: &[table::Row], recorded: &std::collections::BTreeSet<String>) {
    let missed: Vec<&str> = rows
        .iter()
        .filter(|r| r.change.is_none() && recorded.contains(&r.id))
        .map(|r| r.id.as_str())
        .collect();
    if !missed.is_empty() {
        println!(
            "bench: warning: {} benchmark(s) in the record weren't compared with it (e.g. {}): has criterion's file format changed? (docs/benchmarks.md, \"Upgrading criterion\")",
            missed.len(),
            missed.first().copied().unwrap_or_default()
        );
    }
}

#[cfg(test)]
mod tests;
