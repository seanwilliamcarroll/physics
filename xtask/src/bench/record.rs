//! `cargo xtask bench --record`: this machine's record, updated from this
//! run and proposed as a pull request. The record is criterion's data
//! (`docs/bench/<machine>/`, `store.rs`: what later runs compare with) and
//! its table (`docs/bench/<machine>.md`, with the date, the commit, the
//! machine and the toolchain). One per machine: numbers from different
//! machines don't compare. Git's history keeps the earlier records.
//!
//! The pull request is made through GitHub's API (`gh api`): a tree with
//! the record's files on top of `main`, a commit, a branch, then `gh pr
//! create`. Nothing local changes (no checkout, no commit, so no hooks:
//! the pre-push hook would run the whole suite for a docs change). It's
//! never merged here. Without a working `gh` login, the files are written
//! into `docs/bench/` instead, to commit by hand.

use std::fmt::Write as _;
use std::path::Path;

use super::store::{self, Files};
use super::table::{self, Row};
use crate::github::{self, output};

/// What the record says about where and how it was measured.
pub(crate) struct Context {
    pub date: String,
    /// `HHMMSS`, for a branch name no other record has.
    pub time: String,
    pub machine: String,
    pub system: String,
    pub cpus: usize,
    pub rustc: String,
    pub commit: String,
    pub subject: String,
    pub dirty: bool,
    pub filter: Option<String>,
    /// What the Change column compares with.
    pub against: String,
}

/// The record's text.
pub(crate) fn document(ctx: &Context, rows: &mut [Row]) -> String {
    let mut out = format!("# Benchmarks, {}, {}\n\n", ctx.date, ctx.machine);
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
    let _ = writeln!(
        out,
        "- **Run:** `cargo xtask bench{}`",
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

/// `docs/bench/<machine>.md`.
pub(crate) fn path(machine: &str) -> String {
    format!("docs/bench/{machine}.md")
}

/// This machine's name for its record: `hostname -s`, lower case.
pub(crate) fn machine(root: &Path) -> String {
    output(root, "hostname", &["-s"]).map_or_else(|| "unknown".to_owned(), |h| h.to_lowercase())
}

/// Where and how this run was measured.
pub(crate) fn context(root: &Path, filter: Option<&str>, against: &str) -> Context {
    let run = |p: &str, a: &[&str]| output(root, p, a).unwrap_or_else(|| "?".to_owned());
    Context {
        date: run("date", &["+%Y-%m-%d"]),
        time: run("date", &["+%H%M%S"]),
        machine: machine(root),
        system: run("uname", &["-sm"]),
        cpus: std::thread::available_parallelism().map_or(0, std::num::NonZero::get),
        rustc: run("rustc", &["--version"]),
        commit: run("git", &["rev-parse", "--short", "HEAD"]),
        subject: run("git", &["log", "-1", "--format=%s"]),
        dirty: output(root, "git", &["status", "--porcelain"]).is_some_and(|s| !s.is_empty()),
        filter: filter.map(str::to_owned),
        against: against.to_owned(),
    }
}

/// The record's files after this run, by path in the repository: the
/// table, the data, [`store::META`]; `None` for a file the run removes (a
/// benchmark a full run no longer has).
pub(crate) fn changes(
    ctx: &Context,
    old: &Files,
    new: &Files,
    meta: &str,
    rows: &mut [Row],
) -> Vec<(String, Option<String>)> {
    let dir = store::data_dir(&ctx.machine);
    let mut out = vec![(path(&ctx.machine), Some(document(ctx, rows)))];
    out.push((format!("{dir}/{}", store::META), Some(meta.to_owned())));
    out.extend(
        new.iter()
            .map(|(k, v)| (format!("{dir}/{k}"), Some(v.clone()))),
    );
    out.extend(
        old.keys()
            .filter(|k| !new.contains_key(*k))
            .map(|k| (format!("{dir}/{k}"), None)),
    );
    out
}

/// Records the run: the files from [`changes`], as a pull request if `gh`
/// is logged in, else written into this checkout.
pub(crate) fn record(
    root: &Path,
    ctx: &Context,
    files: &[(String, Option<String>)],
) -> Result<(), String> {
    let branch = format!("bench/{}-{}-{}", ctx.machine, ctx.date, ctx.time);
    let title = format!("bench: results of {} on {}", ctx.date, ctx.machine);
    let table = files
        .first()
        .and_then(|(_, t)| t.as_deref())
        .unwrap_or_default();
    let body = format!(
        "{table}\nThe record for `{}`: its table and criterion's data (`{}/`), which later runs on this machine compare with. Opened by `cargo xtask bench --record`; not merged by it.\n",
        ctx.machine,
        store::data_dir(&ctx.machine)
    );
    github::propose(root, files, &branch, &title, &body)
}

#[cfg(test)]
mod tests;
