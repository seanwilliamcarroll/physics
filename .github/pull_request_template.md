## What and why

<!-- One paragraph: what changes, and why. Link the TASKS.md section. -->

## Checklist

- [ ] Non-obvious literals are named constants with their source cited (`docs/lint-policy.md`, "Magic numbers")
- [ ] Docs updated in the same PR if behavior or a design decision changed
- [ ] New `#[expect]`s have a `reason`
- [ ] Site changes: `cargo xtask smoke` passes (the pre-push hook runs it)
