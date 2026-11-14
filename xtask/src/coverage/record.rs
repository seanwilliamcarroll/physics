//! The coverage record, `docs/coverage.md`: lines and functions covered
//! per crate and per file, as of a commit. `cargo xtask coverage`
//! compares each run with it and reports where coverage fell; `--record`
//! replaces it (in a pull request, `github.rs`).
//!
//! One record for every machine: coverage depends on the code and the
//! tests, not on the machine that ran them. The comparison counts
//! *missed* lines and functions, not percentages: adding code that is
//! fully covered never reads as a drop.

use std::collections::BTreeMap;
use std::fmt::Write as _;

use super::{Counts, ratio};

/// Where the record lives.
pub(crate) const PATH: &str = "docs/coverage.md";

/// The README's coverage badge: shields.io's endpoint format, drawn from
/// the record's total (README.md links it).
pub(crate) const BADGE: &str = "docs/coverage-badge.json";

/// What the record says about the run it came from.
pub(crate) struct Meta {
    pub date: String,
    pub commit: String,
    pub subject: String,
    pub rustc: String,
}

/// One file's (or crate's) counts as the record keeps them.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) struct Kept {
    pub lines: u32,
    pub missed_lines: u32,
    pub functions: u32,
    pub missed_functions: u32,
}

impl From<&Counts> for Kept {
    fn from(c: &Counts) -> Self {
        Self {
            lines: c.lines,
            missed_lines: c.missed_lines,
            functions: c.functions,
            missed_functions: c.missed_functions,
        }
    }
}

/// `ratio` without its padding.
fn cell(total: u32, missed: u32) -> String {
    ratio(total, missed).trim().to_owned()
}

/// The record's text.
pub(crate) fn document(meta: &Meta, crates: &[Counts], total: &Counts, files: &[Counts]) -> String {
    let mut out = String::from(
        "# Coverage\n\nLines and functions the native Rust tests run (`cargo xtask coverage`, \
         `docs/04-testing.md`, \"Coverage\"). Recorded by `cargo xtask coverage --record`; \
         every later run compares with it.\n\n",
    );
    let _ = writeln!(out, "- **Commit:** `{}` ({})", meta.commit, meta.subject);
    let _ = writeln!(out, "- **Date:** {}", meta.date);
    let _ = writeln!(out, "- **Toolchain:** {}", meta.rustc);
    out.push_str("\n## By crate\n\n| Crate | Lines | Functions |\n|---|---:|---:|\n");
    for c in crates {
        let _ = writeln!(
            out,
            "| `{}` | {} | {} |",
            c.name,
            cell(c.lines, c.missed_lines),
            cell(c.functions, c.missed_functions)
        );
    }
    let _ = writeln!(
        out,
        "| **total** | {} | {} |",
        cell(total.lines, total.missed_lines),
        cell(total.functions, total.missed_functions)
    );
    out.push_str("\n## By file\n\n| File | Lines | Functions |\n|---|---:|---:|\n");
    for f in files {
        let _ = writeln!(
            out,
            "| `{}` | {} | {} |",
            f.name,
            cell(f.lines, f.missed_lines),
            cell(f.functions, f.missed_functions)
        );
    }
    out
}

/// The badge for `total`'s lines covered: shields.io's endpoint JSON
/// (`https://shields.io/badges/endpoint-badge`), the share to one decimal:
/// green from 95%, yellow-green from 90, yellow from 80, orange from 70,
/// red below.
pub(crate) fn badge(total: &Counts) -> String {
    let covered = total.lines.saturating_sub(total.missed_lines);
    let pct = if total.lines == 0 {
        0.0
    } else {
        100.0 * f64::from(covered) / f64::from(total.lines)
    };
    let color = match pct {
        p if p >= 95.0 => "brightgreen",
        p if p >= 90.0 => "yellowgreen",
        p if p >= 80.0 => "yellow",
        p if p >= 70.0 => "orange",
        _ => "red",
    };
    format!(
        "{{\"schemaVersion\":1,\"label\":\"coverage\",\"message\":\"{pct:.1}%\",\"color\":\"{color}\"}}\n"
    )
}

/// `covered/total` from a cell (`97.34% (2820/2897)`), as (total,
/// missed); `-` (nothing to cover) is (0, 0).
fn parse_cell(cell: &str) -> Option<(u32, u32)> {
    let cell = cell.trim();
    if cell == "-" {
        return Some((0, 0));
    }
    let (_, rest) = cell.split_once('(')?;
    let (covered, rest) = rest.split_once('/')?;
    let (total, _) = rest.split_once(')')?;
    let (covered, total): (u32, u32) = (covered.parse().ok()?, total.parse().ok()?);
    Some((total, total.checked_sub(covered)?))
}

/// The files in a record's text, by path.
pub(crate) fn parse(text: &str) -> BTreeMap<String, Kept> {
    let Some((_, files)) = text.split_once("## By file") else {
        return BTreeMap::new();
    };
    files
        .lines()
        .filter_map(|line| {
            let mut cols = line.strip_prefix("| `")?.split('|');
            let name = cols.next()?.trim().strip_suffix('`')?;
            let (lines, missed_lines) = parse_cell(cols.next()?)?;
            let (functions, missed_functions) = parse_cell(cols.next()?)?;
            Some((
                name.to_owned(),
                Kept {
                    lines,
                    missed_lines,
                    functions,
                    missed_functions,
                },
            ))
        })
        .collect()
}

/// Where this run's coverage is short of the record's, as lines to print:
/// files with more lines or functions missed, and new files that aren't
/// fully covered. Empty if nothing fell.
pub(crate) fn fell(record: &BTreeMap<String, Kept>, now: &[Counts]) -> Vec<String> {
    let mut out = Vec::new();
    for f in now {
        match record.get(&f.name) {
            Some(was) => {
                let more_lines = f.missed_lines > was.missed_lines;
                let more_functions = f.missed_functions > was.missed_functions;
                if more_lines || more_functions {
                    out.push(format!(
                        "{}: lines missed {} -> {}, functions missed {} -> {}",
                        f.name,
                        was.missed_lines,
                        f.missed_lines,
                        was.missed_functions,
                        f.missed_functions
                    ));
                }
            }
            None if f.missed_lines > 0 || f.missed_functions > 0 => out.push(format!(
                "{} (new): lines {}, functions {}",
                f.name,
                cell(f.lines, f.missed_lines),
                cell(f.functions, f.missed_functions)
            )),
            None => {}
        }
    }
    out
}

/// How many files have fewer lines or functions missed than the record.
pub(crate) fn rose(record: &BTreeMap<String, Kept>, now: &[Counts]) -> usize {
    now.iter()
        .filter(|f| {
            record.get(&f.name).is_some_and(|was| {
                f.missed_lines < was.missed_lines || f.missed_functions < was.missed_functions
            })
        })
        .count()
}

#[cfg(test)]
mod tests;
