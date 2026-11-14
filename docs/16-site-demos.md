# Demos on the personal site

Status: **Done** (planned 2026-11-12, finished 2026-11-13): the checks
V1–V4, this repo's steps P1–P3 and the first release (`v0.1.0`), and the
site's S1–S8. Hello Particles is published at
<https://www.seanwilliamcarroll.com/posts/hello-particles/>. This
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

## The two repos, before this work

What the plan started from (2026-11-12); the steps below changed most of
it.

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

## Prerequisites: four checks, all answered (2026-11-12)

Throwaway experiments and lookups; nothing merged. How each was done is
in git's history.

- **V1. Does Amplify serve `.wasm` as `application/wasm`? Yes,**
  unprompted (an 8-byte `.wasm` on a temporary Amplify branch). No
  header rule is needed.
  - A missing `.wasm` is a real `404`, not the site's index with a 200:
    the loader sees a failed fetch, not HTML.
  - Everything is served `cache-control: public, max-age=0` with an
    ETag, the hashed `/_astro/` files too: browsers revalidate each file
    on each visit (a cheap `304`). A rule making `/_astro/*` immutable
    would save those round trips; optional, not planned.
  - Not learned: whether Amplify compresses a full-size `.wasm` in
    transit. S8's live check reads `content-encoding` on the real file.
- **V2. Does Vite bundle a wasm file from a tarball dependency under
  Astro 7? Yes.** `import wasmUrl from "physics-engine/engine.wasm?url"`
  built to a content-hashed file in `dist/_astro/`, byte for byte the
  one that went in; `npm install <tarball URL>` wrote the URL and a
  `sha512` into the lock file, and a clean `npm ci` installed from it;
  `astro check` accepted the package's types. The package needs an
  `exports` entry for the wasm (`"./engine.wasm": "./engine.wasm"`) and
  nothing else special. Not tried: that `npm ci` refuses a tarball
  whose bytes changed (npm's documented behavior).
- **V3. Which Node does Amplify build with? 22 then** (the image's
  default, nothing pinning it). `amplify.yml` now runs `nvm install`,
  so Amplify follows the site's `.nvmrc`; that file and this repo's
  both moved to 24 on 2026-11-13 (#248 here, #13 there).
- **V4. Are Amplify pull-request previews on? No,** and they stay off.
  A **temporary Amplify branch** does the same job when a step must be
  seen on Amplify before merging (`aws amplify create-branch`,
  `start-job`, look, `delete-branch`: one build of about two minutes,
  nothing left behind).

## The work, as pull requests

**P** steps are pull requests in this repo, **S** steps in
`personal_site`. The two repos meet at S6. Nightly CI for this repo is
its own plan (`17-nightly-ci.md`).

```
P1 ──► P2 ──► P3 ──► first release ──┐
S1 ──► S2 ──► S3 ──► S4 ──► S5 ──────┴──► S6 ──► S7 ──► S8
```

Everything up to S6 is done; S7 and S8 are left.

### physics (done)

- **P1. The loader, separated from the page** (#237).
  `site/js/engine-loader.ts`: `instantiate(source, name)` takes a URL,
  a `Response` or bytes and returns the typed exports, the memory, and
  a function reading the last panic. No module-level state, so
  instances share nothing (tested: a panic in one isn't reported by the
  other). If `instantiateStreaming` is refused it compiles the fetched
  bytes and says so once. The page's part (the step budget) stays in
  `wasm.ts`. Not `synth-live.ts`: the acoustic module is instantiated
  inside the audio worklet, a different path, to be packaged when a
  post wants sound.
- **P2. `cargo xtask package`** writes
  `target/package/physics-engine-<version>.tgz` (84 KB, 13 files:
  `engine.wasm`; the entry point `engine-package.js`; the loader, the
  buffer views and `abi.js`; a `.d.ts` beside each; `package.json`,
  `README.md`, `LICENSE`) and checks it by using it, in `pre-push` too:
  unpacked into a scratch project, a TypeScript consumer type-checked
  against its `.d.ts` (`xtask/package_check.ts`), and the fountain run
  60 steps in Node (`xtask/package_check.mjs`).
  - The version is `version` under `[workspace.package]` in
    `Cargo.toml`.
  - Found by the check: `tsc` rewrites `"./abi.ts"` to `"./abi.js"` in
    the JavaScript it emits but not in the declarations; the command
    rewrites those specifiers in the `.d.ts`.
  - Scope: the engine only. Sand, swarm and acoustic become subpaths
    when a post wants one.
- **P3. `cargo xtask release`**, and the procedure in "Releases" below.
  The first release, `v0.1.0`, was cut on 2026-11-13.

**Later, not scheduled:** pruning old releases (`gh release delete vX
--cleanup-tag` for all but the pinned version and the last few; the
files are small); *P4*, drawing helpers in the package, once a second
or third demo repeats them ("How this scales").

**Not planned, on purpose:** a general "build a world from JS" ABI (a
demo that needs new physics gets a scenario in Rust and a release, so
scenes stay tested and deterministic); making `loop.ts`, `canvas.ts`
and `options.ts` mountable (they stay the lab's).

### personal_site

`main` is protected by a ruleset (pull requests only, squash merges),
with the `check` job required (`demos`, S5's job, was still to be made
required when S5 merged). Done, 2026-11-12 and 13:

- **S1, S2. CI on every pull request, required** (site #2). One job,
  `check`, mirroring the hooks: `npm ci`, Prettier (checking), ESLint,
  the build (`astro check`, the build, Pagefind). Per PR, unlike here:
  it takes a couple of minutes, and what lands on `main` is deployed at
  once.
- **S3. MDX** (site #5, #6), so a post can hold a component. Every
  existing post's built HTML was byte for byte what it had been.
- **S4. A demo wrapper, with no physics in it** (site #7):
  `src/components/demo/`. A demo is a factory
  `canvas => { frame(elapsedSeconds, info), dispose? }`, registered by
  name; the wrapper owns the animation loop. It:
  - starts when scrolled into view (nothing is fetched for readers who
    never reach it), and pauses off screen and in a hidden tab;
  - disposes on `astro:before-swap` and starts on `astro:page-load`
    (the site's client-side navigation makes both paths real);
  - reads its colours from the site's CSS variables and redraws when
    `data-theme` changes;
  - starts paused, with a play control, under `prefers-reduced-motion`;
  - shows a short message in place of the canvas if the demo throws.
  - Drafts are built only with `PUBLIC_SHOW_DRAFTS=true`, which Amplify
    never sets.
- **S5. A browser test for demos** (site #8): Playwright, a desktop and
  a phone project, its own build with drafts into `dist-demos/`. For
  every page in `tests/demo-pages.ts` it checks each of the wrapper's
  behaviours above. A request to any other site fails the test, as does
  a console error; no retries. The analytics tag is included only in a
  production build without drafts, so a test run isn't a visit.
- **S6. Hello Particles, as a draft** (site #9): the release's tarball
  URL in `package.json` (the lock pins its hash); the wrapper, the
  package's loader, the fountain scene, `demo_advance(elapsed)` each
  frame, the positions drawn as points in the theme's colours;
  `demo_free` on dispose. Three more checks only a real demo can have:
  nothing fetched before it's scrolled to; the `.wasm` arrives as
  `application/wasm`; and the particles' pixels differ between two
  frames a second apart (a frozen canvas fails).

#### S7. The post, published

**Done** (2026-11-13, personal_site #16): Sean's words, `draft: false`.
Checked on the real domain in a browser, light and dark: the demo
starts when scrolled to, runs (60 frames in a second), draws in the
theme's colours, and logs no errors.

- **Done when:** merged, deployed, and the page works on the real
  domain in both themes.

#### S8. A check of the live site

**Done** (2026-11-13, personal_site #17): `npm run check:live` (through
`./dc`). It finds the `.wasm` by following the page's scripts (no hashed
name to keep up to date), checks its status, type and magic bytes, and
that a made-up page is a real 404. It passes against production and
fails on a missing page. Not checked: `content-encoding` (brotli was
seen by hand, V1; a wrong encoding would show as a broken download, which
the magic-byte check catches).

- **Touches:** `scripts/check-live.mjs`, `package.json`
  (`check:live`).
- Fetches the published post and its `.wasm` from the real domain and
  checks the status, content type and `content-encoding`: V1, kept as a
  script, for after any change to Amplify's settings. Run by hand (it
  needs the network and a deployed site, so it isn't in CI).
- **Done when:** it passes against production, and fails against a
  made-up URL.

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
