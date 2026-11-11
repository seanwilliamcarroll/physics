//! Just enough TypeScript for the `.d.ts` interfaces: one member per
//! line, `name(params): Result;` or `memory: WebAssembly.Memory;`.
//! Comments are skipped; anything else inside the interface is an error,
//! so a signature split over lines can't slip through unchecked.

use std::collections::BTreeMap;

use super::{JsType, Signature, Surface};

/// The members of `export interface <name> { … }` in `text`.
pub(crate) fn interface(text: &str, name: &str) -> Result<Surface, String> {
    let open = format!("export interface {name} {{");
    let start = text.find(&open).ok_or_else(|| format!("no `{open}`"))?;
    let body = text.get(start + open.len()..).unwrap_or_default();
    let end = body
        .find("\n}")
        .ok_or_else(|| format!("`{name}` isn't closed"))?;
    let mut surface = Surface {
        functions: BTreeMap::new(),
        memory: false,
    };
    let mut in_comment = false;
    for raw in body.get(..end).unwrap_or_default().lines() {
        let line = raw.trim();
        if in_comment || line.starts_with("/*") {
            in_comment = !line.contains("*/");
            continue;
        }
        if line.is_empty() || line.starts_with("//") {
            continue;
        }
        let member = line.strip_prefix("readonly ").unwrap_or(line);
        if let Some(rest) = member.strip_prefix("memory:") {
            if rest.trim() != "WebAssembly.Memory;" {
                return Err(format!("`{line}`: memory must be a WebAssembly.Memory"));
            }
            surface.memory = true;
            continue;
        }
        let (fn_name, sig) = method(member)
            .ok_or_else(|| format!("`{line}`: not a one-line `name(params): Result;`"))?;
        if surface.functions.insert(fn_name.to_owned(), sig).is_some() {
            return Err(format!("{fn_name}: declared twice"));
        }
    }
    Ok(surface)
}

/// `name(a: T, b: U): R;` as the name and its JS signature.
fn method(line: &str) -> Option<(&str, Signature)> {
    let (name, rest) = line.split_once('(')?;
    let (params, ret) = rest.rsplit_once("):")?;
    let ret = ret.trim().strip_suffix(';')?.trim();
    let name = name.trim();
    if name.is_empty() || !name.chars().all(|c| c.is_ascii_alphanumeric() || c == '_') {
        return None;
    }
    let params = if params.trim().is_empty() {
        Vec::new()
    } else {
        params
            .split(',')
            .map(|p| p.split_once(':').map(|(_, ty)| js_type(ty.trim())))
            .collect::<Option<Vec<_>>>()?
    };
    let results = if ret == "void" {
        Vec::new()
    } else {
        vec![js_type(ret)]
    };
    Some((name, Signature { params, results }))
}

/// `bigint` is `i64`; every other type here (`number` and its branded
/// aliases: handles, pointers, statuses) is a JS number.
fn js_type(ty: &str) -> JsType {
    if ty == "bigint" {
        JsType::BigInt
    } else {
        JsType::Number
    }
}
