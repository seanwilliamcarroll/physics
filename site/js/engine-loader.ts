// Instantiating a wasm module built on `web-common`: the part of loading
// that has nothing to do with a page. No module-level state, no DOM, no
// URL of its own: two modules, or two instances of one, share nothing.
// The lab pages wrap it (wasm.ts, sand-wasm.ts, swarm-wasm.ts); the
// package for the website ships it as is (docs/16-site-demos.md, P1).

/** Where the module's bytes come from: a URL to fetch, a `Response`
 *  already fetched, or the bytes themselves. */
export type WasmSource = URL | string | Response | BufferSource;

/** An instantiated module. */
export interface Loaded {
  /** The raw exports; the caller asserts their shape (`engine.d.ts`). */
  readonly exports: WebAssembly.Exports;
  readonly memory: WebAssembly.Memory;
  /** Text of this instance's most recent Rust panic, or null. */
  lastPanic(): string | null;
}

/** Thrown instead of the browser's compile error when it can't run these
 *  modules at all: they're built with wasm SIMD (`simd128`,
 *  `.cargo/config.toml`), which it doesn't support. Its message is meant
 *  for the page's visitor. */
export class WasmUnsupportedError extends Error {
  override name = "WasmUnsupportedError";
}

/** The smallest module that uses a SIMD instruction: a function returning
 *  a `v128`, `i8x16.popcnt(i8x16.splat(0))`. It validates exactly when the
 *  browser supports wasm SIMD. */
const SIMD_PROBE = new Uint8Array([
  0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, // "\0asm", version 1
  0x01, 0x05, 0x01, 0x60, 0x00, 0x01, 0x7b, // types: () -> v128
  0x03, 0x02, 0x01, 0x00, // functions: one, of type 0
  0x0a, 0x0a, 0x01, 0x08, 0x00, // code: one body, 8 bytes, no locals
  0x41, 0x00, 0xfd, 0x0f, 0xfd, 0x62, 0x0b, // i32.const 0; i8x16.splat; i8x16.popcnt; end
]);

/** Whether this browser runs wasm SIMD, which every module here needs. */
export function simdSupported(): boolean {
  return WebAssembly.validate(SIMD_PROBE);
}

/** `err`, from compiling `name`, as the visitor should see it: a
 *  [`WasmUnsupportedError`] if the browser lacks wasm SIMD (the original
 *  error as its `cause`), otherwise `err` itself. `supported` is for
 *  tests. */
export function explainCompileError(err: unknown, name: string, supported = simdSupported()): unknown {
  if (supported) return err;
  return new WasmUnsupportedError(
    `This browser can't run ${name}: it doesn't support WebAssembly SIMD. ` +
      "Chrome 91, Firefox 89 and Safari 16.4 or later do.",
    { cause: err },
  );
}

/** The one import these modules take: the panic hook's sink
 *  (crates/web-common/src/panic_hook.rs). */
type Imports = { env: { console_error(ptr: number, len: number): void } };

/** Compiles and instantiates `source`, supplying the panic hook's
 *  `console_error`. `name` labels console messages.
 *
 *  A URL or `Response` is compiled while it downloads
 *  (`instantiateStreaming`), which needs the server to send
 *  `Content-Type: application/wasm`. If the browser refuses for that or
 *  any other reason, the bytes are compiled after downloading instead:
 *  slower to start, and it works on any server. A real compile error
 *  fails both ways and is thrown from the second. */
export async function instantiate(source: WasmSource, name: string): Promise<Loaded> {
  /** Set right after instantiation, before any call into Rust. */
  let memory: WebAssembly.Memory | null = null;
  let lastPanic: string | null = null;
  const imports: Imports = {
    env: {
      // Called by the Rust panic hook just before the module traps
      // ("RuntimeError: unreachable"): `len` UTF-8 bytes at `ptr`.
      console_error(ptr, len) {
        if (memory === null) {
          // A panic during instantiation itself: no memory to read yet.
          console.error(`${name} panicked before instantiation finished`);
          return;
        }
        lastPanic = new TextDecoder().decode(new Uint8Array(memory.buffer, ptr, len));
        console.error(`${name} ${lastPanic}`);
      },
    },
  };
  let instance: WebAssembly.Instance;
  try {
    instance = await instanceOf(source, name, imports);
  } catch (err) {
    throw explainCompileError(err, name);
  }
  const memoryExport = instance.exports.memory;
  if (!(memoryExport instanceof WebAssembly.Memory)) throw new Error(`${name} exports no memory`);
  memory = memoryExport;
  return { exports: instance.exports, memory: memoryExport, lastPanic: () => lastPanic };
}

async function instanceOf(source: WasmSource, name: string, imports: Imports): Promise<WebAssembly.Instance> {
  if (!(source instanceof URL) && typeof source !== "string" && !(source instanceof Response)) {
    return (await WebAssembly.instantiate(source, imports)).instance;
  }
  const response = source instanceof Response ? source : await fetch(source);
  if (!response.ok) throw new Error(`fetching ${name}: HTTP ${response.status}`);
  // The clone is what streaming consumes; the original stays readable
  // for the fallback.
  try {
    return (await WebAssembly.instantiateStreaming(response.clone(), imports)).instance;
  } catch (streaming) {
    console.warn(`${name}: streaming compile refused (${String(streaming)}); compiling after download`);
    return (await WebAssembly.instantiate(await response.arrayBuffer(), imports)).instance;
  }
}
