//! Just enough of the wasm binary format for the export table: the type,
//! import, function and export sections (WebAssembly core spec, §5).

use std::collections::BTreeMap;

use super::{JsType, Signature, Surface};

const MAGIC: &[u8] = b"\0asm";
const VERSION_1: [u8; 4] = [1, 0, 0, 0];

const SECTION_TYPE: u8 = 1;
const SECTION_IMPORT: u8 = 2;
const SECTION_FUNCTION: u8 = 3;
const SECTION_EXPORT: u8 = 7;

const FUNC_TYPE: u8 = 0x60;
const KIND_FUNC: u8 = 0;
const KIND_TABLE: u8 = 1;
const KIND_MEMORY: u8 = 2;
const KIND_GLOBAL: u8 = 3;
const KIND_TAG: u8 = 4;

/// The exports of a wasm module, with each function's signature.
pub(crate) fn exports(bytes: &[u8]) -> Result<Surface, String> {
    let mut r = Reader { bytes, at: 0 };
    if r.take(4)? != MAGIC || r.take(4)? != VERSION_1 {
        return Err("not a wasm module (version 1)".to_owned());
    }
    let mut types = Vec::new();
    let mut imported_funcs = 0_usize;
    let mut func_types = Vec::new();
    let mut raw_exports = Vec::new();
    while !r.done() {
        let id = r.byte()?;
        let size = r.usize()?;
        let mut s = Reader {
            bytes: r.take(size)?,
            at: 0,
        };
        match id {
            SECTION_TYPE => types = read_types(&mut s)?,
            SECTION_IMPORT => imported_funcs = count_func_imports(&mut s)?,
            SECTION_FUNCTION => {
                for _ in 0..s.usize()? {
                    func_types.push(s.usize()?);
                }
            }
            SECTION_EXPORT => {
                for _ in 0..s.usize()? {
                    let name = s.name()?;
                    let kind = s.byte()?;
                    let index = s.usize()?;
                    raw_exports.push((name, kind, index));
                }
            }
            _ => {}
        }
    }
    let mut surface = Surface {
        functions: BTreeMap::new(),
        memory: false,
    };
    for (name, kind, index) in raw_exports {
        match kind {
            KIND_FUNC => {
                // Imported functions come first in the index space.
                let local = index
                    .checked_sub(imported_funcs)
                    .ok_or_else(|| format!("{name}: re-exports an import"))?;
                let ty = func_types
                    .get(local)
                    .and_then(|&t| types.get(t))
                    .ok_or_else(|| format!("{name}: no type for function {index}"))?;
                surface.functions.insert(name, ty.clone());
            }
            KIND_MEMORY if name == "memory" => surface.memory = true,
            _ => {
                return Err(format!(
                    "{name}: an export of kind {kind}, not a function or the memory"
                ));
            }
        }
    }
    Ok(surface)
}

fn read_types(s: &mut Reader<'_>) -> Result<Vec<Signature>, String> {
    let mut types = Vec::new();
    for _ in 0..s.usize()? {
        if s.byte()? != FUNC_TYPE {
            return Err("a type that isn't a function type".to_owned());
        }
        let params = s.value_types()?;
        let results = s.value_types()?;
        types.push(Signature { params, results });
    }
    Ok(types)
}

/// Function imports shift the function index space; the rest are skipped.
fn count_func_imports(s: &mut Reader<'_>) -> Result<usize, String> {
    let mut funcs = 0;
    for _ in 0..s.usize()? {
        s.name()?;
        s.name()?;
        match s.byte()? {
            KIND_FUNC => {
                s.usize()?;
                funcs += 1;
            }
            KIND_TABLE => {
                s.byte()?;
                s.limits()?;
            }
            KIND_MEMORY => s.limits()?,
            KIND_GLOBAL => {
                s.byte()?;
                s.byte()?;
            }
            KIND_TAG => {
                s.byte()?;
                s.usize()?;
            }
            k => return Err(format!("an import of unknown kind {k}")),
        }
    }
    Ok(funcs)
}

struct Reader<'a> {
    bytes: &'a [u8],
    at: usize,
}

impl<'a> Reader<'a> {
    fn done(&self) -> bool {
        self.at >= self.bytes.len()
    }

    fn take(&mut self, n: usize) -> Result<&'a [u8], String> {
        let end = self.at.checked_add(n).ok_or("length overflow")?;
        let out = self.bytes.get(self.at..end).ok_or("truncated module")?;
        self.at = end;
        Ok(out)
    }

    fn byte(&mut self) -> Result<u8, String> {
        self.take(1)?
            .first()
            .copied()
            .ok_or_else(|| "truncated module".to_owned())
    }

    /// Unsigned LEB128, at most 32 bits (every count and index here).
    fn usize(&mut self) -> Result<usize, String> {
        let mut value: u32 = 0;
        for shift in (0..35).step_by(7) {
            let b = self.byte()?;
            value |= u32::from(b & 0x7f)
                .checked_shl(shift)
                .ok_or("LEB128 too long")?;
            if b & 0x80 == 0 {
                return usize::try_from(value).map_err(|e| e.to_string());
            }
        }
        Err("LEB128 too long".to_owned())
    }

    fn name(&mut self) -> Result<String, String> {
        let len = self.usize()?;
        String::from_utf8(self.take(len)?.to_vec()).map_err(|e| e.to_string())
    }

    fn value_types(&mut self) -> Result<Vec<JsType>, String> {
        (0..self.usize()?)
            .map(|_| match self.byte()? {
                0x7f | 0x7d | 0x7c => Ok(JsType::Number),
                0x7e => Ok(JsType::BigInt),
                t => Err(format!("value type 0x{t:02x} has no JS number form")),
            })
            .collect()
    }

    /// Memory or table limits: a flags byte, the minimum, and the maximum
    /// if flag bit 0 is set (bit 1 marks shared memory, bit 2 memory64).
    fn limits(&mut self) -> Result<(), String> {
        let flags = self.byte()?;
        self.usize()?;
        if flags & 1 != 0 {
            self.usize()?;
        }
        Ok(())
    }
}
