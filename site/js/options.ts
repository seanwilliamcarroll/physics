// URL options shared by demo pages: parsing with legal ranges, and the
// options table generated from the same definitions (so documented ranges
// can't drift from enforced ones). No DOM access, so `node --test` covers it.

/** An option chosen from a list, or an integer in a range. `kind` tells
 *  them apart (a discriminated union), so code that reads `min` or `values`
 *  has checked which one it holds. */
export type ChoiceOption = { kind: "choice"; values: string[]; default: string; help: string };
export type IntOption = { kind: "int"; min: number; max: number; default: number; help: string };
export type Option = ChoiceOption | IntOption;

/** The option's value from the URL if it's one of `opt.values`, else the
 *  default. */
export function readChoice(params: URLSearchParams, name: string, opt: ChoiceOption): string {
  const v = params.get(name);
  return v !== null && opt.values.includes(v) ? v : opt.default;
}

/** The option's integer from the URL, clamped to `[min, max]`; the default
 *  if absent or not a number. Uses `parseInt`, so "12abc" reads as 12 and
 *  "1e9" as 1. */
export function readInt(params: URLSearchParams, name: string, opt: IntOption): number {
  const v = Number.parseInt(params.get(name) ?? "", 10);
  return Number.isFinite(v) ? Math.min(Math.max(v, opt.min), opt.max) : opt.default;
}

/** The options section's HTML: a table row per option (legal values,
 *  default, effect) and links to `presets` ([label, query string]). */
export function optionsTableHtml(
  options: Record<string, Option>,
  presets: [string, string][],
): string {
  const rows = Object.entries(options).map(([name, o]) => {
    const legal = o.kind === "choice"
      ? o.values.join(" | ")
      : `${o.min.toLocaleString()} – ${o.max.toLocaleString()}`;
    const dflt = o.kind === "choice" || Number.isFinite(o.default)
      ? o.default.toLocaleString()
      : "uncapped";
    return `<tr><td><code>${name}</code></td><td>${legal}</td><td>${dflt}</td><td>${o.help}</td></tr>`;
  });
  const links = presets.map(([label, q]) => `<a href="./${q}">${label}</a>`).join(" · ");
  return `
    <h2>Options</h2>
    <p class="muted">Add to the URL, e.g. <code>?scalar=f64</code>.
      Out-of-range numbers are clamped to the nearest legal value.</p>
    <table>
      <thead><tr><th>option</th><th>legal values</th><th>default</th><th>effect</th></tr></thead>
      <tbody>${rows.join("")}</tbody>
    </table>
    <p>Try: ${links}</p>`;
}
