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

/** A range slider with a live readout. */
export function slider(
  parent: HTMLElement,
  { label, min, max, step = 1, value, format = String, onInput }: SliderSpec,
): HTMLInputElement {
  const input = document.createElement("input");
  Object.assign(input, { type: "range", min: String(min), max: String(max), step: String(step) });
  input.value = String(value);
  // <output>: the element for a computed value; screen readers announce it.
  const out = document.createElement("output");
  out.textContent = format(value);
  input.addEventListener("input", () => {
    const v = input.valueAsNumber;
    out.textContent = format(v);
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
