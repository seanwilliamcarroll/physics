# Demos on the personal site

Status: **Proposed** (2026-11-13). Nothing here is built. This replaces
`hosting.md`'s recommendation, which assumed S3 + CloudFront and shipping
this repo's pages as they are.

## The idea

Write each public demo **inside the website**, as a component in a blog
post, and have this repo supply a small versioned **package**: the wasm,
its types, its ABI constants and a loader. The pages under `site/` stay
here as the lab bench (smoke tests, the perf HUD, every option); they
aren't published.

Why not publish `site/` itself (an iframe in a post, or a path on the
domain): it's a second website inside the first. It needs its own cache
busting (nothing here is content-hashed), an embed mode per page, its own
analytics tag, and its styles don't follow the site's theme. Authored in
the site, all of that is the site's existing machinery: Vite hashes every
script and asset it bundles, and the canvas is an element of the post.

## The two repos today

**physics** (this repo):

| Layer | Reusable from the website? |
|---|---|
| The Rust crates | Yes |
| `engine.wasm` and its C ABI (`site/js/engine.d.ts`, `abi.ts`) | Yes. Scenes are compiled in: `demo_new(scene code, …)`, not "add a particle". |
| The loader in `site/js/wasm.ts` | The core, yes; it's tangled with page state (below) |
| `loop.ts`, `canvas.ts`, `options.ts`, `page.ts`, `smoke.ts` | No: they own a page |

What makes the page helpers page-shaped:

- **Fixed element ids**: `byId("view")`, `"hud"`, `"options"`. One demo a
  page, and it can't be mounted into a given element.
- **Module-level state**: `wasm.ts` keeps `memory` and `lastPanic` for
  the last module loaded, and one `stepBudget` for the page; options are
  read from `location.search` at import.
- **No teardown**: nothing stops a loop or frees a handle, because a page
  never needs to.

**personal_site** (`github.com/seanwilliamcarroll/personal_site`, checked
2026-11-13):

- Astro 7, the AstroPaper theme, Tailwind 4; built and hosted by AWS
  Amplify on every push to `main` (`amplify.yml`: `npm ci`, `npm run
  build`, serve `dist/`).
- Posts are Markdown (`src/data/blog/*.md`; the collection's glob is
  `**/[^_]*.md`). No MDX, so a post can't contain a component yet.
- **Client-side page transitions are on** (`<ClientRouter />` in
  `Layout.astro`): navigating doesn't reload the page, so a demo must
  stop its loop and free its memory when the visitor leaves, and start
  when they arrive by navigation, not only on a fresh load.
- Dark and light themes through a `data-theme` attribute
  (`src/scripts/theme.ts`).
- A pre-commit hook (Prettier, ESLint); no tests.
- `main` is now protected the same way as here (a `protect-main`
  ruleset: pull requests only, squash merges, no deletion or force
  push), as of 2026-11-13.

## Prerequisites: two things to verify first

Both are throwaway checks. Neither merges anything; each ends with a
yes or a no written back into this section.

### V1. Does Amplify serve `.wasm` as `application/wasm`?

`WebAssembly.instantiateStreaming` refuses any other content type.
Nothing on the site is a `.wasm` file today, so there's nothing to look
at.

- **How:** a branch in `personal_site` adding one tiny `.wasm` under
  `public/`, deployed through an Amplify branch preview if previews are
  enabled, otherwise merged, checked with `curl -I`, and reverted.
- **If no:** either a `customHeaders` rule in `amplify.yml` for
  `**/*.wasm`, or the loader falls back to `WebAssembly.instantiate` on
  the fetched bytes (slower to start, no server requirement). The
  loader should have that fallback regardless (P1): then this check
  decides speed, not whether it works.

### V2. Does Vite bundle a wasm file from a tarball dependency under Astro 7?

The plan depends on `import wasmUrl from "physics-engine/engine.wasm?url"`
giving a content-hashed URL in the built site, and on `npm ci`
installing a package from a release tarball URL pinned in
`package-lock.json`.

- **How:** locally, no publishing. Hand-make a package directory
  (today's `engine.wasm`, `engine.d.ts`, a ten-line loader), `npm pack`
  it, install the `.tgz` in a scratch copy of `personal_site`, import it
  from a test page, `npm run build`, and look in `dist/` for the hashed
  wasm and a page that runs under `npm run preview`.
- **Also confirms:** `astro check` (part of the site's build) accepts
  the package's `.d.ts`.
- **If no:** the package ships the wasm as a file the site copies into
  `public/` in a build step, with the version in its path. Less tidy,
  still workable.

## The work, as pull requests

Each is small enough to review in one sitting. P is this repo, S is the
site. The order within a repo is the merge order; the two columns only
meet at S3.

### physics

**P1. The loader, separated from the page.**
Refactor only; every page behaves as before.

- New `site/js/engine-loader.ts`: `instantiate(source, name)` returning
  the typed exports, the memory and a way to read the last panic, with
  **no module-level state** (two modules, or two instances of one, don't
  share anything).
- It accepts a URL, a `Response` or bytes, and falls back from
  `instantiateStreaming` to `instantiate` when streaming is refused
  (V1).
- `wasm.ts`, `sand-wasm.ts`, `swarm-wasm.ts` become thin: the loader
  plus the page's step budget.
- Tested by: a Node unit test loading the real `engine.wasm` twice and
  checking the instances are independent; the existing smoke run.

**P2. `cargo xtask package`.**
Builds `target/package/physics-engine-<version>.tgz`, npm-shaped:

- `engine.wasm`, `engine.d.ts`, the ABI constants and the loader (as
  `.js` with `.d.ts`), a `package.json` with an `exports` map and
  `types`, the licence.
- The engine only, to begin with. The other modules (sand, swarm,
  acoustic) are later subpaths of the same package, added when a post
  wants one.
- The version comes from one place (a `version` in the workspace's
  `Cargo.toml`, which has none today).
- Tested by: the command itself unpacking what it packed into a
  temporary directory and running the fountain for 60 steps from Node,
  through the package's own entry points.

**P3. Releasing, written down.**
CI is disabled here, so a release is made by hand:

- `docs/16-site-demos.md` gains the procedure: bump the version, `cargo
  xtask package`, `gh release create vX.Y.Z` with the tarball attached.
- What a version means: the ABI is the contract. Pre-1.0, a change to
  an existing export bumps the minor version and an addition the patch.
- **Cutting the first release is a separate, explicit step** (it's
  public): not part of merging this PR.

**Not planned, on purpose:**

- A general "build a world from JS" ABI. A new demo that needs new
  physics gets a scenario in Rust and a release: scenes stay tested and
  deterministic.
- Making `loop.ts`, `canvas.ts` and `options.ts` mountable. The site
  writes its own hundred lines per demo; if three demos repeat the same
  code there, that's the time to share it.

### personal_site

**S0. `main` protected.** Done (2026-11-13), by ruleset, not a PR.

**S1. MDX.**
`@astrojs/mdx`; the blog collection's glob takes `.mdx` too. No post
changes. Tested by: the build, and every existing post rendering as
before (a diff of `dist/` for the posts' HTML).

**S2. A demo wrapper, with no physics in it.**
`src/components/demo/`: the lifecycle every demo needs, proven with a
plain canvas animation.

- Starts when scrolled into view (so the wasm isn't fetched by readers
  who never reach it); pauses off-screen and when the tab is hidden.
- Stops and cleans up on leaving the page, and starts on arriving by
  client-side navigation (`astro:before-swap`, `astro:page-load`).
- Colours from the site's CSS variables, redrawn when the theme
  changes.
- Respects `prefers-reduced-motion`: starts paused, with a play
  control.
- A demo is a function `(canvas, signal) => dispose`: the wrapper knows
  nothing about wasm.
- Tested by: a draft post using it, checked by hand in both themes and
  across navigation, since the site has no test runner; adding one is
  its own decision (see "Open questions").

**S3. Hello Particles, as a draft.** *(needs P2, a release, V1, V2)*

- `package.json` depends on the release's tarball URL; the lock file
  pins its hash.
- `HelloParticles.astro`: the wrapper from S2, the package's loader,
  the fountain scene, points drawn on the canvas.
- A post with `draft: true` that embeds it.
- `amplify.yml` doesn't change unless V1 says it needs a header.

**S4. The post, published.**
The writing, and `draft: false`.

### Order

```
V1 ─┐
V2 ─┼──────────────────────────────┐
P1 ──► P2 ──► P3 ──► (release) ────┼──► S3 ──► S4
S1 ──► S2 ─────────────────────────┘
```

P1–P3 and S1–S2 don't depend on each other and can go in parallel. V2
should come before P2 (it decides the package's shape), and V1 before
S3.

## What each friction point turns into

| Friction | Resolved by |
|---|---|
| Unhashed files, stale caches | The site's bundler (V2 confirms) |
| The loader's module-level state | P1 |
| Streaming compile needs a content type | P1's fallback; V1 |
| Getting built files from one repo to the other | P2, P3 |
| Posts can't hold components | S1 |
| Client-side navigation, teardown, themes | S2 |
| Page helpers assume a page | Not resolved: not reused |
| Scenes compiled into the wasm | Not resolved: a release per new scene |

## Open questions

- **The package's name and home.** A release tarball on GitHub is
  assumed (no registry account, pinned by hash). The npm registry or
  GitHub Packages would give `npm update` and semver ranges; neither
  seems worth it for one consumer.
- **Tests on the site.** S2 and S3 are checked by hand. A headless
  check (Playwright, or this repo's smoke approach) would catch a demo
  that stops drawing after a dependency bump. Worth deciding after S3,
  when there's something to test.
- **Amplify previews.** If pull-request previews are enabled, V1 and
  every S step can be seen before merging. Not checked.
- **Whether `site/` is ever public.** This plan doesn't publish it. A
  link from a post to "the full lab page" would need the hosting work
  in `hosting.md` after all.
