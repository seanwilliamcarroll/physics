// The hottest functions in a samply profile, as text (docs/profiling.md):
//   node xtask/profile_top.mjs PROFILE.json.gz [N] [--lines BINARY]
// Needs the sidecar PROFILE.json.syms.json that `samply record --save-only
// --unstable-presymbolicate` writes. Prints the top N (default 15) by self
// samples (the function itself was running) and by total (it or anything
// it called was). All threads together.
//
// With --lines BINARY (the profiled executable, built with debug info):
// also the top source lines by self samples. Each sampled address in the
// binary is resolved through its inlined frames (`atos -i` on macOS,
// `addr2line -i` elsewhere) and charged to the innermost frame that's in
// this repo: time inside an inlined `core` iterator adapter is charged to
// the line of ours that called it. Function names can't show this: in an
// optimized build most of a hot loop is inlined into one function.

import { execFileSync } from "node:child_process";
import { readFileSync } from "node:fs";
import { basename } from "node:path";
import { gunzipSync } from "node:zlib";

const args = process.argv.slice(2);
const linesAt = args.indexOf("--lines");
const binary = linesAt < 0 ? null : args.splice(linesAt, 2)[1];
const [path, nArg] = args;
if (!path || (linesAt >= 0 && !binary)) {
  console.error("usage: node xtask/profile_top.mjs PROFILE.json.gz [N] [--lines BINARY]");
  process.exit(2);
}
const N = Number(nArg ?? 15);
const raw = readFileSync(path);
const profile = JSON.parse((path.endsWith(".gz") ? gunzipSync(raw) : raw).toString());
const syms = JSON.parse(readFileSync(path.replace(/\.gz$/, "").replace(/\.json$/, "") + ".json.syms.json"));

// Library debug name -> (address -> symbol name).
const byLib = new Map();
for (const lib of syms.data) {
  const names = new Map();
  for (const [address, i] of lib.known_addresses) {
    const entry = lib.symbol_table[i];
    if (entry) names.set(address, syms.string_table[entry.symbol]);
  }
  byLib.set(lib.debug_name, names);
}

const self = new Map();
const total = new Map();
let samples = 0;
// Leaf addresses inside `binary` (relative to its image) -> samples.
const addresses = new Map();
for (const t of profile.threads) {
  const { frameTable: frames, funcTable: funcs, resourceTable: resources, stackTable: stacks } = t;
  const name = (frame) => {
    const res = funcs.resource[frames.func[frame]];
    const lib = res == null ? null : profile.libs[resources.lib[res]];
    return byLib.get(lib?.debugName)?.get(frames.address[frame]) ?? `${lib?.debugName ?? "?"}+0x${frames.address[frame]?.toString(16)}`;
  };
  for (let k = 0; k < t.samples.length; k++) {
    let stack = t.samples.stack[k];
    if (stack == null) continue;
    const w = t.samples.weight?.[k] ?? 1;
    samples += w;
    const leafFrame = stacks.frame[stack];
    const leaf = name(leafFrame);
    const leafRes = funcs.resource[frames.func[leafFrame]];
    const leafLib = leafRes == null ? null : profile.libs[resources.lib[leafRes]];
    if (binary && leafLib?.debugName === basename(binary)) {
      const a = frames.address[leafFrame];
      addresses.set(a, (addresses.get(a) ?? 0) + w);
    }
    self.set(leaf, (self.get(leaf) ?? 0) + w);
    const seen = new Set();
    while (stack != null) {
      const f = name(stacks.frame[stack]);
      if (!seen.has(f)) {
        total.set(f, (total.get(f) ?? 0) + w);
        seen.add(f);
      }
      stack = stacks.prefix[stack];
    }
  }
}

const show = (title, m) => {
  console.log(`\n${title} (of ${samples} samples)`);
  for (const [f, n] of [...m].sort((a, b) => b[1] - a[1]).slice(0, N)) {
    console.log(`${((100 * n) / samples).toFixed(1).padStart(6)}%  ${f.length > 110 ? f.slice(0, 107) + "..." : f}`);
  }
};
show("self", self);
show("total", total);

// The source position charged for each address: `frames` are innermost
// first, as "path:line"; ours are the ones under the working directory.
const charge = (frames) => {
  const root = process.cwd() + "/";
  const ours = frames.find((f) => f.startsWith(root));
  return ours ? ours.slice(root.length) : (frames[0] ?? "?");
};

// One list of "path:line" frames (innermost first) per address.
const resolve = (addrs) => {
  if (process.platform === "darwin") {
    // A Mach-O executable's image is linked at 4 GiB.
    const hex = addrs.map((a) => "0x" + (0x100000000 + a).toString(16));
    const out = execFileSync("atos", ["-o", binary, "-l", "0x100000000", "-i", "-fullPath", ...hex], {
      encoding: "utf8",
      maxBuffer: 1 << 28,
    });
    // With -i, an address's frames are one per line and a blank line
    // separates addresses; each ends "(path:line)" when it has a line.
    return out
      .replace(/\n+$/, "")
      .split("\n\n")
      .map((group) => group.split("\n").map((l) => /\(([^()]+:\d+)\)$/.exec(l)?.[1] ?? l.replace(/ \(in .*/, "")));
  }
  // -a prints each address ("0x…") before its frames.
  const hex = addrs.map((a) => "0x" + a.toString(16));
  const out = execFileSync("addr2line", ["-e", binary, "-i", "-a", ...hex], { encoding: "utf8", maxBuffer: 1 << 28 });
  const groups = [];
  for (const l of out.split("\n")) {
    if (/^0x[0-9a-f]+$/.test(l)) groups.push([]);
    else if (l) groups.at(-1)?.push(l.replace(/ \(discriminator \d+\)$/, ""));
  }
  return groups;
};

if (binary) {
  const addrs = [...addresses.keys()];
  const frames = addrs.length ? resolve(addrs) : [];
  if (frames.length !== addrs.length) {
    console.error(`profile_top: ${addrs.length} addresses but ${frames.length} answers from the symbolizer`);
    process.exit(1);
  }
  const lines = new Map();
  addrs.forEach((a, i) => {
    const at = charge(frames[i]);
    lines.set(at, (lines.get(at) ?? 0) + addresses.get(a));
  });
  show(`self, by source line in ${basename(binary)}`, lines);
}
