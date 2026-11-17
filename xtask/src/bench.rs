//! `cargo xtask bench`: every criterion benchmark in the workspace (or
//! those matching a filter), run and compared (`docs/benchmarks.md`):
//! by default with this machine's committed record of means (`store.rs`), else
//! with the previous local run, or with a named local baseline. Then a
//! table of the results (`table.rs`), and the benchmarks whose mean moved
//! past a threshold. Only `--baseline NAME` fails on a regression; the
//! others report. `--record` updates the record (`record.rs`). `--level`
//! picks the build (`level.rs`: the baseline, x86-64-v3, native, or v8 for
//! the wasm in Node), each with its own record; `bench-all` runs every
//! level this machine has, and with `--record` proposes them together.

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::Path;
use std::process;
use std::time::SystemTime;

pub(crate) mod level;
mod record;
mod store;
mod table;

use crate::bench_wasm::mean_point_estimate;
use level::Level;

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

/// One level's run, done: how many benchmarks got slower past the
/// threshold, and with `--record`, the record's files and context.
struct Run {
    slower: usize,
    record: Option<record::LevelRecord>,
}

/// Runs every bench (`cargo bench --workspace --bench '*'`, or those matching
/// `filter`) at `level`, compared as `mode` says; prints the table and what
/// moved past `threshold_pct`; with `record`, proposes this machine's
/// record for the level. Fails on a regression only with `--baseline NAME`.
pub(crate) fn bench(
    root: &Path,
    mode: &Mode<'_>,
    filter: Option<&str>,
    threshold_pct: f64,
    record: bool,
    level: Level,
) -> Result<(), String> {
    if record {
        crate::github::preflight(root, "bench")?;
    }
    let run = run_level(root, mode, filter, threshold_pct, record, level)?;
    if let Some(r) = run.record {
        record::record(root, &[r])?;
    }
    let against = against(mode, true, &level.record_name(&record::machine(root)));
    outcome(mode, run.slower, &against, threshold_pct)
}

/// `cargo xtask bench-all`: every level this machine has (`level.rs`),
/// each compared with its record; with `record`, every level's record in
/// one pull request.
pub(crate) fn bench_all(
    root: &Path,
    filter: Option<&str>,
    threshold_pct: f64,
    record: bool,
) -> Result<(), String> {
    if record {
        crate::github::preflight(root, "bench-all")?;
    }
    let levels = level::available(level::host(root));
    let names: Vec<&str> = levels.iter().map(|l| l.name()).collect();
    println!("bench-all: {}", names.join(", "));
    let mut runs = Vec::new();
    let mut slower = Vec::new();
    for l in levels {
        println!("\n=== bench-all: {}", l.describe());
        let run = run_level(root, &Mode::Default, filter, threshold_pct, record, l)?;
        if run.slower > 0 {
            slower.push(format!("{} ({})", l.name(), run.slower));
        }
        runs.extend(run.record);
    }
    if record {
        record::record(root, &runs)?;
    }
    if slower.is_empty() {
        println!("\nbench-all: nothing slower than its record by more than {threshold_pct}%");
    } else {
        println!(
            "\nbench-all: slower than the record past {threshold_pct}%: {}",
            slower.join(", ")
        );
    }
    Ok(())
}

/// One level: build, run, table, report; the record's files if asked.
fn run_level(
    root: &Path,
    mode: &Mode<'_>,
    filter: Option<&str>,
    threshold_pct: f64,
    record: bool,
    level: Level,
) -> Result<Run, String> {
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let target =
        env::var_os("CARGO_TARGET_DIR").map_or_else(|| root.join("target"), |d| root.join(d));
    let target = level.target_dir(&target);
    let criterion = target.join("criterion");
    let name = level.record_name(&record::machine(root));
    let (recorded, recorded_meta) =
        store::parse(&fs::read_to_string(root.join(store::path(&name))).unwrap_or_default());
    let use_record = matches!(mode, Mode::Default) && !recorded.is_empty();
    if matches!(mode, Mode::Default) && !use_record {
        println!(
            "bench: no record for `{name}` ({}): comparing with each benchmark's previous run",
            store::path(&name)
        );
    }
    if use_record {
        println!(
            "bench: comparing with the record for `{name}` ({} benchmarks)",
            recorded.len()
        );
        warn_if_toolchain_differs(root, &recorded_meta);
    }
    if let Mode::Compare(_) = mode {
        // Stale change files from an earlier comparison would be read as
        // this one's: remove them first.
        for c in changes(&criterion) {
            let _ = fs::remove_dir_all(criterion.join(&c.name).join("change"));
        }
    }
    let started = SystemTime::now();
    if level.is_wasm() {
        if !matches!(mode, Mode::Default | Mode::Local) {
            return Err(format!(
                "bench: --save and --baseline aren't supported at `{}`: it compares with its record or its previous run",
                level.name()
            ));
        }
        run_wasm(root, &cargo, &target, &criterion, filter)?;
    } else {
        run_criterion(root, &cargo, &target, level, flag(mode), filter)?;
    }
    let mut rows = table::collect(&criterion, started);
    if use_record {
        // The change from the recorded mean, not criterion's (which is
        // from its own previous run here).
        store::compare(&mut rows, &recorded);
    }
    println!("\n{}", table::format(&mut rows));
    let against = against(mode, use_record, &name);
    println!(
        "Time: the mean per iteration; ±: half its 95% confidence interval; Change: from {against}."
    );
    let files = record.then(|| {
        let moved = use_record.then(|| moved(&rows, threshold_pct));
        record_files(root, filter, &against, &recorded, &rows, level, moved)
    });
    if let Mode::Save(name) = mode {
        println!(
            "bench: saved baseline `{name}` under {}",
            criterion.display()
        );
    }
    let slower = if compares(mode, use_record) {
        report(&rows, threshold_pct, &against)
    } else {
        0
    };
    Ok(Run {
        slower,
        record: files,
    })
}

/// The mode the command line asks for: `--save`, then `--baseline`, then
/// `--compare-local`; else the default (the record, if there is one).
pub(crate) const fn mode<'a>(
    save: Option<&'a str>,
    baseline: Option<&'a str>,
    compare_local: bool,
) -> Mode<'a> {
    match (save, baseline) {
        (Some(n), _) => Mode::Save(n),
        (None, Some(n)) => Mode::Compare(n),
        (None, None) if compare_local => Mode::Local,
        (None, None) => Mode::Default,
    }
}

/// Criterion's baseline flag for `mode`: none to compare with its own
/// last run (and, with a record, xtask compares with that afterwards).
fn flag<'a>(mode: &Mode<'a>) -> Option<(&'static str, &'a str)> {
    match mode {
        Mode::Save(n) => Some(("--save-baseline", n)),
        Mode::Compare(n) => Some(("--baseline", n)),
        Mode::Default | Mode::Local => None,
    }
}

/// What the Change column compares with, in words.
fn against(mode: &Mode<'_>, use_record: bool, machine: &str) -> String {
    match mode {
        Mode::Compare(name) => format!("baseline `{name}`"),
        Mode::Default if use_record => format!("the record for `{machine}`"),
        _ => "each benchmark's previous run".to_owned(),
    }
}

/// Whether the run is compared with something worth listing changes
/// against (a named baseline or the record), not just its last run.
const fn compares(mode: &Mode<'_>, use_record: bool) -> bool {
    matches!(mode, Mode::Compare(_)) || (matches!(mode, Mode::Default) && use_record)
}

/// Only `--baseline NAME` fails on a regression; the record and the last
/// run are reported.
fn outcome(
    mode: &Mode<'_>,
    slower: usize,
    against: &str,
    threshold_pct: f64,
) -> Result<(), String> {
    match mode {
        Mode::Compare(_) if slower > 0 => Err(format!(
            "{slower} benchmark(s) slower than {against} by more than {threshold_pct}%"
        )),
        _ => Ok(()),
    }
}

/// What moved past a threshold against the record: slower (worst first)
/// and faster (best first), and the threshold, whole percent.
#[derive(Debug, PartialEq)]
pub(crate) struct Moved {
    pub slower: Vec<Change>,
    pub faster: Vec<Change>,
    pub threshold_pct: f64,
}

/// The rows' changes past `threshold_pct`, sorted ([`classify`]).
fn moved(rows: &[table::Row], threshold_pct: f64) -> Moved {
    let changes = rows
        .iter()
        .filter_map(|r| {
            r.change.map(|change| Change {
                name: r.id.clone(),
                change,
            })
        })
        .collect();
    let (slower, faster) = classify(changes, threshold_pct / 100.0);
    Moved {
        slower,
        faster,
        threshold_pct,
    }
}

/// Lists what moved past `threshold_pct`, faster and slower; returns how
/// many got slower.
fn report(rows: &[table::Row], threshold_pct: f64, against: &str) -> usize {
    let Moved {
        slower: worse,
        faster: better,
        ..
    } = moved(rows, threshold_pct);
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

/// `--record`: this run merged into the level's record (all of it
/// replaced after a full run, the measured benchmarks after a filtered
/// one), and its table rebuilt from the merged record: the files to
/// propose, with their context.
fn record_files(
    root: &Path,
    filter: Option<&str>,
    against: &str,
    recorded: &store::Record,
    rows: &[table::Row],
    level: Level,
    moved: Option<Moved>,
) -> record::LevelRecord {
    let mut ctx = record::context(root, filter, against, level);
    ctx.moved = moved;
    let next = store::merge(recorded, &store::from_rows(rows), filter.is_none());
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
        level.name(),
        level.rustflags().unwrap_or(""),
    );
    let files = record::changes(&ctx, &store::render(&next, &meta), &mut record_rows);
    (ctx, files)
}

/// `cargo bench --workspace --bench '*' -- [FLAG NAME] [FILTER]`, built
/// in `target` with the level's `RUSTFLAGS` (and none inherited: a record
/// says what it was built with).
fn run_criterion(
    root: &Path,
    cargo: &OsString,
    target: &Path,
    level: Level,
    flag: Option<(&str, &str)>,
    filter: Option<&str>,
) -> Result<(), String> {
    let mut cmd = process::Command::new(cargo);
    cmd.env("CARGO_TARGET_DIR", target).env_remove("RUSTFLAGS");
    if let Some(flags) = level.rustflags() {
        cmd.env("RUSTFLAGS", flags);
    }
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

/// The wasm level: every bench built for wasm32-wasip1 (`simd128` from
/// `.cargo/config.toml`) in `target`, then each run in Node
/// (`experiments/sweep/wasi-node.mjs`: the program sees only `criterion`,
/// as `/criterion`), so criterion's files land where the table reads them.
fn run_wasm(
    root: &Path,
    cargo: &OsString,
    target: &Path,
    criterion: &Path,
    filter: Option<&str>,
) -> Result<(), String> {
    let built = process::Command::new(cargo)
        .current_dir(root)
        .env("CARGO_TARGET_DIR", target)
        .env_remove("RUSTFLAGS")
        .args(["bench", "--workspace", "--bench", "*", "--no-run"])
        .args(["--target", "wasm32-wasip1", "--message-format=json"])
        .output()
        .map_err(|e| format!("failed to build the benches for wasm: {e}"))?;
    if !built.status.success() {
        return Err(format!(
            "building the benches for wasm failed:\n{}",
            String::from_utf8_lossy(&built.stderr)
        ));
    }
    fs::create_dir_all(criterion)
        .map_err(|e| format!("failed to create {}: {e}", criterion.display()))?;
    let shim = root.join("experiments").join("sweep").join("wasi-node.mjs");
    for exe in level::executables(&String::from_utf8_lossy(&built.stdout)) {
        let mut cmd = process::Command::new("node");
        cmd.current_dir(root)
            .arg("--no-warnings")
            .arg(&shim)
            .arg(&exe)
            .arg(criterion)
            .arg("--bench");
        if let Some(f) = filter {
            cmd.arg(f);
        }
        let status = cmd
            .status()
            .map_err(|e| format!("failed to run node: {e}"))?;
        if !status.success() {
            return Err(format!("{} failed in Node ({status})", exe.display()));
        }
    }
    Ok(())
}

/// A record measured with another compiler or criterion doesn't compare
/// like for like: say so. `meta`: the record's meta lines.
fn warn_if_toolchain_differs(root: &Path, meta: &str) {
    let rustc = process::Command::new("rustc")
        .arg("--version")
        .current_dir(root)
        .output()
        .map(|o| String::from_utf8_lossy(&o.stdout).trim().to_owned())
        .unwrap_or_default();
    let lock = fs::read_to_string(root.join("Cargo.lock")).unwrap_or_default();
    for w in toolchain_warnings(meta, &rustc, store::criterion_version(&lock)) {
        println!("bench: warning: {w}");
    }
}

/// How the record's toolchain (`meta`, its meta lines) differs from this
/// run's.
fn toolchain_warnings(meta: &str, rustc: &str, criterion: Option<&str>) -> Vec<String> {
    let mut out = Vec::new();
    if let Some(was) = store::meta_value(meta, "rustc")
        && was != rustc
    {
        out.push(format!(
            "the record was measured with {was}, this run with {rustc}"
        ));
    }
    if let (Some(was), Some(now)) = (store::meta_value(meta, "criterion"), criterion)
        && was != now
    {
        out.push(format!(
            "the record was measured with criterion {was}, this run with {now}: its means may not compare like for like"
        ));
    }
    out
}

#[cfg(test)]
mod tests;
