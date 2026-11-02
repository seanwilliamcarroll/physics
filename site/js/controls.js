// Small control helpers: each builds a labeled input, shows its current
// value, and calls back on change. Wiring to wasm (`demo_set_*`) stays in
// the page, so these know nothing about the engine.

/** A `<label>` wrapping `text` and `input`, appended to `parent`. Wrapping
 *  ties the text to the input for clicks and screen readers.
 *  @param {HTMLElement} parent
 *  @param {string} text
 *  @param {HTMLElement[]} children */
function labeled(parent, text, children) {
  const label = document.createElement("label");
  label.className = "control";
  const span = document.createElement("span");
  span.textContent = text;
  label.append(span, ...children);
  parent.append(label);
}

/** A range slider with a live readout.
 *  @param {HTMLElement} parent
 *  @param {{ label: string, min: number, max: number, step?: number, value: number,
 *            format?: (v: number) => string, onInput: (v: number) => void }} spec
 *  @returns {HTMLInputElement} */
export function slider(parent, { label, min, max, step = 1, value, format = String, onInput }) {
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

/** A dropdown of `[value, label]` choices.
 *  @param {HTMLElement} parent
 *  @param {{ label: string, choices: [string, string][], value: string,
 *            onChange: (v: string) => void }} spec
 *  @returns {HTMLSelectElement} */
export function select(parent, { label, choices, value, onChange }) {
  const sel = document.createElement("select");
  for (const [v, text] of choices) sel.append(new Option(text, v, false, v === value));
  sel.addEventListener("change", () => onChange(sel.value));
  labeled(parent, label, [sel]);
  return sel;
}

/** A checkbox.
 *  @param {HTMLElement} parent
 *  @param {{ label: string, checked: boolean, onChange: (checked: boolean) => void }} spec
 *  @returns {HTMLInputElement} */
export function checkbox(parent, { label, checked, onChange }) {
  const box = document.createElement("input");
  box.type = "checkbox";
  box.checked = checked;
  box.addEventListener("change", () => onChange(box.checked));
  labeled(parent, label, [box]);
  return box;
}

/** A push button.
 *  @param {HTMLElement} parent
 *  @param {{ label: string, onClick: () => void }} spec
 *  @returns {HTMLButtonElement} */
export function button(parent, { label, onClick }) {
  const b = document.createElement("button");
  b.type = "button";
  b.textContent = label;
  b.addEventListener("click", onClick);
  parent.append(b);
  return b;
}
