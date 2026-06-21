# MyKK Markdown Viewer

A fast, mobile-first, **single-file** Markdown viewer. Drag & drop a Markdown
file (or any text file) anywhere on the page and it renders instantly. It's a
**viewer, not an editor** — no toolbars, no accounts, no uploads. Everything
runs locally in your browser.

🔗 **Live:** <https://md.mykk.us/>

![Light and dark mode](https://img.shields.io/badge/theme-light%20%2B%20dark-4f46e5) ![Single file](https://img.shields.io/badge/build-single%20HTML%20file-success) ![License](https://img.shields.io/badge/license-MIT-blue)

## Features

- 📄 **Drag & drop anywhere** — drop a `.md`, `.txt`, `.json`, `.yaml`, or any
  text file on the body to render it. You can also **paste** text directly.
- ➕ **New** (top-right `+`) — clears the screen and opens a file picker.
- 📋 **Copy** — copies the raw Markdown source to your clipboard.
- 🗑️ **Clear** — empties the view.
- 🌗 **Light / dark toggle** — remembers your choice; defaults to your system theme.
- 📱 **Mobile-first** & responsive, with safe-area support for notched phones.
- 🔒 **Safe by default** — output is sanitized with DOMPurify, so a malicious
  file can't run scripts. Nothing ever leaves your device.
- 🪶 **One file, no build, no CDN** — `index.html` is fully self-contained
  (~75 KB) and works offline, even straight from `file://`.

## Quick start

**Just open it.** Download [`index.html`](index.html), double-click it, and
you're done — it runs locally with no server and no internet connection.

Prefer a local server?

```sh
# Python (built-in)
python3 -m http.server 8080
# then open http://localhost:8080
```

## Run with Docker

```sh
docker build -t mykk-markdown-viewer .
docker run --rm -p 8080:80 mykk-markdown-viewer
# open http://localhost:8080
```

## Deploy to Cloudflare Pages (auto-deploy from this repo)

Connect the repository in the Cloudflare dashboard
(**Workers & Pages → Create → Pages → Connect to Git**) and use:

| Setting                  | Value          |
| ------------------------ | -------------- |
| Framework preset         | `None`         |
| Build command            | `sh build.sh`  |
| Build output directory   | `dist`         |

`build.sh` simply stamps the current Eastern-time build date into the footer
and copies the app into `dist/`. Every push to your production branch then
auto-deploys.

> Don't want a build step? You can point Pages at the repo root with no build
> command — the app still works, but the footer will show `Build local EST`
> instead of a real timestamp.

Then add your custom domain `md.mykk.us` under the project's **Custom domains** tab.

## How it works

Everything is in [`index.html`](index.html):

- Your HTML/CSS/UI and the app logic.
- [**marked**](https://github.com/markedjs/marked) `v12.0.2` (MIT) for Markdown → HTML, with GitHub-Flavored Markdown (tables, task lists, strikethrough, fenced code).
- [**DOMPurify**](https://github.com/cure53/DOMPurify) `v3.1.6` for sanitizing the rendered HTML.

Both libraries are embedded inline (minified, with their license banners
retained) so the page has **zero network dependencies**. The only build-time
substitution is the `__BUILD_TIME__` token used for the footer.

## Privacy

100% client-side. Files you open are read in the browser and never uploaded
anywhere. No analytics, no cookies, no tracking. The only thing stored is your
light/dark preference in `localStorage`.

## License

[MIT](LICENSE) © 2026 Michal Ferber, aka **TechGuyWithABeard**.

Bundled third-party libraries retain their own licenses (marked: MIT;
DOMPurify: Apache-2.0 / MPL-2.0) — see [`LICENSE`](LICENSE) for details.
