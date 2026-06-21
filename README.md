# MyKK Markdown Viewer

A fast, mobile-first, **single-file** Markdown viewer. Drag & drop a Markdown
file (or any text file) anywhere on the page and it renders instantly. It's a
**viewer, not an editor** — no toolbars, no accounts, no uploads. Everything
runs locally in your browser.

🔗 **Live:** <https://md.mykk.us/>

![Single file](https://img.shields.io/badge/build-single%20HTML%20file-success) ![No build step](https://img.shields.io/badge/build%20step-none-success) ![License](https://img.shields.io/badge/license-MIT-blue)

## Features

- 📄 **Drag & drop anywhere** — drop a `.md`, `.txt`, `.json`, `.yaml`, or any
  text file on the page to render it. You can also **paste** text directly.
- 🏷️ **Filename in the header** — when you open or drop a file, its name shows
  in the top-left.
- ➕ **New** (`+`) — clears the screen and opens a file picker.
- 📋 **Copy** — copies the raw Markdown source to your clipboard.
- 🗑️ **Clear** — empties the view.
- 🎨 **Pick any background color** — a color swatch in the header lets you choose
  any background. Text, borders, and code blocks automatically adapt for
  contrast. Your choice is **remembered** — saved to a cookie, with a
  `localStorage` fallback so even a downloaded `file://` copy remembers it.
  Starts on white.
- 🫥 **Distraction-free** — once a file is loaded the header slides away; move
  your mouse to the **top of the window** (or tap the top edge on mobile) to
  bring it back.
- 📱 **Mobile-first** & responsive, with safe-area support for notched phones.
- 🔒 **Safe by default** — output is sanitized with DOMPurify, so a malicious
  file can't run scripts. Nothing ever leaves your device.
- 🪶 **One file, no build, no CDN** — `index.html` is fully self-contained
  (~78 KB) and works offline, even straight from `file://`.

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
retained) so the page has **zero network dependencies**.

## Privacy

100% client-side. Files you open are read in the browser and never uploaded
anywhere. No analytics, no tracking. The only thing stored is your chosen
background color, saved in a cookie (with a `localStorage` fallback) so the app
remembers it next time — even a downloaded `file://` copy.

## License

[MIT](LICENSE) © 2026 Michal Ferber, aka **TechGuyWithABeard**.

Bundled third-party libraries retain their own licenses (marked: MIT;
DOMPurify: Apache-2.0 / MPL-2.0) — see [`LICENSE`](LICENSE) for details.
