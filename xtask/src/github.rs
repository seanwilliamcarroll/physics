//! Pull requests made through GitHub's API (`gh api`), for the records
//! `cargo xtask bench --record` and `cargo xtask coverage --record` keep:
//! a tree with the files on top of `main`, a commit, a branch, then `gh pr
//! create`. Nothing local changes (no checkout, no commit, so no hooks:
//! the pre-push hook would run the whole suite for a docs change), and
//! nothing is merged here. Without a `gh` login the files are written into
//! the checkout instead, to commit by hand.

use std::fmt::Write as _;
use std::fs;
use std::io::Write as _;
use std::path::Path;
use std::process::{Command, Stdio};

const REPO: &str = "repos/{owner}/{repo}";

/// Proposes `files` (path in the repository, its new text or `None` to
/// remove it) as a pull request from a new branch `branch`; or, without a
/// `gh` login, writes them into the checkout.
pub(crate) fn propose(
    root: &Path,
    files: &[(String, Option<String>)],
    branch: &str,
    title: &str,
    body: &str,
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
    push_branch(root, &main, files, title, branch)?;
    // The branch is on GitHub either way. A refused pull request (GitHub
    // Actions may not open one unless the repository allows it) leaves it
    // there for one command to open, rather than failing the record.
    match open_pr(root, branch, title, body) {
        Ok(()) => println!("recorded in a pull request from {branch}"),
        Err(e) => println!(
            "recorded on the branch {branch}, but no pull request was opened ({e}); open one with:\n  gh pr create --base main --head {branch} --fill"
        ),
    }
    Ok(())
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
pub(crate) fn output(root: &Path, program: &str, args: &[&str]) -> Option<String> {
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

/// Refuses a record from a checkout with uncommitted changes (a record
/// describes a commit); warns if it isn't `origin/main`'s (records
/// normally describe `main`).
pub(crate) fn preflight(root: &Path, what: &str) -> Result<(), String> {
    if output(root, "git", &["status", "--porcelain"]).is_some_and(|s| !s.is_empty()) {
        return Err(format!(
            "{what} --record: commit or stash your changes first (a record describes a commit)"
        ));
    }
    let head = output(root, "git", &["rev-parse", "HEAD"]);
    let main = output(root, "git", &["rev-parse", "origin/main"]);
    if head != main {
        println!("{what}: warning: recording a commit that isn't origin/main");
    }
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
    println!("recorded in this checkout (gh isn't logged in: commit it in a pull request by hand)");
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
