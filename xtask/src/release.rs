//! `cargo xtask release`: everything about a release of the
//! `physics-engine` package except publishing it
//! (`docs/16-site-demos.md`, "Releases"). It checks the repository is in
//! a state to release from, builds and checks the package, writes draft
//! notes, and prints the one command that publishes. **It never runs
//! that command**: a release is public, and a person does it.

use std::fs;
use std::path::Path;
use std::process;

use crate::package;

/// The files whose changes are the ABI's changes: the exports' types and
/// the integer codes.
const ABI_FILES: [&str; 2] = ["site/js/engine.d.ts", "site/js/abi.ts"];

/// The tag a version is released under.
#[must_use]
pub(crate) fn tag(version: &str) -> String {
    format!("v{version}")
}

/// What `git` says about the repository, gathered once.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub(crate) struct State {
    /// The current branch (`git branch --show-current`).
    pub branch: String,
    /// `git status --porcelain`: empty when the tree is clean.
    pub status: String,
    /// `HEAD`'s commit.
    pub head: String,
    /// `origin/main`'s commit, after a fetch.
    pub origin_main: String,
    /// Every tag, local and on `origin`.
    pub tags: Vec<String>,
}

/// Why `state` isn't one to release `version` from; empty if it is. A
/// release is cut from `main`, exactly as it is on GitHub, with nothing
/// uncommitted (the tarball is built from the working tree), and under
/// a tag that doesn't exist yet (a release's file is never replaced:
/// the website pins its hash).
#[must_use]
pub(crate) fn problems(state: &State, version: &str) -> Vec<String> {
    let mut out = Vec::new();
    if state.branch != "main" {
        out.push(format!("on branch `{}`, not `main`", state.branch));
    }
    if !state.status.trim().is_empty() {
        out.push("the working tree has uncommitted changes".to_owned());
    }
    if state.head != state.origin_main {
        out.push("HEAD isn't origin/main (pull, or push, first)".to_owned());
    }
    let tag = tag(version);
    if state.tags.contains(&tag) {
        out.push(format!(
            "tag `{tag}` exists: bump `version` in Cargo.toml (a released file is never replaced)"
        ));
    }
    out
}

/// The lines a unified diff adds and removes, without its headers: what
/// changed in the ABI's files, for the notes.
#[must_use]
pub(crate) fn changed_lines(diff: &str) -> (Vec<String>, Vec<String>) {
    let (mut added, mut removed) = (Vec::new(), Vec::new());
    for line in diff.lines() {
        if line.starts_with("+++") || line.starts_with("---") {
            continue;
        }
        let text = |l: &str| l.get(1..).unwrap_or_default().trim().to_owned();
        if line.starts_with('+') && !text(line).is_empty() {
            added.push(text(line));
        } else if line.starts_with('-') && !text(line).is_empty() {
            removed.push(text(line));
        }
    }
    (added, removed)
}

/// Draft release notes: what the package is, and the ABI's changes since
/// `previous` (the last release's tag; `None` for the first).
#[must_use]
pub(crate) fn notes(version: &str, previous: Option<&str>, diff: &str) -> String {
    let name = package::NAME;
    let tarball = package::tarball_name(version);
    let mut out = format!(
        "`{name}` {version}: the engine as WebAssembly, with its types and a loader \
         (`{tarball}`, attached).\n\n\
         Depend on it by this release's tarball URL; see `docs/16-site-demos.md`.\n\n"
    );
    match previous {
        None => out.push_str("The first release.\n"),
        Some(prev) => {
            let (added, removed) = changed_lines(diff);
            out += &["## ABI changes since ", prev, "\n\n"].concat();
            if added.is_empty() && removed.is_empty() {
                out.push_str("None: the exports and codes are unchanged.\n");
            }
            for (title, lines) in [
                ("Removed or changed (was)", removed),
                ("Added or changed (now)", added),
            ] {
                if !lines.is_empty() {
                    out += &[
                        "**",
                        title,
                        ":**\n\n```ts\n",
                        &lines.join("\n"),
                        "\n```\n\n",
                    ]
                    .concat();
                }
            }
        }
    }
    out
}

/// `git` with `args` in `root`: its stdout, trimmed; an error if it
/// can't run or fails.
fn git(root: &Path, args: &[&str]) -> Result<String, String> {
    let out = process::Command::new("git")
        .current_dir(root)
        .args(args)
        .output()
        .map_err(|e| format!("failed to run git: {e}"))?;
    if out.status.success() {
        Ok(String::from_utf8_lossy(&out.stdout).trim().to_owned())
    } else {
        Err(format!(
            "git {} failed: {}",
            args.join(" "),
            String::from_utf8_lossy(&out.stderr).trim()
        ))
    }
}

/// The repository's state, after fetching `origin` (branches and tags).
fn state(root: &Path) -> Result<State, String> {
    git(root, &["fetch", "--quiet", "--tags", "origin"])?;
    Ok(State {
        branch: git(root, &["branch", "--show-current"])?,
        status: git(root, &["status", "--porcelain"])?,
        head: git(root, &["rev-parse", "HEAD"])?,
        origin_main: git(root, &["rev-parse", "origin/main"])?,
        tags: git(root, &["tag", "--list"])?
            .lines()
            .map(str::to_owned)
            .collect(),
    })
}

/// Checks, builds, drafts, and prints the publishing command. With
/// `dry_run`, an unfit repository is reported and the rest still runs
/// (to rehearse on a branch); without it, that's an error.
pub(crate) fn release(root: &Path, dry_run: bool) -> Result<(), String> {
    let manifest = fs::read_to_string(root.join("Cargo.toml"))
        .map_err(|e| format!("reading Cargo.toml: {e}"))?;
    let version = package::workspace_version(&manifest)
        .filter(|v| package::is_release_version(v))
        .ok_or("no MAJOR.MINOR.PATCH `version` under [workspace.package] in Cargo.toml")?;
    let found = problems(&state(root)?, version);
    for p in &found {
        println!("release: not ready: {p}");
    }
    if !found.is_empty() && !dry_run {
        return Err(format!(
            "{} thing(s) to fix before releasing (--dry-run rehearses anyway)",
            found.len()
        ));
    }
    package::package(root)?;

    // The last release: the nearest `v*` tag behind HEAD, if any.
    let previous = git(root, &["describe", "--tags", "--abbrev=0", "--match", "v*"]).ok();
    let diff = match &previous {
        Some(prev) => {
            let range = format!("{prev}..HEAD");
            let mut args = vec!["diff", "--unified=0", range.as_str(), "--"];
            args.extend(ABI_FILES);
            git(root, &args)?
        }
        None => String::new(),
    };
    let tag = tag(version);
    let out = super::target_dir(root).join("package");
    let notes_file = out.join(format!("release-notes-{tag}.md"));
    fs::write(&notes_file, notes(version, previous.as_deref(), &diff))
        .map_err(|e| format!("writing {}: {e}", notes_file.display()))?;
    let tarball = out.join(package::tarball_name(version));
    println!(
        "\nrelease: draft notes in {} (edit them)",
        notes_file.display()
    );
    println!("release: to publish {tag} (public, and not undone by deleting):\n");
    println!(
        "  gh release create {tag} {} --title \"{} {version}\" --notes-file {}\n",
        tarball.display(),
        package::NAME,
        notes_file.display()
    );
    if dry_run && !found.is_empty() {
        println!(
            "release: a rehearsal: fix the {} thing(s) above first",
            found.len()
        );
    }
    Ok(())
}

#[cfg(test)]
mod tests;
