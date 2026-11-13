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
use std::fs;
use std::io::Write as _;
use std::path::Path;
use std::process::{Command, Stdio};

use super::store::{self, Files};
use super::table::{self, Row};

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

/// `s` as a JSON string, quotes included.
pub(crate) fn json_string(s: &str) -> String {
    let mut out = String::from("\"");
    for c in s.chars() {
        match c {
            '"' => out.push_str("\\\""),
            '\\' => out.push_str("\\\\"),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            '\t' => out.push_str("\\t"),
            c if u32::from(c) < 0x20 => {
                let _ = write!(out, "\\u{:04x}", u32::from(c));
            }
            c => out.push(c),
        }
    }
    out.push('"');
    out
}

/// A command's trimmed standard output, or `None` if it failed.
fn output(root: &Path, program: &str, args: &[&str]) -> Option<String> {
    let out = Command::new(program)
        .current_dir(root)
        .args(args)
        .stderr(Stdio::null())
        .output()
        .ok()?;
    out.status
        .success()
        .then(|| String::from_utf8_lossy(&out.stdout).trim().to_owned())
}

/// `gh api` with `body` as the JSON request; the `--jq` result.
fn gh_api(
    root: &Path,
    method: &str,
    endpoint: &str,
    body: &str,
    jq: &str,
) -> Result<String, String> {
    let mut child = Command::new("gh")
        .current_dir(root)
        .args(["api", "-X", method, endpoint, "--input", "-", "--jq", jq])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .map_err(|e| format!("gh: {e}"))?;
    child
        .stdin
        .take()
        .ok_or("gh: no stdin")?
        .write_all(body.as_bytes())
        .map_err(|e| format!("gh: {e}"))?;
    let out = child.wait_with_output().map_err(|e| format!("gh: {e}"))?;
    if out.status.success() {
        Ok(String::from_utf8_lossy(&out.stdout).trim().to_owned())
    } else {
        Err(format!(
            "gh api {method} {endpoint}: {}",
            String::from_utf8_lossy(&out.stderr).trim()
        ))
    }
}

/// This machine's name for its record: `hostname -s`, lower case.
pub(crate) fn machine(root: &Path) -> String {
    output(root, "hostname", &["-s"]).map_or_else(|| "unknown".to_owned(), |h| h.to_lowercase())
}

/// Refuses a record from a checkout with uncommitted changes (a record
/// describes a commit); warns if it isn't `origin/main`'s (records
/// normally describe `main`).
pub(crate) fn preflight(root: &Path) -> Result<(), String> {
    if output(root, "git", &["status", "--porcelain"]).is_some_and(|s| !s.is_empty()) {
        return Err(
            "bench --record: commit or stash your changes first (a record describes a commit)"
                .to_owned(),
        );
    }
    let head = output(root, "git", &["rev-parse", "HEAD"]);
    let main = output(root, "git", &["rev-parse", "origin/main"]);
    if head != main {
        println!("bench: warning: recording a commit that isn't origin/main");
    }
    Ok(())
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

const REPO: &str = "repos/{owner}/{repo}";

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
    if output(root, "gh", &["auth", "status"]).is_none() {
        return write_locally(root, files);
    }
    let main = output(
        root,
        "gh",
        &[
            "api",
            &format!("{REPO}/git/ref/heads/main"),
            "--jq",
            ".object.sha",
        ],
    )
    .ok_or("gh: couldn't read main")?;
    let branch = format!("bench/{}-{}-{}", ctx.machine, ctx.date, ctx.time);
    let title = format!("bench: results of {} on {}", ctx.date, ctx.machine);
    push_branch(root, &main, files, &title, &branch)?;
    let table = files
        .first()
        .and_then(|(_, t)| t.as_deref())
        .unwrap_or_default();
    let body = format!(
        "{table}\nThe record for `{}`: its table and criterion's data (`{}/`), which later runs on this machine compare with. Opened by `cargo xtask bench --record`; not merged by it.\n",
        ctx.machine,
        store::data_dir(&ctx.machine)
    );
    open_pr(root, &branch, &title, &body)?;
    println!("bench: recorded in a pull request from {branch}");
    Ok(())
}

/// Without `gh`: the record written into this checkout.
fn write_locally(root: &Path, files: &[(String, Option<String>)]) -> Result<(), String> {
    for (rel, text) in files {
        let file = root.join(rel);
        match text {
            Some(text) => {
                if let Some(dir) = file.parent() {
                    fs::create_dir_all(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
                }
                fs::write(&file, text).map_err(|e| format!("{}: {e}", file.display()))?;
            }
            None => {
                let _ = fs::remove_file(&file);
            }
        }
    }
    println!(
        "bench: recorded in docs/bench/ (gh isn't logged in: commit it in a pull request by hand)"
    );
    Ok(())
}

/// One entry of a tree request: a file's content, or its removal.
pub(crate) fn tree_entry(path: &str, text: Option<&str>) -> String {
    let content = text.map_or_else(
        || "\"sha\":null".to_owned(),
        |t| format!("\"content\":{}", json_string(t)),
    );
    format!(
        "{{\"path\":{},\"mode\":\"100644\",\"type\":\"blob\",{content}}}",
        json_string(path)
    )
}

/// A branch `branch` on GitHub: `main` with `files` written (or removed),
/// in one commit, made through the API (nothing local changes).
fn push_branch(
    root: &Path,
    main: &str,
    files: &[(String, Option<String>)],
    title: &str,
    branch: &str,
) -> Result<(), String> {
    let base_tree = output(
        root,
        "gh",
        &[
            "api",
            &format!("{REPO}/git/commits/{main}"),
            "--jq",
            ".tree.sha",
        ],
    )
    .ok_or("gh: couldn't read main's tree")?;
    let entries: Vec<String> = files
        .iter()
        .map(|(p, t)| tree_entry(p, t.as_deref()))
        .collect();
    let tree = gh_api(
        root,
        "POST",
        &format!("{REPO}/git/trees"),
        &format!(
            "{{\"base_tree\":{},\"tree\":[{}]}}",
            json_string(&base_tree),
            entries.join(",")
        ),
        ".sha",
    )?;
    let commit = gh_api(
        root,
        "POST",
        &format!("{REPO}/git/commits"),
        &format!(
            "{{\"message\":{},\"tree\":{},\"parents\":[{}]}}",
            json_string(&format!(
                "{title}\n\nRecorded by cargo xtask bench --record."
            )),
            json_string(&tree),
            json_string(main)
        ),
        ".sha",
    )?;
    gh_api(
        root,
        "POST",
        &format!("{REPO}/git/refs"),
        &format!(
            "{{\"ref\":{},\"sha\":{}}}",
            json_string(&format!("refs/heads/{branch}")),
            json_string(&commit)
        ),
        ".ref",
    )
    .map(drop)
}

/// `gh pr create` from `branch` into `main`, the body on stdin.
fn open_pr(root: &Path, branch: &str, title: &str, body: &str) -> Result<(), String> {
    let mut child = Command::new("gh")
        .current_dir(root)
        .args([
            "pr",
            "create",
            "--base",
            "main",
            "--head",
            branch,
            "--title",
            title,
            "--body-file",
            "-",
        ])
        .stdin(Stdio::piped())
        .spawn()
        .map_err(|e| format!("gh pr create: {e}"))?;
    child
        .stdin
        .take()
        .ok_or("gh: no stdin")?
        .write_all(body.as_bytes())
        .map_err(|e| format!("gh pr create: {e}"))?;
    let status = child.wait().map_err(|e| format!("gh pr create: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!(
            "gh pr create failed ({status}); the branch {branch} is on GitHub"
        ))
    }
}

#[cfg(test)]
mod tests;
