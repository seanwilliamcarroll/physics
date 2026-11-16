// Runs a WASI program (the criterion bench, built for wasm32-wasip1) in
// Node, so on V8: the engine Chrome runs the demos with.
//
//   node wasi-node.mjs <program.wasm> <criterion dir> [program args...]
//
// Like `wasmtime run --dir <dir>::/criterion --env CRITERION_HOME=/criterion`:
// the program sees only that one directory, as /criterion.
import { readFile } from "node:fs/promises";
import process from "node:process";
import { WASI } from "node:wasi";

const [wasmPath, criterionDir, ...args] = process.argv.slice(2);
const wasi = new WASI({
  version: "preview1",
  args: [wasmPath, ...args],
  env: { CRITERION_HOME: "/criterion" },
  preopens: { "/criterion": criterionDir },
  returnOnExit: true,
});
const module = await WebAssembly.compile(await readFile(wasmPath));
const instance = await WebAssembly.instantiate(module, wasi.getImportObject());
process.exitCode = wasi.start(instance);
