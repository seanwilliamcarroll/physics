//! A machine's benchmark record: `docs/bench/<machine>.tsv`, one line per
//! benchmark (its id, mean and half its 95% confidence interval in ns, and
//! its declared throughput), after `#` lines saying the toolchain, commit
//! and date. `docs/bench/<machine>.md` is its table.
//!
//! Only what later runs need: `cargo xtask bench` compares each mean with
//! the recorded one (the change is new / recorded − 1, as criterion's own
//! change estimate is), and the table shows the rest. Criterion's sample
//! files aren't kept (they made a record ~300 files).

use std::collections::BTreeMap;
use std::fmt::Write as _;

use super::table::{Row, Throughput};

/// A record: each benchmark's row, by id (its change unset).
pub(crate) type Record = BTreeMap<String, Row>;

/// `docs/bench/<machine>.tsv`, relative to the workspace.
pub(crate) fn path(machine: &str) -> String {
    format!("docs/bench/{machine}.tsv")
}

const HEADER: &str = "id\tmean_ns\tci_half_ns\tthroughput";

/// The record's text: `meta` (`key=value` lines) as `#` lines, the
/// header, then one line per benchmark.
pub(crate) fn render(record: &Record, meta: &str) -> String {
    let mut out = String::new();
    for line in meta.lines() {
        let _ = writeln!(out, "# {line}");
    }
    let _ = writeln!(out, "{HEADER}");
    for r in record.values() {
        let throughput = match r.throughput {
            Some(Throughput::Elements(n)) => format!("elements:{n}"),
            Some(Throughput::Bytes(n)) => format!("bytes:{n}"),
            None => String::new(),
        };
        let _ = writeln!(
            out,
            "{}\t{}\t{}\t{throughput}",
            r.id,
            r.mean_ns,
            r.spread * r.mean_ns
        );
    }
    out
}

/// A record's text back as the record and its meta (`key=value` lines).
/// Lines it can't read are skipped.
pub(crate) fn parse(text: &str) -> (Record, String) {
    let mut record = Record::new();
    let mut meta = String::new();
    for line in text.lines() {
        if let Some(m) = line.strip_prefix("# ") {
            let _ = writeln!(meta, "{m}");
            continue;
        }
        if line == HEADER {
            continue;
        }
        let mut f = line.split('\t');
        let (Some(id), Some(mean), Some(half), throughput) =
            (f.next(), f.next(), f.next(), f.next())
        else {
            continue;
        };
        let (Ok(mean_ns), Ok(half)) = (mean.parse::<f64>(), half.parse::<f64>()) else {
            continue;
        };
        let throughput = throughput.and_then(|t| {
            let (kind, n) = t.split_once(':')?;
            let n = n.parse().ok()?;
            match kind {
                "elements" => Some(Throughput::Elements(n)),
                "bytes" => Some(Throughput::Bytes(n)),
                _ => None,
            }
        });
        record.insert(
            id.to_owned(),
            Row {
                id: id.to_owned(),
                mean_ns,
                spread: half / mean_ns,
                throughput,
                change: None,
            },
        );
    }
    (record, meta)
}

/// This run's rows as a record (their changes dropped).
pub(crate) fn from_rows(rows: &[Row]) -> Record {
    rows.iter()
        .map(|r| {
            (
                r.id.clone(),
                Row {
                    change: None,
                    ..r.clone()
                },
            )
        })
        .collect()
}

/// Each row's change from the recorded mean (new / recorded − 1); `None`
/// for a benchmark the record doesn't have.
pub(crate) fn compare(rows: &mut [Row], record: &Record) {
    for r in rows {
        r.change = record.get(&r.id).map(|old| r.mean_ns / old.mean_ns - 1.0);
    }
}

/// The record after this run: a full run (`full`) replaces it; a filtered
/// run replaces only the benchmarks it measured and keeps the rest.
pub(crate) fn merge(old: &Record, new: &Record, full: bool) -> Record {
    let mut out = if full { Record::new() } else { old.clone() };
    out.extend(new.iter().map(|(k, v)| (k.clone(), v.clone())));
    out
}

/// The record's rows for its table, with `changes` (by id) for those this
/// run measured.
pub(crate) fn rows(record: &Record, changes: &BTreeMap<String, f64>) -> Vec<Row> {
    record
        .values()
        .map(|r| Row {
            change: changes.get(&r.id).copied(),
            ..r.clone()
        })
        .collect()
}

/// The meta lines: `key=value`.
pub(crate) fn meta(rustc: &str, criterion: &str, commit: &str, date: &str) -> String {
    format!("rustc={rustc}\ncriterion={criterion}\ncommit={commit}\ndate={date}\n")
}

/// One value from the meta lines.
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
