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
- Hooks: pre-commit (Prettier, ESLint, `astro check`), pre-push (the
  production build). No tests, no CI.
- `main` is now protected the same way as here (a `protect-main`
  ruleset: pull requests only, squash merges, no deletion or force
  push), as of 2026-11-13.

## Prerequisites: four things to check first

V1 and V2 are throwaway experiments; V3 and V4 are lookups in the
Amplify console (or `aws amplify get-app` / `get-branch`). None merges
anything; each ends with its answer written back into this section.

### V1. Does Amplify serve `.wasm` as `application/wasm`?

`WebAssembly.instantiateStreaming` refuses any other content type.
Nothing on the site is a `.wasm` file today, so there's nothing to look
at.

- **How:** a branch in `personal_site` adding one tiny `.wasm` under
  `public/`, looked at with `curl -I` on a pull-request preview if
  those are on (V4); otherwise merged, checked, and reverted.
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

**Result (2026-11-13): yes.** In a scratch copy of the site (Astro
7, nothing committed), with a hand-made package of today's
`engine.wasm`, `engine.d.ts` and a stand-in loader, packed with `npm
pack` and served from a local HTTP server:

- `npm install http://…/physics-engine-0.0.1-v2check.tgz` wrote the URL
  into `package.json` and the URL plus a `sha512` integrity into
  `package-lock.json`; a clean `npm ci` then installed it from the
  lock file.
- A page whose `<script>` does `import wasmUrl from
  "physics-engine/engine.wasm?url"` built to
  `dist/_astro/engine.CpN_iahK.wasm`: content-hashed, and byte for byte
  the file that went in.
- `astro check` passed with the package's types (0 errors), and the
  `?url` import needed no declaration of ours.
- Under `astro preview`, headless Chrome ran the fountain 60 steps
  through the package (600 floats, apex 7.0 m), and the preview served
  the file as `application/wasm`.

So the package needs an `exports` entry for the wasm
(`"./engine.wasm": "./engine.wasm"`), and nothing else special. Not
tried: that `npm ci` refuses a tarball whose bytes changed (npm's
documented behavior, not exercised here).

### V3. Which Node version does Amplify build with?

The site has no `.nvmrc`; Amplify uses whatever its build image
provides, or a version set in the app's build settings. CI (S1) and
local development should use the same major version, or "green in CI"
doesn't mean "builds on Amplify".

- **How:** the app's build settings (the build image and any "live
  package updates" for Node), and the `node --version` line in the
  last build's log.
- **Decides:** the number S1 writes into `.nvmrc`, and whether
  `amplify.yml` should say `nvm use` so the three agree by
  construction instead of by coincidence.

### V4. Are Amplify pull-request previews on?

With previews, every site PR gets its own deployed URL before it
merges.

- **How:** the app's "Previews" setting.
- **If yes:** V1 needs no merge-and-revert (the test file is looked at
  on a preview), and S4, S6 and S7 can be seen live in review.
- **If no:** decide whether to turn them on. They build each PR on
  Amplify's side (build minutes are billed past the free tier, unlike
  GitHub's runners for a public repo), and a preview of a public repo's
  PR is public. Without them, V1 falls back to a brief merge and
  revert, and S7 is first seen live in production.
- **Decides:** how V1 is done, and what "done when" can mean for the
  site's steps.

## The work, as pull requests

Each is small enough to review in one sitting. **P** steps are pull
requests in this repo, **S** steps in `personal_site`; **V** steps are
the throwaway checks above. The order within a repo is the merge order.
The two repos only meet at S6.

Each step says what it touches and when it's done. "Done when" is what
the PR's description has to show.

### physics

Nightly CI for this repo is its own plan (`17-nightly-ci.md`, steps
C1–C4); it doesn't block anything here.

#### P1. The loader, separated from the page

Refactor only: every lab page behaves as before.

- **Touches:** new `site/js/engine-loader.ts`; `site/js/wasm.ts`,
  `sand-wasm.ts`, `swarm-wasm.ts`, `synth-live.ts` (thinner);
  `tests/site/engine-loader.test.js`; `docs/03-wasm-shell.md`.
- **The loader:** `instantiate(source, name)` returns the typed
  exports, the memory, and a function reading the last panic. It keeps
  **no module-level state**: today `wasm.ts` holds `memory` and
  `lastPanic` for whichever module loaded last.
- **Sources:** a URL, a `Response`, or bytes.
- **Fallback:** if `instantiateStreaming` is refused (a wrong content
  type; V1), it compiles from the fetched bytes instead, and says so
  once on the console.
- **The page's part stays in `wasm.ts`:** the step budget, and
  `lastPanicMessage` for the smoke test, now built on the loader.
- **Done when:** a Node test loads the real `engine.wasm` twice and
  shows the two instances share nothing (a panic in one isn't reported
  by the other); a test covers the fallback with a `Response` of the
  wrong type; `cargo xtask smoke` passes unchanged (40 pages).

#### P2. `cargo xtask package`

*(after V2, which decides the package's shape)*

- **Touches:** `xtask/src/package.rs` and its tests, `xtask/src/main.rs`;
  a `package/` directory of templates (`package.json`, a README);
  `Cargo.toml` (a `version` under `[workspace.package]`: there is none
  today, and it becomes the package's); `docs/repo-layout.md`.
- **Builds** `target/package/physics-engine-<version>.tgz`:
  - `engine.wasm` (the release build `cargo xtask site` makes);
  - `engine.d.ts` (the export table's types, as checked against the
    wasm by `xtask site` today);
  - `abi.js` + `abi.d.ts` (the scene codes and caps);
  - `loader.js` + `loader.d.ts` (P1's loader, compiled by `tsc` with
    declarations);
  - `package.json` with an `exports` map (`.`, `./engine.wasm`),
    `types`, `"type": "module"`, the MIT licence.
- **Scope:** the engine only. Sand, swarm and acoustic become subpaths
  (`physics-engine/swarm`) when a post wants one: the same command,
  another entry in a table.
- **Self-check:** the command unpacks what it packed into a temporary
  directory and, from Node, imports the package by its own entry
  points, creates the fountain and advances it 60 steps. A package
  that can't be used fails the command.
- **Done when:** the tarball's file list is in the PR; the self-check
  runs in `pre-push` (it's seconds); `npm pack --dry-run` on the
  unpacked directory agrees with the file list.

#### P3. Releasing, written down and scripted

- **Touches:** this document's "Releases" section (the procedure,
  final); `xtask/src/package.rs` (a `--release-notes` helper printing
  the ABI's changes since the last tag, from `docs/api/` and
  `engine.d.ts`'s diff); `TASKS.md`.
- **What a version means:** the ABI is the contract. Before 1.0, a
  change to an existing export bumps the minor version, an addition
  the patch.
- **Done when:** the procedure is followed once, as a dry run, up to
  but not including `gh release create`.
- **Cutting the first release is a separate, explicit step** (it's
  public), done on request after P3 merges: tag `v0.1.0`.

**Later, not scheduled:**

- *Pruning old releases* (`gh release delete vX --cleanup-tag` for
  everything but the version the site pins and the last few). Low
  priority: the files are small and outside both repos' histories.
- *P4: drawing helpers in the package*, once a second or third demo
  repeats them on the site ("How this scales").

**Not planned, on purpose:**

- A general "build a world from JS" ABI. A new demo that needs new
  physics gets a scenario in Rust and a release: scenes stay tested and
  deterministic.
- Making `loop.ts`, `canvas.ts` and `options.ts` mountable. They stay
  the lab's.

### personal_site

`main` is protected (done 2026-11-13, by a ruleset: pull requests
only, squash merges, no deletion or force push). The site's hooks
today: pre-commit runs Prettier (rewriting staged files), ESLint and
`astro check`; pre-push runs the production build.

#### S1. CI on every pull request

The site gets checks **per PR** (decided): they take a couple of
minutes, and what lands on `main` is deployed by Amplify at once.

- **Touches:** new `.github/workflows/ci.yml`; `.nvmrc` (the site has
  none; the version V3 found); `amplify.yml` if V3 says to pin it
  there too; `README.md`, `CLAUDE.md`
  (the workflow is now: branch, PR, green check, squash).
- **Triggers:** `pull_request`, and `workflow_dispatch` for a manual
  run. Not `push` to `main`: Amplify's own build covers that.
- **One job, `check`**, on `ubuntu-24.04`, mirroring the hooks:
  1. `npm ci` (cached by the lock file);
  2. `npm run format:check` (Prettier, checking, not rewriting);
  3. `npm run lint`;
  4. `npm run build` (which is `astro check`, the build, and Pagefind).
- A newer push to the same PR cancels the older run.
- **Done when:** the PR's own run is green, and a deliberately broken
  commit on a scratch PR (a type error) goes red.

#### S2. The check, required

A settings change, not a PR: the `protect-main` ruleset gains a
required status check, `check`. From then on a PR can't be merged
until its run is green. Done after S1 merges (GitHub only offers
checks it has seen run).

- **Done when:** the scratch PR from S1 can't be merged while red.

#### S3. MDX

- **Touches:** `package.json` (`@astrojs/mdx`), `astro.config.ts` (the
  integration), `src/content.config.ts` (the blog glob takes
  `**/[^_]*.{md,mdx}`), the pre-commit hook's file pattern (so `.mdx`
  is formatted), `CLAUDE.md`.
- No post changes.
- **Done when:** the built HTML of every existing post is byte-for-byte
  what it was (a diff of `dist/posts/` before and after, in the PR),
  and a throwaway `.mdx` post (not committed) renders a component.

#### S4. A demo wrapper, with no physics in it

The lifecycle every demo needs, proven with a plain canvas animation.

- **Touches:** new `src/components/demo/Demo.astro` (markup, a
  processed `<script>`, so TypeScript), `src/components/demo/lifecycle.ts`
  (the logic, importable by tests), `src/components/demo/Bounce.astro`
  (the dummy: a ball bouncing, no wasm), a draft post using it.
- **A demo is a function** `(canvas, signal) => dispose`: the wrapper
  knows nothing about wasm.
- **Starts** when scrolled into view (so nothing is fetched for readers
  who never reach it); **pauses** off-screen and when the tab is
  hidden.
- **Client-side navigation:** stops and disposes on
  `astro:before-swap`; starts on `astro:page-load`. The site has
  `<ClientRouter />` on, so both paths are real.
- **Themes:** colours read from the site's CSS variables; redrawn when
  `data-theme` changes.
- **Reduced motion:** with `prefers-reduced-motion`, starts paused,
  with a play control.
- **A failure shows:** if the demo throws (or its wasm doesn't load),
  the canvas is replaced by a short message, not a blank box.
- **Hooks for tests,** on the wrapper's element: `data-demo-state`
  (`idle`, `loading`, `running`, `paused`, `failed`),
  `data-demo-frames`, and a page-wide count of live demos.
- **Done when:** checked by hand in the draft post, both themes, both
  ways of arriving, with a screen recording or notes in the PR. S5
  automates it.

#### S5. A browser test for demos

- **Touches:** `package.json` (`@playwright/test`, a `test:demos`
  script), `playwright.config.ts`, `tests/demos.spec.ts`,
  `tests/demo-pages.ts` (the list of pages), `.github/workflows/ci.yml`
  (a second job), `.gitignore`.
- **Runner: Playwright.** `npm run test:demos` builds, serves `dist/`
  with `astro preview`, and runs the checks in headless Chromium. The
  browser download stays on developers' machines and CI; Amplify never
  installs it (it's a dev dependency the build doesn't use).
- **In CI:** a second job, `demos`, after `check`: installs Chromium
  (cached), runs `npm run test:demos`, uploads the failure traces. It
  becomes a second required check (the same settings change as S2).
- **Locally:** on demand. No hook: per-PR CI is the gate.
- **The checks,** run against every page in the list (S4's draft post
  to begin with; drafts are built for the test with a flag):
  1. *It draws:* scrolled into view, the state reaches `running`,
     frames advance, the canvas isn't one colour, and the page logged
     no errors.
  2. *It doesn't load early:* before scrolling, the state is `idle`
     and nothing was fetched for it.
  3. *It cleans up:* following a link leaves zero live demos; coming
     back starts exactly one.
  4. *It pauses:* a hidden tab stops the frame count.
  5. *Themes:* toggling the theme changes the canvas's colours.
  6. *Reduced motion:* emulated, the demo starts `paused`.
- **Done when:** green in CI, and each check is shown to fail when the
  behaviour it guards is broken on purpose (the PR lists the six
  breakages tried).

#### S6. Hello Particles, as a draft

*(needs P2, the first release, V1, V2)*

- **Touches:** `package.json` and `package-lock.json` (the release's
  tarball URL; the lock pins its hash),
  `src/components/demo/HelloParticles.astro`, a post with
  `draft: true`, `tests/demo-pages.ts`.
- **The component:** S4's wrapper; the package's loader; the fountain
  scene; `demo_advance(elapsed)` each frame (the fixed 60 Hz clock is
  inside the wasm); the positions buffer drawn as points, in the
  theme's colours. On dispose: `demo_free`.
- **Two more checks,** which only a real demo can have:
  - the `.wasm` arrives as `application/wasm` from the preview;
  - **physics is happening:** the particles' pixels differ between two
    frames a second apart. A frozen canvas fails.
- `amplify.yml` doesn't change unless V1 said it needs a header.
- **Done when:** CI is green including the new checks, and the built
  `dist/` holds exactly one content-hashed `.wasm` (its name in the
  PR).

#### S7. The post, published

The writing, and `draft: false`. Yours to write; I can draft.

- **Done when:** merged, deployed, and the page works on the real
  domain in both themes.

#### S8. A check of the live site

- **Touches:** `scripts/check-live.mjs`, `package.json`
  (`check:live`).
- Fetches the published post and its `.wasm` from the real domain and
  checks the status and content type: V1, kept as a script, for after
  any change to Amplify's settings. Run by hand (it needs the network
  and a deployed site, so it isn't in CI).
- **Done when:** it passes against production, and fails against a
  made-up URL.

### Order

```
V4 ──► V1 ───────────────────────────────────────┐
V3 ──► S1                                        │
V2 ──► P2                                        │
P1 ──► P2 ──► P3 ──► (first release, on request) ┼──► S6 ──► S7 ──► S8
S1 ──► S2 ──► S3 ──► S4 ──► S5 ──────────────────┘
```

- P1–P3 and S1–S5 don't depend on each other: they can go in parallel.
- V2 comes before P2; V3 before S1; V4 before V1; V1 before S6.
- S1 and S2 come first on the site so that every later site PR is
  checked.

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
   file's hash changes with it); CI runs the demo tests on it.

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
  types); a changed *behavior* doesn't, which is what S5 and S6's
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
| Posts can't hold components | S3 |
| Client-side navigation, teardown, themes | S4, and S5 keeps it true |
| A demo that silently stops drawing after an update | S5, S6's checks |
| Page helpers assume a page | Not resolved: not reused |
| Scenes compiled into the wasm | Not resolved: a release per new scene |

## Decided

- The lab site (`site/` here) is never published.
- The package travels as a tarball on a GitHub release; nothing goes
  to the public npm registry.
- The site gets CI on every pull request (S1, S2, S5); this repo gets
  it nightly (`17-nightly-ci.md`).
- Release pruning: later, low priority.

## Open questions

- **The package's name.** `physics-engine` is a placeholder.
