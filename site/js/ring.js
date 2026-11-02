// A fixed-capacity ring buffer of numbers: push forever in constant memory,
// keeping the newest `capacity` values. Used by plots (samples) and trails
// (positions). Pure, so `node --test` covers it.

export class Ring {
  /** @type {Float64Array} */
  #data;
  /** Index the next push writes to. */
  #head = 0;
  #length = 0;

  /** @param {number} capacity a positive integer */
  constructor(capacity) {
    if (!Number.isInteger(capacity) || capacity < 1) {
      throw new RangeError(`Ring capacity must be a positive integer, got ${capacity}`);
    }
    this.#data = new Float64Array(capacity);
  }

  /** @returns {number} */
  get capacity() {
    return this.#data.length;
  }

  /** @returns {number} */
  get length() {
    return this.#length;
  }

  /** Appends `value`, overwriting the oldest once full.
   *  @param {number} value */
  push(value) {
    this.#data[this.#head] = value;
    this.#head = (this.#head + 1) % this.capacity;
    this.#length = Math.min(this.#length + 1, this.capacity);
  }

  /** The i-th value, oldest first (`0 <= i < length`).
   *  @param {number} i
   *  @returns {number} */
  at(i) {
    const oldest = (this.#head - this.#length + this.capacity) % this.capacity;
    return this.#data[(oldest + i) % this.capacity] ?? Number.NaN;
  }

  /** The newest value, or undefined when empty.
   *  @returns {number | undefined} */
  last() {
    return this.#length === 0 ? undefined : this.at(this.#length - 1);
  }

  clear() {
    this.#head = 0;
    this.#length = 0;
  }

  /** Oldest to newest.
   *  @returns {IterableIterator<number>} */
  *[Symbol.iterator]() {
    for (let i = 0; i < this.#length; i++) yield this.at(i);
  }
}
