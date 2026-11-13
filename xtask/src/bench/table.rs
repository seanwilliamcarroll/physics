//! The results table `cargo xtask bench` prints after a run, read from the
//! files criterion saves for each benchmark (`target/criterion/<id>/`):
//! `new/benchmark.json` (its id and declared throughput),
//! `new/estimates.json` (the mean and its 95% confidence interval) and,
//! after a comparison, `change/estimates.json` (the mean's relative
//! change). Criterion has no JSON reader here (xtask's one dependency is
//! clap): the few numbers needed are found by key.

use std::fmt::Write as _;
use std::fs;
use std::path::Path;
use std::time::SystemTime;

use crate::bench_wasm::format_ns;

/// One benchmark's line in the table.
#[derive(Debug, PartialEq)]
pub(crate) struct Row {
    pub id: String,
    /// The mean time per iteration, ns.
    pub mean_ns: f64,
    /// The 95% confidence interval's half-width, as a fraction of the mean.
    pub spread: f64,
    /// What one iteration processes, if the bench declared it.
    pub throughput: Option<Throughput>,
    /// The mean's relative change from the compared baseline (0.1 is 10%
    /// slower), if this run was a comparison.
    pub change: Option<f64>,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub(crate) enum Throughput {
    Elements(f64),
    Bytes(f64),
}

/// The number after the first `"key":` in `json`.
fn number(json: &str, key: &str) -> Option<f64> {
    let (_, rest) = json.split_once(&format!("\"{key}\":"))?;
    let end = rest.find([',', '}'])?;
    rest.get(..end)?.trim().parse().ok()
}

/// The string after the first `"key":` in `json` (no escapes: ids are
/// plain).
fn string<'a>(json: &'a str, key: &str) -> Option<&'a str> {
    let (_, rest) = json.split_once(&format!("\"{key}\":\""))?;
    rest.split_once('"').map(|(s, _)| s)
}

/// A row from `benchmark.json` and `estimates.json`'s text, with the
/// change if there was one. `None` if either is missing what's needed.
pub(crate) fn row(benchmark: &str, estimates: &str, change: Option<f64>) -> Option<Row> {
    let id = string(benchmark, "full_id")?.to_owned();
    // The mean's object comes first in estimates.json: the first bounds
    // and point estimate after `"mean":` are its own.
    let (_, mean) = estimates.split_once("\"mean\":")?;
    let (lo, hi, mean_ns) = (
        number(mean, "lower_bound")?,
        number(mean, "upper_bound")?,
        number(mean, "point_estimate")?,
    );
    let throughput = benchmark.split_once("\"throughput\":").and_then(|(_, t)| {
        number(t, "Elements")
            .map(Throughput::Elements)
            .or_else(|| number(t, "Bytes").map(Throughput::Bytes))
    });
    Some(Row {
        id,
        mean_ns,
        spread: (hi - lo) / 2.0 / mean_ns,
        throughput,
        change,
    })
}

/// `per_second` with an SI prefix, three significant figures.
fn rate(per_second: f64, unit: &str) -> String {
    let (value, prefix) = [(1e9, "G"), (1e6, "M"), (1e3, "K")]
        .into_iter()
        .find(|&(scale, _)| per_second >= scale)
        .map_or((per_second, ""), |(scale, p)| (per_second / scale, p));
    format!("{value:.1} {prefix}{unit}/s")
}

/// A row's cells after its id: time, ±, throughput, change.
fn cells(r: &Row) -> [String; 4] {
    let throughput = r.throughput.map_or_else(String::new, |t| {
        let (per_iter, unit) = match t {
            Throughput::Elements(n) => (n, "elem"),
            Throughput::Bytes(n) => (n, "B"),
        };
        rate(per_iter / (r.mean_ns * 1e-9), unit)
    });
    [
        format_ns(r.mean_ns),
        format!("{:.1}%", r.spread * 100.0),
        throughput,
        r.change
            .map_or_else(String::new, |c| format!("{:+.1}%", c * 100.0)),
    ]
}

/// The table, one line per row, sorted by id.
pub(crate) fn format(rows: &mut [Row]) -> String {
    rows.sort_by(|a, b| a.id.cmp(&b.id));
    let width = rows.iter().map(|r| r.id.len()).max().unwrap_or(0).max(9);
    let mut out = String::new();
    let _ = writeln!(
        out,
        "{:<width$}  {:>10}  {:>6}  {:>16}  {:>7}",
        "Benchmark", "Time", "±", "Throughput", "Change"
    );
    let _ = writeln!(out, "{}", "-".repeat(width + 47));
    for r in rows.iter() {
        let [time, spread, throughput, change] = cells(r);
        let _ = writeln!(
            out,
            "{:<width$}  {time:>10}  {spread:>6}  {throughput:>16}  {change:>7}",
            r.id
        );
    }
    out
}

/// The same table in Markdown (for `--record`), sorted by id.
pub(crate) fn markdown(rows: &mut [Row]) -> String {
    rows.sort_by(|a, b| a.id.cmp(&b.id));
    let mut out =
        String::from("| Benchmark | Time | ± | Throughput | Change |\n|---|---:|---:|---:|---:|\n");
    for r in rows.iter() {
        let [time, spread, throughput, change] = cells(r);
        let _ = writeln!(
            out,
            "| `{}` | {time} | {spread} | {throughput} | {change} |",
            r.id
        );
    }
    out
}

/// Every benchmark under `criterion` that this run measured: its
/// `new/estimates.json` was written at or after `since`. (Criterion keeps
/// every benchmark it ever ran there; a filtered run touches only some.)
pub(crate) fn collect(criterion: &Path, since: SystemTime) -> Vec<Row> {
    let fresh = |p: &Path| {
        fs::metadata(p)
            .and_then(|m| m.modified())
            .is_ok_and(|t| t >= since)
    };
    let mut out = Vec::new();
    let mut stack = vec![criterion.to_path_buf()];
    while let Some(dir) = stack.pop() {
        let Ok(entries) = fs::read_dir(&dir) else {
            continue;
        };
        for e in entries.flatten() {
            let path = e.path();
            if !path.is_dir() {
                continue;
            }
            let new = path.join("new");
            let estimates = new.join("estimates.json");
            if !fresh(&estimates) {
                stack.push(path);
                continue;
            }
            let change_file = path.join("change").join("estimates.json");
            let change = fresh(&change_file)
                .then(|| fs::read_to_string(&change_file).ok())
                .flatten()
                .as_deref()
                .and_then(crate::bench_wasm::mean_point_estimate);
            if let (Ok(b), Ok(e)) = (
                fs::read_to_string(new.join("benchmark.json")),
                fs::read_to_string(&estimates),
            ) && let Some(r) = row(&b, &e, change)
            {
                out.push(r);
            }
        }
    }
    out
}

#[cfg(test)]
mod tests;
