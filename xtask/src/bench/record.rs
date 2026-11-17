//! `cargo xtask bench --record`: this machine's record, updated from this
//! run and proposed as a pull request. The record is each benchmark's mean
//! (`docs/bench/<name>.tsv`, `store.rs`: what later runs compare with) and
//! its table (`docs/bench/<name>.md`, with the date, the commit, the
//! machine, the level and the toolchain). One per machine and level
//! (`level.rs`; the name is the machine's, plus the level's past the
//! baseline): numbers from different machines or builds don't compare.
//! `bench-all --record` proposes every level's in one pull request. Git's
//! history keeps the earlier records.
//!
//! The pull request is made through GitHub's API (`gh api`): a tree with
//! the record's files on top of `main`, a commit, a branch, then `gh pr
//! create`. Nothing local changes (no checkout, no commit, so no hooks:
//! the pre-push hook would run the whole suite for a docs change). It's
//! never merged here. Without a working `gh` login, the files are written
//! into `docs/bench/` instead, to commit by hand.

use std::fmt::Write as _;
use std::path::Path;

use super::Moved;
use super::level::Level;
use super::store;
use super::table::{self, Row};
use crate::github::{self, output};

/// A record's files by path in the repository, each its new text (`None`:
/// removed).
pub(crate) type Files = Vec<(String, Option<String>)>;

/// One level's run, ready to record: its context and its files.
pub(crate) type LevelRecord = (Context, Files);

/// What the record says about where and how it was measured.
pub(crate) struct Context {
    pub date: String,
    /// `HHMMSS`, for a branch name no other record has.
    pub time: String,
    pub machine: String,
    /// The build measured, and the record's name for it
    /// ([`Level::record_name`]).
    pub level: Level,
    pub name: String,
    pub system: String,
    pub cpus: usize,
    pub rustc: String,
    pub commit: String,
    pub subject: String,
    pub dirty: bool,
    pub filter: Option<String>,
    /// What the Change column compares with.
    pub against: String,
    /// What moved past the threshold against the previous record (`None`:
    /// there was none, a first record).
    pub moved: Option<Moved>,
}

/// The record's text.
pub(crate) fn document(ctx: &Context, rows: &mut [Row]) -> String {
    let mut out = format!("# Benchmarks, {}, {}\n\n", ctx.date, ctx.name);
    let _ = writeln!(
        out,
        "- **Commit:** `{}` ({}){}",
        ctx.commit,
        ctx.subject,
        if ctx.dirty {
            ", with uncommitted changes"
        } else {
            ""
        }
    );
    let _ = writeln!(
        out,
        "- **Machine:** {}, {} CPUs; {}",
        ctx.system, ctx.cpus, ctx.rustc
    );
    let _ = writeln!(out, "- **Level:** {}", ctx.level.describe());
    let _ = writeln!(
        out,
        "- **Run:** `cargo xtask bench{}{}`",
        match ctx.level {
            Level::Baseline => String::new(),
            other => format!(" --level {}", other.name()),
        },
        ctx.filter
            .as_deref()
            .map_or_else(String::new, |f| format!(" {f}"))
    );
    let _ = writeln!(
        out,
        "\nTime: the mean per iteration; ±: half its 95% confidence interval; \
         Change: from {}. Recorded by `cargo xtask bench --record` \
         (`docs/benchmarks.md`).\n",
        ctx.against
    );
    out.push_str(&table::markdown(rows));
    out
}

/// `docs/bench/<name>.md`.
pub(crate) fn path(name: &str) -> String {
    format!("docs/bench/{name}.md")
}

/// This machine's name for its record: `hostname -s`, lower case.
pub(crate) fn machine(root: &Path) -> String {
    output(root, "hostname", &["-s"]).map_or_else(|| "unknown".to_owned(), |h| h.to_lowercase())
}

/// Where and how this run was measured.
pub(crate) fn context(root: &Path, filter: Option<&str>, against: &str, level: Level) -> Context {
    let run = |p: &str, a: &[&str]| output(root, p, a).unwrap_or_else(|| "?".to_owned());
    let machine = machine(root);
    Context {
        date: run("date", &["+%Y-%m-%d"]),
        time: run("date", &["+%H%M%S"]),
        name: level.record_name(&machine),
        machine,
        level,
        system: run("uname", &["-sm"]),
        cpus: std::thread::available_parallelism().map_or(0, std::num::NonZero::get),
        rustc: run("rustc", &["--version"]),
        commit: run("git", &["rev-parse", "--short", "HEAD"]),
        subject: run("git", &["log", "-1", "--format=%s"]),
        dirty: output(root, "git", &["status", "--porcelain"]).is_some_and(|s| !s.is_empty()),
        filter: filter.map(str::to_owned),
        against: against.to_owned(),
        moved: None,
    }
}

/// The record's files after this run, by path in the repository: the
/// table, then the record (`record`, [`store::render`]'s text).
pub(crate) fn changes(
    ctx: &Context,
    record: &str,
    rows: &mut [Row],
) -> Vec<(String, Option<String>)> {
    vec![
        (path(&ctx.name), Some(document(ctx, rows))),
        (store::path(&ctx.name), Some(record.to_owned())),
    ]
}

/// Records runs: each level's files from [`changes`] (with its context),
/// together, as one pull request if `gh` is logged in, else written into
/// this checkout. `runs` is never empty.
pub(crate) fn record(root: &Path, runs: &[LevelRecord]) -> Result<(), String> {
    let Some((first, _)) = runs.first() else {
        return Ok(());
    };
    let (branch, title, body) = proposal(runs);
    let files: Files = runs.iter().flat_map(|(_, f)| f.iter().cloned()).collect();
    println!(
        "bench: recording {} level(s) for `{}`",
        runs.len(),
        first.machine
    );
    github::propose(root, &files, &branch, &title, &body)
}

/// The pull request's headline: every level's benchmarks that moved past
/// the threshold against its previous record, slower first (worst first),
/// then faster; or that nothing did; and which levels are first records.
pub(crate) fn headlines(runs: &[LevelRecord]) -> String {
    let threshold = runs
        .iter()
        .find_map(|(c, _)| c.moved.as_ref().map(|m| m.threshold_pct))
        .unwrap_or(10.0);
    let mut out = format!("## What moved, more than {threshold}% against the previous record\n\n");
    let mut lines = Vec::new();
    for (sign, pick) in [("slower", true), ("faster", false)] {
        for (ctx, _) in runs {
            let Some(m) = &ctx.moved else { continue };
            for c in if pick { &m.slower } else { &m.faster } {
                lines.push(format!(
                    "| {} | `{}` | {:+.1}% ({sign}) |",
                    ctx.name,
                    c.name,
                    c.change * 100.0
                ));
            }
        }
    }
    if lines.is_empty() {
        out.push_str("Nothing.\n");
    } else {
        out.push_str("| record | benchmark | change |\n|---|---|---|\n");
        for l in lines {
            let _ = writeln!(out, "{l}");
        }
    }
    let first: Vec<&str> = runs
        .iter()
        .filter(|(c, _)| c.moved.is_none())
        .map(|(c, _)| c.name.as_str())
        .collect();
    if !first.is_empty() {
        let _ = writeln!(
            out,
            "\nFirst records (nothing to compare with): {}.",
            first.join(", ")
        );
    }
    out.push('\n');
    out
}

/// The pull request's branch, title and body for `runs`: each level's
/// table, in turn. Pure.
pub(crate) fn proposal(runs: &[LevelRecord]) -> (String, String, String) {
    let Some((first, _)) = runs.first() else {
        return (String::new(), String::new(), String::new());
    };
    let names: Vec<&str> = runs.iter().map(|(c, _)| c.name.as_str()).collect();
    let (branch, title) = if let [only] = names.as_slice() {
        (
            format!("bench/{only}-{}-{}", first.date, first.time),
            format!("bench: results of {} on {only}", first.date),
        )
    } else {
        let levels: Vec<&str> = runs.iter().map(|(c, _)| c.level.name()).collect();
        (
            format!("bench/{}-all-{}-{}", first.machine, first.date, first.time),
            format!(
                "bench: results of {} on {} ({})",
                first.date,
                first.machine,
                levels.join(", ")
            ),
        )
    };
    let mut body = headlines(runs);
    for (ctx, files) in runs {
        let table = files
            .first()
            .and_then(|(_, t)| t.as_deref())
            .unwrap_or_default();
        let _ = writeln!(body, "{table}");
        let _ = writeln!(
            body,
            "The record for `{}`: its table and each benchmark's mean (`{}`), which later runs compare with.\n",
            ctx.name,
            store::path(&ctx.name)
        );
    }
    body.push_str(
        "Opened by `cargo xtask bench --record` (or `bench-all --record`); not merged by it.\n",
    );
    (branch, title, body)
}

#[cfg(test)]
mod tests;
