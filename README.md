# MyKK Markdown Viewer

A fast, mobile-first, **single-file** Markdown viewer. Drag & drop a Markdown
file (or any text file) anywhere on the page and it renders instantly. It's a
**viewer, not an editor** — no toolbars, no accounts, no uploads. Everything
runs locally in your browser.

🔗 **Live:** <https://md.mykk.us/>

![Single file](https://img.shields.io/badge/build-single%20HTML%20file-success) ![No build step](https://img.shields.io/badge/build%20step-none-success) ![License](https://img.shields.io/badge/license-MIT-blue)

> Part of the **[File Viewer](https://file-viewer.us/) family** — HTML, Markdown,
> ePUB, PDF, and Data each have their own dedicated viewer. Use the **☰ menu**
> in the header to jump between them.

## Features

- 📄 **Drag & drop anywhere** — drop a `.md`, `.txt`, `.json`, `.yaml`, or any
  text file on the page to render it. You can also **paste** text directly.
- 🏷️ **Filename in the header** — when you open or drop a file, its name shows
  in the top-left.
- 📋 **Copy** — copies the raw source to your clipboard.
- 🗑️ **Clear** — empties the view.
- ✅ **Validated on open** — accepts `.md`, `.markdown`, `.mdx`, `.txt`, `.rst`,
  `.adoc`; anything else is rejected with a notice.
- 🎨 **Pick any background color** — a color swatch in the header lets you choose
  any background. Text, borders, and code blocks automatically adapt for
  contrast. Your choice is **remembered** — saved to a cookie, with a
  `localStorage` fallback so even a downloaded `file://` copy remembers it.
  Starts on white.
- 🫥 **Distraction-free** — once a file is loaded the header hides when you
  scroll down and returns when you scroll up (or after ~5s idle); the footer has
  a **×** to dismiss it too.
- 📱 **Mobile-first** & responsive, with safe-area support for notched phones.
- 🔒 **Safe by default** — output is sanitized with DOMPurify, so a malicious
  file can't run scripts. Your files never leave your device.
- 🪶 **One file, no build** — `index.html` is self-contained (~78 KB) and the
  viewer works offline, even straight from `file://`.
- 📊 **Privacy-friendly analytics** — the hosted site uses a self-hosted,
  cookieless [Plausible](https://plausible.io/) instance (see [Privacy](#privacy)).

## Quick start

**Just open it.** Download [`index.html`](index.html), double-click it, and
you're done — it runs locally with no server, no build, and no internet
connection.

Prefer a local server?

```sh
python3 -m http.server 8080   # then open http://localhost:8080
```

Any static web server works too — there is nothing to build.

## Deploy to Cloudflare Pages (auto-deploy from this repo)

Connect the repository in the Cloudflare dashboard
(**Workers & Pages → Create → Pages → Connect to Git**) and use:

| Setting                  | Value            |
| ------------------------ | ---------------- |
| Production branch        | `main`           |
| Framework preset         | `None`           |
| Build command            | *(leave blank)*  |
| Build output directory   | `/`              |

It's a static site — Cloudflare just serves `index.html`. The included
[`_headers`](_headers) file applies security headers (CSP, `nosniff`,
`frame-ancestors`, etc.) automatically. Every push to `main` then
auto-deploys.

Add your custom domain `md.mykk.us` under the project's **Custom domains** tab —
Cloudflare creates the DNS record and provisions SSL for you.

## How it works

Everything is in [`index.html`](index.html):

- Your HTML/CSS/UI and the app logic — no build step, no tooling.
- [**marked**](https://github.com/markedjs/marked) `v12.0.2` (MIT) for Markdown → HTML, with GitHub-Flavored Markdown (tables, task lists, strikethrough, fenced code).
- [**DOMPurify**](https://github.com/cure53/DOMPurify) `v3.1.6` for sanitizing the rendered HTML.

Both libraries are embedded inline (minified, with their license banners
retained), so the viewer renders with **no network dependencies** and works
fully offline. The only external request is the analytics script on the hosted
site (see [Privacy](#privacy)).

## Privacy

Your files stay on your device — they're read in the browser and never uploaded
anywhere, and your content is never sent to any server.

The hosted site at **md.mykk.us** uses a self-hosted
[Plausible](https://plausible.io/) instance for **privacy-friendly, cookieless**
page analytics: aggregate visit counts only — no personal data, no cross-site
tracking, no advertising. Plausible automatically ignores `localhost` and
`file://`, so a downloaded local copy reports nothing.

The only thing stored on your device is your chosen background color (a cookie,
with a `localStorage` fallback).

## License

[MIT](LICENSE) © 2026 Michal Ferber, aka **TechGuyWithABeard**.

Bundled third-party libraries retain their own licenses (marked: MIT;
DOMPurify: Apache-2.0 / MPL-2.0) — see [`LICENSE`](LICENSE) for details.
