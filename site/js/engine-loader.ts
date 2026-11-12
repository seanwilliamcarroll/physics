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
  const instance = await instanceOf(source, name, imports);
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
