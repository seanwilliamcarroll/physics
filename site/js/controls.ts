// Small control helpers: each builds a labeled input, shows its current
// value, and calls back on change. Wiring to wasm (`demo_set_*`) stays in
// the page, so these know nothing about the engine.

export type SliderSpec = {
  label: string;
  min: number;
  max: number;
  step?: number;
  value: number;
  format?: (v: number) => string;
  onInput: (v: number) => void;
};
export type SelectSpec = {
  label: string;
  choices: [value: string, text: string][];
  value: string;
  onChange: (v: string) => void;
};
export type CheckboxSpec = { label: string; checked: boolean; onChange: (checked: boolean) => void };
export type ButtonSpec = { label: string; onClick: () => void };

/** A `<label>` wrapping `text` and `children`, appended to `parent`.
 *  Wrapping ties the text to the input for clicks and screen readers. */
function labeled(parent: HTMLElement, text: string, children: HTMLElement[]): void {
  const label = document.createElement("label");
  label.className = "control";
  const span = document.createElement("span");
  span.textContent = text;
  label.append(span, ...children);
  parent.append(label);
}

/** Decimal places in `step` as written (0.005 → 3, 1e-4 → 4, 1 → 0): a
 *  slider's values are multiples of it, so its readout needs no more. */
export function decimalsOf(step: number): number {
  const s = String(step);
  const exp = /e-(\d+)$/.exec(s);
  if (exp) return Number(exp[1]) + (s.split("e")[0]?.split(".")[1]?.length ?? 0);
  return s.split(".")[1]?.length ?? 0;
}

/** A range slider with a live readout. The value is rounded to the step's
 *  decimal places before it's shown (with `format` or without): a value
 *  from Rust's `f32` reads 0.0005, not 0.0005000000237487257. */
export function slider(
  parent: HTMLElement,
  { label, min, max, step = 1, value, format, onInput }: SliderSpec,
): HTMLInputElement {
  const decimals = decimalsOf(step);
  // Every readout sees the value at the step's precision, a custom format
  // too (the ants page's degrees came from radians: 45.0000012°).
  const fmt = format ?? ((v: number) => v.toFixed(decimals));
  const shown = (v: number) => fmt(Number(v.toFixed(decimals)));
  const input = document.createElement("input");
  Object.assign(input, { type: "range", min: String(min), max: String(max), step: String(step) });
  input.value = value.toFixed(decimals);
  // <output>: the element for a computed value; screen readers announce it.
  const out = document.createElement("output");
  out.textContent = shown(value);
  input.addEventListener("input", () => {
    const v = input.valueAsNumber;
    out.textContent = shown(v);
    onInput(v);
  });
  labeled(parent, label, [input, out]);
  return input;
}

/** A dropdown of `[value, text]` choices. */
export function select(parent: HTMLElement, { label, choices, value, onChange }: SelectSpec): HTMLSelectElement {
  const sel = document.createElement("select");
  for (const [v, text] of choices) sel.append(new Option(text, v, false, v === value));
  sel.addEventListener("change", () => onChange(sel.value));
  labeled(parent, label, [sel]);
  return sel;
}

/** A checkbox. */
export function checkbox(parent: HTMLElement, { label, checked, onChange }: CheckboxSpec): HTMLInputElement {
  const box = document.createElement("input");
  box.type = "checkbox";
  box.checked = checked;
  box.addEventListener("change", () => onChange(box.checked));
  labeled(parent, label, [box]);
  return box;
}

/** A push button. */
export function button(parent: HTMLElement, { label, onClick }: ButtonSpec): HTMLButtonElement {
  const b = document.createElement("button");
  b.type = "button";
  b.textContent = label;
  b.addEventListener("click", onClick);
  parent.append(b);
  return b;
}
