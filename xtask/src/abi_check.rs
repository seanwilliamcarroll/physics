//! Checks a `.wasm`'s export table against its hand-written `.d.ts`
//! (`site/js/engine.d.ts`, `acoustic.d.ts`): the C ABI's one copy that no
//! compiler sees. Every exported function must be declared, every
//! declared one exported, with the same parameter and result counts, and
//! `bigint` exactly where wasm has `i64` (`number` covers `i32`, `f32`
//! and `f64`). Run by `cargo xtask site`, so `serve`, `smoke` and the
//! pre-push hook all check it. The integer codes are checked separately,
//! by `crates/web/src/abi/tests.rs`.
//!
//! Not checked: argument *order* among parameters of the same JS type,
//! or what a `number` means (a handle, a count). Those need a reader.

use std::collections::BTreeMap;

mod dts;
mod wasm;

/// How a wasm value reaches JavaScript.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub(crate) enum JsType {
    /// `i32`, `f32`, `f64`.
    Number,
    /// `i64`.
    BigInt,
}

/// A function's parameters and results, as JS sees them.
#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Signature {
    pub(crate) params: Vec<JsType>,
    pub(crate) results: Vec<JsType>,
}

/// What a module exports, or an interface declares: functions by name,
/// and whether there's a `memory`.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub(crate) struct Surface {
    pub(crate) functions: BTreeMap<String, Signature>,
    pub(crate) memory: bool,
}

/// Compares `wasm_bytes`' exports with interface `interface` in
/// `dts_text`. `what` names the pair in messages. Every mismatch is
/// listed, not just the first.
pub(crate) fn check(
    wasm_bytes: &[u8],
    dts_text: &str,
    interface: &str,
    what: &str,
) -> Result<(), String> {
    let exported =
        wasm::exports(wasm_bytes).map_err(|e| format!("{what}: reading the .wasm: {e}"))?;
    let declared = dts::interface(dts_text, interface)
        .map_err(|e| format!("{what}: reading the .d.ts: {e}"))?;
    let problems = compare(&exported, &declared);
    if problems.is_empty() {
        Ok(())
    } else {
        Err(format!(
            "{what}: the .d.ts doesn't match the .wasm's exports:\n  {}",
            problems.join("\n  ")
        ))
    }
}

/// Every difference between the exports and the declarations.
pub(crate) fn compare(exported: &Surface, declared: &Surface) -> Vec<String> {
    let mut problems = Vec::new();
    if exported.memory != declared.memory {
        problems.push(format!(
            "memory: exported {}, declared {}",
            exported.memory, declared.memory
        ));
    }
    for (name, wasm_sig) in &exported.functions {
        match declared.functions.get(name) {
            None => problems.push(format!("{name}: exported but not declared")),
            Some(ts_sig) if ts_sig != wasm_sig => problems.push(format!(
                "{name}: the .wasm has {}, the .d.ts {}",
                describe(wasm_sig),
                describe(ts_sig)
            )),
            Some(_) => {}
        }
    }
    for name in declared.functions.keys() {
        if !exported.functions.contains_key(name) {
            problems.push(format!("{name}: declared but not exported"));
        }
    }
    problems
}

fn describe(sig: &Signature) -> String {
    let list = |v: &[JsType]| {
        v.iter()
            .map(|t| match t {
                JsType::Number => "number",
                JsType::BigInt => "bigint",
            })
            .collect::<Vec<_>>()
            .join(", ")
    };
    format!("({}) -> ({})", list(&sig.params), list(&sig.results))
}

#[cfg(test)]
mod tests;
