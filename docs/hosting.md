# What wasm needs from a server

Status: **Reference.** This file was once a plan to publish the lab
site under `site/` (S3 and CloudFront, a deploy workflow, iframes in
posts). That isn't going to happen: public demos are written in the
personal site against a package from this repo (`16-site-demos.md`),
and the old plan is in git's history. What's left is what any host of a
`.wasm` file has to get right, which applies to the personal site too.

## MIME type: `application/wasm`

`WebAssembly.instantiateStreaming` **refuses** to compile a response
without `Content-Type: application/wasm`. The loader
(`site/js/engine-loader.ts`) falls back to compiling the fetched bytes
and says so once on the console, so a wrong type costs start-up time,
not the page. Amplify, the personal site's host, sends the right type
unprompted (`16-site-demos.md`, V1). `.js` must be served as
`text/javascript`: ES modules require a JS MIME type.

## Compression

Wasm compresses well (`03-wasm-shell.md` tracks raw and gzip sizes). A
CDN's automatic compression usually keys on the content type, one more
reason it has to be right.

## Caching

Browsers and CDNs cache `engine.wasm`; after a deploy, visitors can get
stale code paired with new JavaScript. The standard fix is
content-hashed file names served as immutable, with the HTML
revalidated every time. On the personal site the bundler does this
(`16-site-demos.md`, V2). The lab site isn't hashed: `cargo xtask serve`
sends `Cache-Control: no-store` instead (`03-wasm-shell.md`).

## Content Security Policy

If the site sends a CSP, wasm compilation needs `'wasm-unsafe-eval'` in
`script-src`. Without it the page loads and `WebAssembly.instantiate`
fails with a CSP error.

## Cross-origin isolation (only for threads)

`SharedArrayBuffer` (needed for wasm threads, and for the common
lock-free ring buffer between an `AudioWorklet` and the main thread)
requires:

```
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

COEP blocks cross-origin resources that don't opt in, which can break
third-party embeds elsewhere on a site, so scope the headers to the
pages that need them. Nothing here needs them today: the acoustic track
posts transferable buffers instead of sharing memory
(`12-acoustic-foundations.md`), and threads are deferred (`workers.md`).

## HTTPS

`AudioWorklet` requires a secure context; `localhost` counts as one.
