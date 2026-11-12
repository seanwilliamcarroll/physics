# Hosting (future work)

Status: **Not planned** (2026-11-12). The lab site under `site/` is
never to be published; public demos are written in the personal site
against a package from this repo (`16-site-demos.md`). Kept only for
its notes on what wasm needs from a server (Part 2), which apply to the
personal site too.
Written November 2026; re-verify AWS specifics before acting.

Goal: publish the demos on the personal website, which lives in a
**separate repo** and is hosted on AWS.

## Assumptions to confirm first

This guide assumes the common static setup: **S3 bucket as origin, CloudFront
in front, HTTPS via ACM**. If the personal site uses something else, the
concepts carry over but the knobs differ:

| Personal site runs on | Where the knobs in this guide live |
|---|---|
| S3 + CloudFront | Object metadata (S3), cache behaviors + response headers policies (CloudFront) |
| Amplify Hosting | Custom headers and redirects in the Amplify app settings |
| EC2 / container + nginx | `nginx.conf` (`types`, `add_header`, `gzip`/`brotli`) |

Also confirm: does the site have a Content Security Policy, and how is it deployed today (manual sync, CI)?

---

## Part 1: How the two repos fit together

The physics repo produces a folder of static files (HTML, JS, CSS, `.wasm`).
The question is who puts that folder on the server.

### Option A: Copy artifacts into the site repo

Build locally (`cargo xtask dist`), copy `dist/` into the site repo, commit, deploy as usual.

- ✅ Zero new infrastructure. Works today.
- ❌ Binary `.wasm` files in the site repo's history; manual step every update;
  the site repo doesn't know which physics commit it contains.

### Option B: Site repo pulls a versioned release

The physics repo's CI attaches `dist.tar.gz` to a tagged release. The site
repo's build downloads a **pinned version** and unpacks it under `physics/`.

- ✅ Explicit versioning: the site says "physics v0.3.0."
- ✅ The site's deploy stays the only deploy.
- ❌ Two steps per update (tag a release, bump the pin).

### Option C: Physics repo deploys itself to a path prefix (recommended)

Both repos deploy to the **same bucket and distribution**, but the physics
repo owns only `s3://<bucket>/physics/` and the site repo excludes it.

```
https://<your-domain>/            ← site repo
https://<your-domain>/physics/    ← physics repo
```

- ✅ Independent release cadence; the site just links to `/physics/`.
- ✅ Per-path CloudFront settings (headers below) without touching the rest of the site.
- ❌ The site repo's deploy must not delete `physics/`. If it runs
  `aws s3 sync --delete`, add `--exclude "physics/*"`. **This is the main trap.**

**Variant C':** a subdomain (`physics.<your-domain>`) with its own bucket
and distribution. Full isolation, but a second distribution and certificate
to manage. Worth it only if the physics site ever needs headers that would
conflict with the main site.

**Not recommended:** git submodules. They add friction to both repos and
still require a build step.

### Recommendation

Start with **A** for the first public demo (it's a one-off), move to **C**
once you're updating demos regularly.

---

## Part 2: Things wasm needs from the server

### MIME type: `application/wasm`

`WebAssembly.instantiateStreaming` **refuses** to compile a response without
`Content-Type: application/wasm`. S3 stores whatever content type the upload
sets, and `aws s3 sync` guesses from the local OS's MIME database, which may
not know `.wasm`. Set it explicitly:

```sh
aws s3 sync dist/ s3://$BUCKET/physics/ --exclude "*.wasm" --delete
aws s3 cp dist/ s3://$BUCKET/physics/ --recursive \
  --exclude "*" --include "*.wasm" --content-type application/wasm
```

Belt and braces: `site/js/wasm.js` should fall back to
`fetch → arrayBuffer() → WebAssembly.instantiate` if streaming fails, and log
why. That fallback also helps on any misconfigured local server.

Also check `.js` serves as `text/javascript` (ES modules require a JS MIME type).

### Compression

CloudFront's automatic compression (gzip and Brotli) covers
`application/wasm`, for objects between 1,000 bytes and 10,000,000 bytes,
**only if** the `Content-Type` is set correctly. One more reason the
MIME step matters. Enable "Compress objects automatically" on the cache behavior.

Wasm compresses well; Brotli typically cuts it substantially. Measure:
the binary-size tracking in `03-wasm-shell.md` should record both raw and
Brotli sizes.

Alternative: precompress in `xtask dist` and upload with
`Content-Encoding: br`. More control, more moving parts. Only if CloudFront's
compression proves insufficient.

### Caching and cache-busting

The problem: browsers and CloudFront cache `engine.wasm`; after a deploy,
visitors get stale code. Standard fix:

- **Hashed filenames** for code: `xtask dist` names it `engine.3f9a1c.wasm`
  (hash of contents) and rewrites the reference in `wasm.js`. Same for JS modules
  if needed. Serve with `Cache-Control: public, max-age=31536000, immutable`.
- **HTML** keeps stable names and is served with `Cache-Control: no-cache`
  (revalidate every time).
- After a deploy, invalidate only HTML paths (`/physics/*.html`,
  `/physics/` index). Hashed assets never need invalidation.

Hashing in `xtask` is std-only: reuse the FNV-1a from `04-testing.md`
(it's for cache keys, not security).

### Content Security Policy

If the personal site sends a CSP, wasm compilation needs
`'wasm-unsafe-eval'` in `script-src`. Without it, the page loads and
`WebAssembly.instantiate` fails with a CSP error. Scope it to `/physics/*`
via a CloudFront response headers policy rather than loosening the whole site.

### Cross-origin isolation (only for threads)

`SharedArrayBuffer` (needed for wasm threads, and for the common lock-free
ring-buffer pattern between an `AudioWorklet` and the main thread) requires:

```
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

Deferred in `03-wasm-shell.md`. If adopted, attach these with a CloudFront
response headers policy **on the `/physics/*` behavior only**. COEP blocks
cross-origin resources that don't opt in, which can break third-party
embeds elsewhere on the main site; scoping avoids that.

The acoustic track can avoid this entirely by passing audio buffers with
`postMessage` (transferable `ArrayBuffer`s) instead of shared memory. Decide
at A1.

### HTTPS

`AudioWorklet` requires a secure context. CloudFront + ACM already covers
this; locally, `localhost` counts as secure.

---

## Part 3: CI deploy (Option C)

GitHub Actions in the physics repo, authenticating to AWS with **OIDC**
(an IAM role the workflow assumes; no long-lived access keys stored as secrets).

IAM role scope: `s3:PutObject`/`DeleteObject`/`ListBucket` limited to the
`physics/*` prefix, plus `cloudfront:CreateInvalidation` on the one distribution.
The physics repo can't touch the rest of the site even if misconfigured.

Workflow shape:

```yaml
on:
  push:
    tags: ["v*"]            # deploy on tagged releases, not every push

permissions:
  id-token: write           # OIDC
  contents: read

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: rustup show    # installs the toolchain from rust-toolchain.toml
      - run: cargo test --workspace
      - run: cargo xtask dist
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ vars.AWS_DEPLOY_ROLE_ARN }}
          aws-region: ${{ vars.AWS_REGION }}
      - run: ./scripts/deploy.sh    # the sync/cp/invalidate commands above
```

Verify action versions at setup time; they move. Deploying on tags pairs
naturally with Option B too: the same workflow can attach `dist.tar.gz`
to the release.

---

## Part 4: Embedding demos in posts

Two ways a blog post on the main site can show a demo:

| Approach | Pros | Cons |
|---|---|---|
| **Link** to `/physics/demos/m3-pendulum/` | Simplest; full-page demo | Reader leaves the post |
| **`<iframe>`** of the demo page | Isolated CSS/JS; demo can't break the post; works with any site generator | Fixed size (use `aspect-ratio`); one more page load |
| Direct embed (load `wasm.js` into the post) | Tight integration | Couples the site's build to the physics build; style collisions |

Recommendation: **iframes**. Each demo page should accept an `?embed=1`
query that hides navigation and fills the frame. Pause the simulation when
the iframe is off-screen (`IntersectionObserver`), or a long post with five
demos burns CPU on all five.

---

## Do now (cheap, avoids rework later)

These cost nothing during M0–M2 and keep every option above open:

1. **Relative URLs only** in `site/` (already in `repo-layout.md`).
2. **`xtask dist` produces a self-contained folder.** Everything a server
   needs, nothing else.
3. **`wasm.js` has the non-streaming fallback** and logs which path it took.
4. **Track binary size** (raw + Brotli) per milestone.
5. **Pause when hidden:** `document.visibilityState` and later
   `IntersectionObserver`; good behavior locally too.

Everything else in this doc waits until there's a demo worth publishing.
