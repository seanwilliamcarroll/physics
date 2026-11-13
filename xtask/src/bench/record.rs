//! `cargo xtask bench --record`: this run's table as a dated Markdown file,
//! `docs/bench/<date>-<machine>.md` (with the commit, the machine and the
//! toolchain), proposed as a pull request.
//!
//! The pull request is made through GitHub's API (`gh api`): a tree with
//! the one file on top of `main`, a commit, a branch, then `gh pr create`.
//! Nothing local changes (no checkout, no commit, so no hooks: the
//! pre-push hook would run the whole suite for one docs file). It's never
//! merged here. Without a working `gh` login, the file is written into
//! `docs/bench/` instead, to commit by hand.

use std::fmt::Write as _;
use std::fs;
use std::io::Write as _;
use std::path::Path;
use std::process::{Command, Stdio};

use super::table::{self, Row};

/// What the record says about where and how it was measured.
pub(crate) struct Context {
    pub date: String,
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

/// `docs/bench/<date>-<machine>.md`, or `…-<n>.md` for the `n`th that
/// day (from 2).
pub(crate) fn path(date: &str, machine: &str, n: u32) -> String {
    let suffix = if n > 1 {
        format!("-{n}")
    } else {
        String::new()
    };
    format!("docs/bench/{date}-{machine}{suffix}.md")
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

/// Where and how this run was measured.
pub(crate) fn context(root: &Path, filter: Option<&str>, against: &str) -> Context {
    let run = |p: &str, a: &[&str]| output(root, p, a).unwrap_or_else(|| "?".to_owned());
    Context {
        date: run("date", &["+%Y-%m-%d"]),
        machine: run("hostname", &["-s"]).to_lowercase(),
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

/// Records `rows`: as a pull request if `gh` is logged in, else as a file
/// in `docs/bench/`.
pub(crate) fn record(root: &Path, rows: &mut [Row], ctx: &Context) -> Result<(), String> {
    let text = document(ctx, rows);
    if output(root, "gh", &["auth", "status"]).is_none() {
        return write_locally(root, ctx, &text);
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
    let rel = free_path(root, ctx)?;
    let branch = format!(
        "bench/{}",
        rel.trim_start_matches("docs/bench/")
            .trim_end_matches(".md")
    );
    let title = format!("bench: results of {} on {}", ctx.date, ctx.machine);
    push_branch(root, &main, &rel, &text, &title, &branch)?;
    let body = format!(
        "{text}\nOne file, `{rel}`. Opened by `cargo xtask bench --record`; not merged by it.\n"
    );
    open_pr(root, &branch, &title, &body)?;
    println!("bench: recorded as {rel}, in a pull request from {branch}");
    Ok(())
}

/// Without `gh`: the record in this checkout's `docs/bench/`.
fn write_locally(root: &Path, ctx: &Context, text: &str) -> Result<(), String> {
    let rel = path(&ctx.date, &ctx.machine, 1);
    let file = root.join(&rel);
    if let Some(dir) = file.parent() {
        fs::create_dir_all(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
    }
    fs::write(&file, text).map_err(|e| format!("{}: {e}", file.display()))?;
    println!("bench: recorded in {rel} (gh isn't logged in: commit it in a pull request by hand)");
    Ok(())
}

/// The first name not on `main`: a second record the same day on the same
/// machine gets `-2`, and so on.
fn free_path(root: &Path, ctx: &Context) -> Result<String, String> {
    (1..=20)
        .map(|n| path(&ctx.date, &ctx.machine, n))
        .find(|p| {
            output(
                root,
                "gh",
                &["api", &format!("{REPO}/contents/{p}?ref=main"), "--silent"],
            )
            .is_none()
        })
        .ok_or_else(|| "bench: twenty records today already".to_owned())
}

/// A branch `branch` on GitHub: `main` plus the file `rel` holding `text`,
/// in one commit, made through the API (nothing local changes).
fn push_branch(
    root: &Path,
    main: &str,
    rel: &str,
    text: &str,
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
    let tree = gh_api(
        root,
        "POST",
        &format!("{REPO}/git/trees"),
        &format!(
            "{{\"base_tree\":{},\"tree\":[{{\"path\":{},\"mode\":\"100644\",\"type\":\"blob\",\"content\":{}}}]}}",
            json_string(&base_tree),
            json_string(rel),
            json_string(text)
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
