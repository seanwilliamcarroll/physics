# physics

A 2D physics engine in Rust, compiled to WebAssembly, driving interactive
demos. A learning project first: clarity and correctness of the core matter
more than feature breadth.

- Design docs: [`docs/`](docs/), starting at [`00-scope.md`](docs/00-scope.md)
- Roadmap: [`docs/05-roadmap.md`](docs/05-roadmap.md)
- Current milestone tasks: [`TASKS.md`](TASKS.md)

## Setup

Requirements:

- `rustup`. The toolchain version, components, and wasm targets are pinned
  in `rust-toolchain.toml` and installed automatically on first use.
- Node.js (pre-commit syntax-checks the site's JS).
- Python 3 (local dev server) and Google Chrome or Chromium (the pre-push
  browser smoke test; set `CHROME` to its path if it isn't found).

Enable the git hooks once per clone:

```sh
cargo xtask install-hooks     # = git config core.hooksPath .githooks
```

| Hook | Runs |
|---|---|
| `pre-commit` | JS syntax check, `cargo fmt --check`, `cargo clippy -D warnings` |
| `pre-push` | `cargo test`, `cargo check --target wasm32-unknown-unknown`, `cargo xtask smoke` |

The hooks check the working tree, not just what's staged.

## Build and test

```sh
cargo test --workspace
cargo clippy --workspace --all-targets -- -D warnings
```

Build the wasm module into the site, then serve it (browsers won't
instantiate wasm from `file://`):

```sh
cargo xtask site              # -> site/pkg/engine.wasm
python3 -m http.server -d site
```

`cargo xtask help` lists all commands.

## Contributing

`main` is protected: all changes land through a pull request (squash merge).
Lint policy lives in the root `Cargo.toml` (`[workspace.lints]`) and
`clippy.toml`; the rationale is in [`docs/lint-policy.md`](docs/lint-policy.md).
