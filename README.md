# Deploy and Host GenOffice on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/genoffice?referralCode=sLjDXb&utm_medium=integration&utm_source=button&utm_campaign=genoffice)

This template runs [GenOffice](https://github.com/genspark-ai/genoffice), the open-source AI office suite from Genspark, in the cloud. It's streamed to any browser through the [linuxserver.io](https://www.linuxserver.io/) Selkies web desktop. Open your Railway domain, log in, and GenOffice is running on the server. Your documents and settings are kept between visits.

## About Hosting GenOffice

GenOffice is a free alternative to Microsoft Office. It opens and saves real `.docx`, `.xlsx` and `.pptx` files, and edits PDF, Markdown and HTML. Every document has an AI agent next to it that makes the change and shows exactly what it touched, as tracked changes and diffs with one-click rollback. It's a desktop app, so this template runs it in a GPU-less desktop session streamed over WebSockets. Access is gated by HTTP basic auth (`CUSTOM_USER` and a generated `PASSWORD`), and everything under `/config` is kept on a Railway volume.

## Common Use Cases

- One AI office workspace you can open from any laptop, tablet or borrowed computer, with your documents always on it
- Let the agent draft decks, rewrite reports or build spreadsheets with live formulas while you're away from your own machine
- Convert PDFs to Word, Excel or PowerPoint, or Markdown and HTML to Word, without installing anything locally
- A shared office box for a small team behind one login

## Dependencies for GenOffice Hosting

- None. Single service, no database.

### Deployment Dependencies

- [GenOffice on GitHub](https://github.com/genspark-ai/genoffice)
- [linuxserver.io Selkies base image](https://github.com/linuxserver/docker-baseimage-selkies)
- [Template source on GitHub](https://github.com/nomideusz/genoffice-railway)

### Implementation Details

**First use.** Open your Railway domain and log in with `CUSTOM_USER` and the generated `PASSWORD` from the service's Variables tab. The GenOffice window opens on its own. If you close it, right-click the desktop to start it again.

**AI models.** The agent needs a model. Either sign in with a Genspark account and skip keys, or open Settings → AI and paste your own key for Claude, OpenAI, Gemini, DeepSeek, OpenRouter and others. Any OpenAI-compatible endpoint works too. Calls go straight from your Railway service to the provider you pick.

**Files.** Save documents under `/config` (the home directory), which is on the volume. Drag files into the browser window to upload them, and use the Selkies sidebar to download files back.

**Resources.** GenOffice idles at about 420 MB of RAM with almost no CPU. That fits Railway's Trial plan (1 GB), but it's too tight for the Free plan (0.5 GB) once you open documents. Use Hobby for big files or long agent runs. Rendering is CPU-only, since Railway has no GPU. That's fine for documents and slides.

Notes and limits:

- Keep the login strong. The password gate is the whole security model.
- Only `/config` is kept. Anything installed outside it is gone after a redeploy.
- Want a whole desktop instead of one app? The same author publishes a [Linux Desktop](https://railway.com/deploy/linux-desktop?referralCode=sLjDXb) template.

## Why Deploy GenOffice on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying GenOffice on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
