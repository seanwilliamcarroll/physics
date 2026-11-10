use super::{JsType, Signature, Surface, check, compare, dts, wasm};

/// A module by hand: types `(i32, f64) -> i32`, `() -> ()` and
/// `(i64) -> ()`; one imported function (so local indices are shifted);
/// three local functions, exported as `a`, `b` and `wide`, plus a memory.
fn module() -> Vec<u8> {
    let mut m = b"\0asm\x01\0\0\0".to_vec();
    let section = |m: &mut Vec<u8>, id: u8, body: &[u8]| {
        m.push(id);
        m.push(u8::try_from(body.len()).unwrap());
        m.extend_from_slice(body);
    };
    // Types.
    section(
        &mut m,
        1,
        &[
            3, 0x60, 2, 0x7f, 0x7c, 1, 0x7f, 0x60, 0, 0, 0x60, 1, 0x7e, 0,
        ],
    );
    // Imports: env.log, function of type 1; env.mem, a memory with a max.
    section(
        &mut m,
        2,
        &[
            2, 3, b'e', b'n', b'v', 3, b'l', b'o', b'g', 0, 1, 3, b'e', b'n', b'v', 3, b'm', b'e',
            b'm', 2, 1, 1, 2,
        ],
    );
    // Functions: types 0, 1, 2 (indices 1, 2, 3 after the import).
    section(&mut m, 3, &[3, 0, 1, 2]);
    // Exports: a = func 1, b = func 2, wide = func 3, memory = memory 0.
    section(
        &mut m,
        7,
        &[
            4, 1, b'a', 0, 1, 1, b'b', 0, 2, 4, b'w', b'i', b'd', b'e', 0, 3, 6, b'm', b'e', b'm',
            b'o', b'r', b'y', 2, 0,
        ],
    );
    m
}

const DTS: &str = "\
export interface Exports {
  readonly memory: WebAssembly.Memory;
  /** A one-line comment. */
  a(handle: Handle, x: number): Status;
  /**
   * A comment over lines.
   */
  b(): void;
  wide(n: bigint): void;
}
";

#[test]
fn reads_exports_through_the_import_shift() {
    let s = wasm::exports(&module()).unwrap();
    assert!(s.memory);
    let n = JsType::Number;
    assert_eq!(
        s.functions["a"],
        Signature {
            params: vec![n, n],
            results: vec![n]
        }
    );
    assert_eq!(
        s.functions["b"],
        Signature {
            params: vec![],
            results: vec![]
        }
    );
    assert_eq!(s.functions["wide"].params, [JsType::BigInt]);
}

#[test]
fn a_matching_declaration_passes() {
    assert_eq!(wasm::exports(&module()), dts::interface(DTS, "Exports"));
    check(&module(), DTS, "Exports", "test").unwrap();
}

#[test]
fn every_mismatch_is_reported() {
    let wrong = DTS
        .replace("a(handle: Handle, x: number)", "a(handle: Handle)")
        .replace("wide(n: bigint)", "wide(n: number)")
        .replace("  b(): void;\n", "  c(): void;\n");
    let err = check(&module(), &wrong, "Exports", "test").unwrap_err();
    for expected in [
        "a: the .wasm has (number, number) -> (number), the .d.ts (number) -> (number)",
        "wide: the .wasm has (bigint) -> (), the .d.ts (number) -> ()",
        "b: exported but not declared",
        "c: declared but not exported",
    ] {
        assert!(err.contains(expected), "missing `{expected}` in:\n{err}");
    }
}

#[test]
fn memory_must_match_too() {
    let exported = Surface {
        memory: true,
        ..Surface::default()
    };
    assert_eq!(
        compare(&exported, &Surface::default()),
        ["memory: exported true, declared false"]
    );
}

#[test]
fn a_signature_over_two_lines_is_refused() {
    let split = "export interface Exports {\n  a(x: number,\n    y: number): void;\n}\n";
    assert!(dts::interface(split, "Exports").is_err());
}

#[test]
fn not_wasm_is_an_error() {
    assert!(wasm::exports(b"not wasm").is_err());
    let mut truncated = module();
    truncated.truncate(20);
    assert!(wasm::exports(&truncated).is_err());
}
