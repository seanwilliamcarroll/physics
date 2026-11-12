# Demos on the personal site

Status: **Proposed** (2026-11-13). Nothing here is built. This replaces
`hosting.md`, which was about publishing this repo's pages: that isn't
going to happen.

## The idea

Write each public demo **inside the website**, as a component in a blog
post, and have this repo supply a small versioned **package**: the wasm,
its types, its ABI constants and a loader. The pages under `site/` stay
here as the lab bench (smoke tests, the perf HUD, every option).
**Decided: the lab site is never published.**

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
- **Hooks for tests**, on the wrapper's element: `data-demo-state`
  (`idle`, `loading`, `running`, `paused`, `failed`) and
  `data-demo-frames` (frames drawn), and a page-wide count of live
  demos. Cheap, and what S3 reads.
- Checked by hand here, in a draft post; S3 automates it.

**S3. A browser test for demos.**
The site has no tests today. This adds the one kind a demo needs: load
the built site in a headless browser and see that it draws.

- **Runner: Playwright** (a dev dependency; its Chromium download stays
  on the developer's machine, Amplify never installs it).
  `npm run test:demos` builds, serves `dist/` with `astro preview`, and
  runs the checks. The alternative was this repo's own approach
  (`xtask/smoke_page.mjs`, Chrome over the DevTools protocol): no
  dependency, but it's a few hundred lines we'd maintain twice.
- **Where it runs:** a pre-push hook, as here (`install-hooks.sh` gains
  it), since neither repo runs CI. With `main` protected, that's a
  convention, not a gate: a PR opened from a machine without the hook
  isn't checked.
- **What it checks, against S2's dummy demo first:**
  1. *It draws:* scrolled into view, the state reaches `running`,
     frames advance, the canvas isn't blank (pixels differ from the
     background), and the page logged no errors.
  2. *It doesn't load early:* before scrolling, the state is `idle` and
     no `.wasm` was requested.
  3. *It cleans up:* following a link (client-side navigation) leaves
     zero live demos; coming back starts one again, and only one.
  4. *It pauses:* a hidden tab stops the frame count.
  5. *Themes:* toggling the theme changes the canvas's colours.
  6. *Reduced motion:* emulated, the demo starts `paused`.
- **A list of demo pages** the checks loop over: adding a demo to the
  tests is adding its path.

**S4. Hello Particles, as a draft.** *(needs P2, a release, V1, V2)*

- `package.json` depends on the release's tarball URL; the lock file
  pins its hash.
- `HelloParticles.astro`: the wrapper from S2, the package's loader,
  the fountain scene, points drawn on the canvas.
- A post with `draft: true` that embeds it.
- Its path added to S3's list, plus two checks only a real demo can
  have: the `.wasm` is served as `application/wasm` by the preview, and
  **physics is happening** (the particles' pixels move between two
  frames a second apart; a blank or frozen canvas fails).
- `amplify.yml` doesn't change unless V1 says it needs a header.

**S5. The post, published.**
The writing, and `draft: false`.

**S6. A check of the live site** (small, after the first deploy).
`npm run check:live`: fetches the published post and its `.wasm` from
the real domain and checks the status and content type. This is V1
kept as a script, for after any change to Amplify's settings. Run by
hand; it needs the network.

### Order

```
V1 ─┐
V2 ─┼───────────────────────────────────┐
P1 ──► P2 ──► P3 ──► (release) ─────────┼──► S4 ──► S5 ──► S6
S1 ──► S2 ──► S3 ───────────────────────┘
```

P1–P3 and S1–S3 don't depend on each other and can go in parallel. V2
should come before P2 (it decides the package's shape), and V1 before
S4.

## Releases: how the package gets from here to there

Nothing goes to the public npm registry. The package is a file attached
to a **GitHub release** of this repo, and the site depends on that
file's URL.

**What a release is.** A git tag (`v0.1.0`) plus a page on GitHub that
can hold files. `gh release create v0.1.0 FILE` makes the tag, the page
and the upload in one command. This repo is public, so the file's URL
needs no login:

```
https://github.com/seanwilliamcarroll/physics/releases/download/v0.1.0/physics-engine-0.1.0.tgz
```

**How the site uses it.** npm accepts a tarball URL where a version
would go:

```json
"dependencies": {
  "physics-engine": "https://github.com/seanwilliamcarroll/physics/releases/download/v0.1.0/physics-engine-0.1.0.tgz"
}
```

`npm install` downloads it and writes its SHA-512 into
`package-lock.json`. From then on `npm ci` (what Amplify runs) fetches
that URL and **refuses the file if its hash differs**. So the lock file
pins the exact bytes, not only the name.

**Cutting one** (by hand; P3 writes this down and may script it):

1. A PR here bumps the workspace version; merged.
2. On `main`: `cargo xtask package` (builds the wasm, packs the tarball,
   runs it from Node).
3. `gh release create v0.1.0 target/package/physics-engine-0.1.0.tgz`
   with notes saying what changed in the ABI.
4. A PR in the site changes the URL and runs `npm install` (the lock
   file's hash changes with it); its demo tests run before the push.

**Rules that follow from the hash:**

- **Never replace a release's file.** A re-upload under the same
  version breaks every lock file that pinned the old bytes. A fix is a
  new version.
- **Deleting a release** breaks the site's *next build*, not the live
  site (which is already built).

**Alternatives considered:**

- *GitHub Packages* (GitHub's own npm registry): also "my GitHub", and
  it gives version ranges and `npm update`. But installing from it
  needs a token even for public packages, so Amplify would need a
  secret, for one consumer.
- *A git dependency* (`github:…/physics#v0.1.0`): npm would clone this
  repo, which holds no built wasm, so Amplify would need Rust to build
  it on every deploy.

## How this scales

### Updating one demo

| The change is to | Costs | Leaves behind |
|---|---|---|
| The component or the post (drawing, controls, text) | one site PR; Amplify rebuilds | nothing but git history (text) |
| The physics (a scene, a fix in the engine) | PRs here, a release, then one site PR bumping the URL | one tag and one tarball on GitHub (about 75 KB for the engine today) |

What accumulates:

- **Release tarballs and tags here**, one per release, forever unless
  deleted: at 75 KB (180 KB with every module), a hundred releases is
  under 20 MB on GitHub, outside both repos' git histories.
- **Nothing in the site repo**: no built file is committed. A bump is
  two lines of `package.json` and `package-lock.json`.
- **Nothing on Amplify**: each deploy replaces the last. Bundled files
  are named by content, so an unchanged wasm keeps its URL across
  deploys and stays in visitors' caches; a changed one gets a new URL.

Two things to know:

- **Every demo moves together.** There's one dependency, so bumping it
  for one post's sake gives every post the new wasm. A changed function
  signature fails the site's build (`astro check` reads the package's
  types); a changed *behavior* doesn't, which is what S3 and S4's
  checks are for. If one post ever must stay on an old version, npm
  can install the package twice under two names, at the price of two
  wasm files.
- **A release is a hand-run chore** of four steps. If releases become
  frequent, steps 2–3 become one `xtask` command; nothing watches the
  URL for new versions (tools like Dependabot don't follow tarball
  URLs).

### Adding demos

Per new demo: a component, a post, a line in the test list. Plus, only
if it needs physics that isn't exported yet, a scenario here and a
release. Where repetition shows up, most costly first:

1. **Each demo exists twice.** Its lab page here (kept: that's where
   it's measured and smoke-tested) and its component on the site. The
   physics is shared; the JavaScript around it isn't. A demo with rich
   controls (the pool table, the piano) is the expensive case: its UI
   is written again. This is the plan's main standing cost, and the
   reason to start with demos whose UI is thin.
2. **Drawing code.** World-to-pixel transforms and point drawing exist
   in the lab's `canvas.ts` and will be rewritten on the site. After
   the second or third demo, the pure parts (functions of a 2D context
   and a buffer, no page assumptions) can move into the package: a
   "P4" to plan then, not now.
3. **Load, create, loop, draw.** Every engine demo's component starts
   with the same thirty lines. On the site, that's a shared helper the
   third time it's written.
4. **Controls.** Sliders and selects: the site needs its own (themed),
   once, as components.
5. **One wasm per track, with every scene in it.** `engine.wasm` is
   230 KB (75 KB compressed) and holds every engine scene; a post
   showing the fountain downloads the pool table too. It's fetched
   once and cached across posts, and Vite emits each wasm once however
   many posts import it, so storage doesn't grow per post. It becomes
   a problem only if the binary grows several-fold; the fix then is
   splitting it by scene family.
6. **Tests** grow by a path per demo, and the run by a few seconds
   each.

What doesn't grow per demo: Amplify's configuration, the site's build
steps, the release procedure, the package's shape (a new module is a
new subpath).

## What each friction point turns into

| Friction | Resolved by |
|---|---|
| Unhashed files, stale caches | The site's bundler (V2 confirms) |
| The loader's module-level state | P1 |
| Streaming compile needs a content type | P1's fallback; V1 |
| Getting built files from one repo to the other | P2, P3 |
| Posts can't hold components | S1 |
| Client-side navigation, teardown, themes | S2, and S3 keeps it true |
| A demo that silently stops drawing after an update | S3, S4's checks |
| Page helpers assume a page | Not resolved: not reused |
| Scenes compiled into the wasm | Not resolved: a release per new scene |

## Open questions

- **The package's name.** `physics-engine` is a placeholder.
- **Where the site's tests are enforced.** S3 puts them in a pre-push
  hook. A GitHub Actions workflow on pull requests would make them a
  real gate now that `main` is protected (Playwright's browsers
  install in about a minute there); this repo keeps CI off, so the
  same choice is assumed for the site until decided otherwise.
- **Amplify previews.** If pull-request previews are enabled, V1 and
  every S step can be seen before merging. Not checked.
