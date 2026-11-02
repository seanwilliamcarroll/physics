# physics

A 2D physics engine in Rust, compiled to WebAssembly, driving interactive
demos. A learning project first: clarity and correctness of the core matter
more than feature breadth.

- Design docs: [`docs/`](docs/), starting at [`00-scope.md`](docs/00-scope.md)
- Roadmap: [`docs/05-roadmap.md`](docs/05-roadmap.md)
- Current milestone tasks: [`TASKS.md`](TASKS.md)

## Setup

Requires `rustup`. The toolchain version, components, and wasm targets are
pinned in `rust-toolchain.toml` and installed automatically on first use.

Enable the git hooks once per clone:

```sh
git config core.hooksPath .githooks
```

| Hook | Runs |
|---|---|
| `pre-commit` | `cargo fmt --check`, `cargo clippy -D warnings` |
| `pre-push` | `cargo test`, `cargo check --target wasm32-unknown-unknown` |

The hooks check the working tree, not just what's staged.

## Build and test

```sh
cargo test --workspace
cargo clippy --workspace --all-targets -- -D warnings
```

Building the site (`cargo xtask site`) and serving it
(`python3 -m http.server -d site`) arrive with M0.

## Contributing

`main` is protected: all changes land through a pull request (squash merge).
Lint policy lives in the root `Cargo.toml` (`[workspace.lints]`) and
`clippy.toml`; the rationale is in `TASKS.md`.
