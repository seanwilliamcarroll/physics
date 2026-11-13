# Demos on the personal site

Status: **In progress** (planned 2026-11-12). Done: the checks V1–V4,
this repo's steps P1–P3 and the first release (`v0.1.0`, 2026-11-13),
and the site's S1–S6 (Hello Particles is in the site as a draft post).
Left: S7 (the post, published) and S8 (a check of the live site). This
replaces `hosting.md`, which was about publishing this repo's pages:
that isn't going to happen.

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
2026-11-12):

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
  push), as of 2026-11-12.

## Prerequisites: four things to check first

**All four answered (2026-11-12):** V1 yes, V2 yes, V3 Node 22, V4
off. Nothing blocks P1 or S1.

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

**Result (2026-11-12): yes.** A throwaway branch of the site holding
an 8-byte `.wasm` under `public/`, deployed as a temporary Amplify
branch (its own URL; production untouched; branch and deploy deleted
after):

- `content-type: application/wasm`, the bytes intact. No header rule
  is needed, and `amplify.yml` stays as it is.
- A missing `.wasm` is a real `404` (`text/html`), not the site's
  index with a 200: the loader will see a failed fetch, not HTML.
- **Everything is served `cache-control: public, max-age=0`** with an
  ETag, the hashed `/_astro/` files too: browsers revalidate each file
  on each visit (a cheap `304`), and Amplify's CDN holds it for a year.
  So a visitor can't be stuck on an old file, hashed or not. A rule
  making `/_astro/*` immutable would save those round trips; optional,
  not planned.
- Not learned: whether Amplify compresses a full-size `.wasm` in
  transit (8 bytes are below any threshold). S8's live check reads
  `content-encoding` on the real file.

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

**Result (2026-11-12): yes.** In a scratch copy of the site (Astro
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

The site's `.nvmrc` says `22` (it was first written here that there
was none: wrong), but nothing made Amplify read it: its build used
whatever the image provides. CI (S1) and local development should use
the same major version as the deploy, or "green in CI" doesn't mean
"builds on Amplify".

- **How:** the app's build settings (the build image and any "live
  package updates" for Node), and the `node --version` line in the
  last build's log.
- **Decides:** the number S1 writes into `.nvmrc`, and whether
  `amplify.yml` should say `nvm use` so the three agree by
  construction instead of by coincidence.

**Result (2026-11-12): Node 22** (v22.23.4, npm 10.9.9), from
`node -v` added to the same throwaway branch's build. The build log
doesn't print it otherwise.

- No image or package override is set on the app: this is the default
  image's default (`nvm`'s `default -> 22`), with 20 and 24 also
  installed.
- Astro 7 needs `>=22.12.0`, so 22 is also the lowest that works.
- **For S1:** `.nvmrc` says `22` (as this repo's did; both moved to 24
  on 2026-11-13, #248 here and #13 there), CI reads it,
  and `amplify.yml` gains `nvm use` so Amplify follows the file
  instead of its image's default, which can change under us.
- Also seen: the app's stored build settings are a leftover **Hugo**
  build spec. The repo's `amplify.yml` overrides it, so it does
  nothing, but it would run if that file were ever removed. Worth
  clearing in the console; not part of this plan.

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

**Result (2026-11-12): off.** The app has one branch, `main`
(production, auto-build on), with pull-request previews disabled and
no automatic branch creation.

- V1 didn't need them: a **temporary Amplify branch** did the same job
  (`aws amplify create-branch`, `start-job`, look, `delete-branch`).
  One build of about two minutes; nothing left behind.
- **For the site's steps:** previews stay off unless you decide
  otherwise. S4, S6 and S7 are reviewed from CI's results and a local
  `npm run preview`; a step that must be seen on Amplify before
  merging can use the same temporary-branch trick.

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

**Done** (2026-11-12, #237).

Refactor only: every lab page behaves as before.

- **Touches:** new `site/js/engine-loader.ts`; `site/js/wasm.ts`,
  `sand-wasm.ts`, `swarm-wasm.ts` (thinner);
  `tests/site/engine-loader.test.js`; `.githooks/pre-push` (the site
  is built before the JS tests, which now need the wasm);
  `docs/03-wasm-shell.md`. Not `synth-live.ts`: the acoustic module is
  compiled on the page and instantiated inside the audio worklet, a
  different path, to be packaged when a post wants sound.
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

**Done** (2026-11-12). `cargo xtask package` writes
`target/package/physics-engine-<version>.tgz` (84 KB) and checks it.

- **In the tarball** (13 files):
  - `engine.wasm`: the release build `cargo xtask site` makes, already
    checked against `engine.d.ts`;
  - `engine-package.js`: the entry point (`loadEngine`, and everything
    below re-exported);
  - `engine-loader.js` (P1's loader), `engine-views.js` (typed-array
    views of the buffers, moved out of the lab's `wasm.ts`), `abi.js`
    (scene codes and caps);
  - a `.d.ts` beside each, and `engine.d.ts`;
  - `package.json`, `README.md`, `LICENSE`.
- **How a site uses it:**
  ```js
  import wasmUrl from "physics-engine/engine.wasm?url";
  import { loadEngine, DEMO_FOUNTAIN, SCALAR_F32, positionsView } from "physics-engine";
  const { engine } = await loadEngine(wasmUrl);
  ```
- **The version** is `version` under `[workspace.package]` in
  `Cargo.toml` (`0.1.0`); the command refuses anything that isn't
  `MAJOR.MINOR.PATCH`.
- **Its check, every time it runs** (and it runs in `pre-push`): the
  tarball is unpacked as `node_modules/physics-engine` of a scratch
  project; a TypeScript consumer is type-checked against its `.d.ts`
  (`xtask/package_check.ts`, including that a bare number is refused
  where a handle belongs); and the fountain runs 60 steps in Node
  through the package's entry points (`xtask/package_check.mjs`).
- **One thing the check found while it was being written:** `tsc`
  rewrites `"./abi.ts"` to `"./abi.js"` in the JavaScript it emits but
  not in the declarations, so a consumer's type-check couldn't find
  the files. The command rewrites those specifiers in the `.d.ts`.
- **Scope:** the engine only. Sand, swarm and acoustic become subpaths
  when a post wants one.

#### P3. Releasing, written down and scripted

**Done** (2026-11-12): `cargo xtask release` and the procedure in
"Releases" below. Rehearsed with `--dry-run` on its own branch: it
named the two things not ready (not `main`, uncommitted changes),
built and checked the package, wrote "The first release." as the
notes, and printed the `gh release create v0.1.0 …` command. It did
not run it; nothing does.

- **Cutting a release is a separate, explicit step** (it's public),
  done on request: on `main`, `cargo xtask release`, then the command it
  prints. The first, `v0.1.0`, was cut on 2026-11-13.

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

`main` is protected (done 2026-11-12, by a ruleset: pull requests
only, squash merges, no deletion or force push). The site's hooks
today: pre-commit runs Prettier (rewriting staged files), ESLint and
`astro check`; pre-push runs the production build.

#### S1. CI on every pull request

The site gets checks **per PR** (decided): they take a couple of
minutes, and what lands on `main` is deployed by Amplify at once.

- **Done** (2026-11-12, personal_site #2).
- **Touches:** new `.github/workflows/ci.yml`; `amplify.yml`
  (`nvm install` before `npm ci`, so Amplify follows `.nvmrc`, which
  already existed and said `22`); `README.md`, `CLAUDE.md`
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

**Done** (2026-11-12): a scratch pull request with a type error was
reported `BLOCKED` by GitHub, then closed.

A settings change, not a PR: the `protect-main` ruleset gains a
required status check, `check`. From then on a PR can't be merged
until its run is green. Done after S1 merges (GitHub only offers
checks it has seen run).

- **Done when:** the scratch PR from S1 can't be merged while red.

#### S3. MDX

**Done** (2026-11-12), as two pull requests: Astro 7.0 → 7.4 first
(personal_site #5; `@astrojs/mdx` needed the newer Astro), then MDX
(#6).

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
- **Done** (2026-11-12, personal_site #7).
- **A demo is a factory** `canvas => { frame(elapsedSeconds, info),
  dispose? }` (it may be async), registered by name with
  `registerDemo`. The wrapper owns the animation loop and calls
  `frame`, so pausing, the frame count and the cap on a long frame
  live in one place; it knows nothing about wasm. (The plan first said
  a bare function `(canvas, signal) => dispose`, which would have left
  every demo to write its own loop.)
- **Drafts need a switch:** the site never builds drafts, so the
  draft post couldn't be looked at. They are built only with
  `PUBLIC_SHOW_DRAFTS=true` in the environment
  (`src/utils/drafts.ts`); Amplify never sets it.
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

**Done** (2026-11-12, personal_site #8), but for `demos` becoming a
required check (a ruleset change, after the merge).

- **Touches:** `package.json` (`@playwright/test`; `build:demos`,
  `test:demos`), `playwright.config.ts`, `tests/` (`demo-pages.ts`,
  `fixtures.ts`, `demos.spec.ts`, `wrapper.spec.ts`),
  `.github/workflows/ci.yml`, `.gitignore`; a second draft post and a
  `Broken` demo, for the failure message; the analytics tag (below).
- **Runner: Playwright,** with the Chromium it pins, as two projects:
  a desktop and a phone (narrow, touch). The browser download stays on
  developers' machines and CI; Amplify never installs it.
- **Its own build.** `npm run test:demos` builds with drafts into
  `dist-demos/` and serves that with `astro preview`: the ordinary
  build in `dist/` is left alone.
- **Nothing leaves the machine.** A request to any other site is
  refused and fails the test, and so does a console error.
- **Analytics only in the published build.** Loading a page fired the
  Google Analytics tag, so a test run (and `npm run dev`) counted as a
  visit. The tag is now included only in a production build without
  drafts (`src/utils/analytics.ts`); the `check` job fails if the
  ordinary build loses the tag or gains a draft page. Blocking the
  request in the tests alone would have left the tag in the tested
  build and depended on every test remembering to block it.
- **In CI:** a second job, `demos`: installs Chromium, runs
  `npm run test:demos`, and uploads the report (with a trace) of a
  failure. No retries: a test that passes on a second try is flaky,
  and should be seen.
- **Locally:** on demand. No hook: per-PR CI is the gate.
- **The checks.** For every page in `tests/demo-pages.ts`, each demo:
  starts when scrolled to, draws more than one colour, and keeps
  moving; pauses and resumes with its button; is disposed on leaving
  the page and mounted once on return. For the wrapper, on its draft
  posts: idle until scrolled to; paused off screen; paused in a hidden
  tab; redrawn in the new colours on a theme change; paused at first
  under "reduce motion"; a message in place of the canvas when a demo
  can't start.
- **Shown to fail:** with the tag put into the test build (all 18
  tests), with the dispose-on-navigation listener removed (2), and
  with the theme's colours not re-read (2). The other checks' breakages
  weren't tried one by one.
- **Not checked:** "nothing was fetched before scrolling" (the dummy
  demo fetches nothing; S6's can check it).

#### S6. Hello Particles, as a draft

**Done** (2026-11-13, personal_site #9). *(Needed P2, the first release,
V1, V2.)*

- **Touches:** `package.json` and `package-lock.json` (the release's
  tarball URL; the lock pins its hash),
  `src/components/demo/HelloParticles.astro`, a post with
  `draft: true`, `tests/demo-pages.ts`.
- **The component:** S4's wrapper; the package's loader; the fountain
  scene; `demo_advance(elapsed)` each frame (the fixed 60 Hz clock is
  inside the wasm); the positions buffer drawn as points, in the
  theme's colours. On dispose: `demo_free`.
- **Three more checks,** which only a real demo can have:
  - nothing is fetched for the demo before it's scrolled to;
  - the `.wasm` arrives as `application/wasm` from the preview;
  - **physics is happening:** the particles' pixels differ between two
    frames a second apart. A frozen canvas fails.
- `amplify.yml` doesn't change (V1: no header needed).
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

**Cutting one:**

1. **A PR here bumps `version`** under `[workspace.package]` in
   `Cargo.toml`; merged. (What the number means is below.)
2. **On `main`, pulled: `cargo xtask release`.** It publishes nothing.
   It:
   - refuses unless the branch is `main`, the tree is clean, `HEAD` is
     `origin/main`, and the tag `v<version>` doesn't exist yet;
   - builds and checks the package (`cargo xtask package`);
   - writes draft notes to `target/package/release-notes-v<version>.md`:
     the ABI's changes since the last release, as the lines added and
     removed in `engine.d.ts` and `abi.ts`;
   - prints the command for step 3.
3. **Read the notes, edit them, and run the printed command:**
   `gh release create v<version> <tarball> --title … --notes-file …`.
   This is the public step, and a person runs it.
4. **A PR in the site** changes the tarball URL in `package.json` and
   runs `npm install` (the lock file's hash changes with it); CI runs
   the demo tests on it.

`cargo xtask release --dry-run` rehearses steps 2's build and notes
from any branch, reporting what isn't ready instead of stopping.

**What a version means.** The ABI is the contract: the exports'
signatures and the integer codes. Before 1.0:

- a change to or removal of an existing export or code: bump the
  **minor** version (`0.1.x` to `0.2.0`). The site's build will fail on
  a changed signature (the types say so), which is the signal to read
  the notes;
- an addition, or a fix that leaves the ABI alone: bump the **patch**.

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
