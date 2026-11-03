// A fixed-capacity ring buffer of numbers: push forever in constant memory,
// keeping the newest `capacity` values. Used by plots (samples) and trails
// (positions). Pure, so `node --test` covers it.

export class Ring {
  #data: Float64Array;
  /** Index the next push writes to. */
  #head = 0;
  #length = 0;

  /** `capacity` must be a positive integer. */
  constructor(capacity: number) {
    if (!Number.isInteger(capacity) || capacity < 1) {
      throw new RangeError(`Ring capacity must be a positive integer, got ${capacity}`);
    }
    this.#data = new Float64Array(capacity);
  }

  get capacity(): number {
    return this.#data.length;
  }

  get length(): number {
    return this.#length;
  }

  /** Appends `value`, overwriting the oldest once full. */
  push(value: number): void {
    this.#data[this.#head] = value;
    this.#head = (this.#head + 1) % this.capacity;
    this.#length = Math.min(this.#length + 1, this.capacity);
  }

  /** The i-th value, oldest first (`0 <= i < length`). */
  at(i: number): number {
    const oldest = (this.#head - this.#length + this.capacity) % this.capacity;
    return this.#data[(oldest + i) % this.capacity] ?? Number.NaN;
  }

  /** The newest value, or undefined when empty. */
  last(): number | undefined {
    return this.#length === 0 ? undefined : this.at(this.#length - 1);
  }

  clear(): void {
    this.#head = 0;
    this.#length = 0;
  }

  /** Oldest to newest. */
  *[Symbol.iterator](): IterableIterator<number> {
    for (let i = 0; i < this.#length; i++) yield this.at(i);
  }
}
