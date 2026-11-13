//! A machine's benchmark record on disk: `docs/bench/<machine>/`, holding
//! for each benchmark the files criterion saves for a run
//! (`<benchmark dir>/{benchmark,estimates,sample,tukey}.json`, as under
//! `target/criterion/<benchmark dir>/new/`), plus `record.txt` (the
//! toolchain it was measured with). `docs/bench/<machine>.md` is its table.
//!
//! `cargo xtask bench` compares with it by copying it into criterion's own
//! directory as a baseline named `recorded`; criterion then compares the
//! samples as it does any baseline. Criterion's file format isn't a public
//! API: criterion is pinned (`Cargo.toml`), and after a bump a run must
//! still compare (`docs/benchmarks.md`, "Upgrading criterion").

use std::collections::{BTreeMap, BTreeSet};
use std::fs;
use std::path::Path;
use std::time::SystemTime;

use super::table::{self, Row};

/// The files criterion keeps per benchmark per run, and needs to compare.
pub(crate) const FILES: [&str; 4] = [
    "benchmark.json",
    "estimates.json",
    "sample.json",
    "tukey.json",
];

/// The baseline name a record is loaded as.
pub(crate) const BASELINE: &str = "recorded";

/// The toolchain file, at the record's top.
pub(crate) const META: &str = "record.txt";

/// A record's files, by path under its directory
/// (`sand_step/busy/640x360_chunks/sample.json`), with their text.
pub(crate) type Files = BTreeMap<String, String>;

/// `docs/bench/<machine>`, relative to the workspace.
pub(crate) fn data_dir(machine: &str) -> String {
    format!("docs/bench/{machine}")
}

/// The benchmark directory a file belongs to, if it's one of [`FILES`]:
/// `sand_step/busy/640x360_chunks` for `…/640x360_chunks/sample.json`.
fn benchmark_of(key: &str) -> Option<&str> {
    let (dir, file) = key.rsplit_once('/')?;
    FILES.contains(&file).then_some(dir)
}

/// Every file under `dir`, by path relative to it (`/`-separated).
fn read_tree(dir: &Path) -> Files {
    read_tree_names(dir)
        .into_iter()
        .filter_map(|k| fs::read_to_string(dir.join(&k)).ok().map(|t| (k, t)))
        .collect()
}

/// The record in `dir`: its benchmarks' files (not [`META`]).
pub(crate) fn read_record(dir: &Path) -> Files {
    read_tree(dir)
        .into_iter()
        .filter(|(k, _)| benchmark_of(k).is_some())
        .collect()
}

/// This run's files: for every benchmark under `criterion` whose
/// `new/estimates.json` was written at or after `since`, its [`FILES`]
/// from `new/`.
pub(crate) fn measured(criterion: &Path, since: SystemTime) -> Files {
    let fresh = |p: &Path| {
        fs::metadata(p)
            .and_then(|m| m.modified())
            .is_ok_and(|t| t >= since)
    };
    let mut out = Files::new();
    for key in read_tree_names(criterion) {
        let Some(dir) = key.strip_suffix("/new/estimates.json") else {
            continue;
        };
        if !fresh(&criterion.join(&key)) {
            continue;
        }
        for f in FILES {
            if let Ok(text) = fs::read_to_string(criterion.join(dir).join("new").join(f)) {
                out.insert(format!("{dir}/{f}"), text);
            }
        }
    }
    out
}

/// Every file's path under `dir`, relative to it and `/`-separated (no
/// contents: criterion's directory also holds old runs).
fn read_tree_names(dir: &Path) -> Vec<String> {
    let mut out = Vec::new();
    let mut stack = vec![dir.to_path_buf()];
    while let Some(d) = stack.pop() {
        let Ok(entries) = fs::read_dir(&d) else {
            continue;
        };
        for e in entries.flatten() {
            let path = e.path();
            if path.is_dir() {
                stack.push(path);
            } else if let Ok(rel) = path.strip_prefix(dir) {
                let key = rel
                    .components()
                    .map(|c| c.as_os_str().to_string_lossy())
                    .collect::<Vec<_>>()
                    .join("/");
                out.push(key);
            }
        }
    }
    out
}

/// The record after this run: a full run (`full`) replaces it; a filtered
/// run replaces only the benchmarks it measured and keeps the rest.
pub(crate) fn merge(old: &Files, new: &Files, full: bool) -> Files {
    if full {
        return new.clone();
    }
    let rerun: BTreeSet<&str> = new.keys().filter_map(|k| benchmark_of(k)).collect();
    let mut out: Files = old
        .iter()
        .filter(|(k, _)| benchmark_of(k).is_some_and(|b| !rerun.contains(b)))
        .map(|(k, v)| (k.clone(), v.clone()))
        .collect();
    out.extend(new.iter().map(|(k, v)| (k.clone(), v.clone())));
    out
}

/// One table row per benchmark in `files`, with `changes` (by benchmark
/// id) for those this run measured.
pub(crate) fn rows(files: &Files, changes: &BTreeMap<String, f64>) -> Vec<Row> {
    let dirs: BTreeSet<&str> = files.keys().filter_map(|k| benchmark_of(k)).collect();
    dirs.into_iter()
        .filter_map(|d| {
            let b = files.get(&format!("{d}/benchmark.json"))?;
            let e = files.get(&format!("{d}/estimates.json"))?;
            let mut r = table::row(b, e, None)?;
            r.change = changes.get(&r.id).copied();
            Some(r)
        })
        .collect()
}

/// The benchmark ids a record holds.
pub(crate) fn ids(files: &Files) -> BTreeSet<String> {
    rows(files, &BTreeMap::new())
        .into_iter()
        .map(|r| r.id)
        .collect()
}

/// Loads the record in `dir` into `criterion` as the baseline
/// [`BASELINE`] (`<benchmark dir>/recorded/`), after removing every
/// earlier one (a benchmark dropped from the record mustn't compare with a
/// stale copy). Returns how many benchmarks it holds.
pub(crate) fn load(dir: &Path, criterion: &Path) -> Result<usize, String> {
    for key in read_tree_names(criterion) {
        if let Some(bench) = key.strip_suffix(&format!("/{BASELINE}/estimates.json")) {
            let _ = fs::remove_dir_all(criterion.join(bench).join(BASELINE));
        }
    }
    let record = read_record(dir);
    let mut benches = BTreeSet::new();
    for (key, text) in &record {
        let (Some(bench), Some((_, file))) = (benchmark_of(key), key.rsplit_once('/')) else {
            continue;
        };
        let to = criterion.join(bench).join(BASELINE);
        fs::create_dir_all(&to).map_err(|e| format!("{}: {e}", to.display()))?;
        fs::write(to.join(file), text).map_err(|e| format!("{}: {e}", to.display()))?;
        benches.insert(bench);
    }
    Ok(benches.len())
}

/// [`META`]'s text: `key=value` lines.
pub(crate) fn meta(rustc: &str, criterion: &str, commit: &str, date: &str) -> String {
    format!("rustc={rustc}\ncriterion={criterion}\ncommit={commit}\ndate={date}\n")
}

/// One value from [`META`]'s text.
pub(crate) fn meta_value<'a>(text: &'a str, key: &str) -> Option<&'a str> {
    text.lines()
        .find_map(|l| l.split_once('=').filter(|(k, _)| *k == key).map(|(_, v)| v))
}

/// Criterion's version, from `Cargo.lock`'s text.
pub(crate) fn criterion_version(lock: &str) -> Option<&str> {
    let (_, rest) = lock.split_once("name = \"criterion\"\nversion = \"")?;
    rest.split_once('"').map(|(v, _)| v)
}

#[cfg(test)]
mod tests;
