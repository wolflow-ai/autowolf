# Autowolf

**Automation Guide · Wolflow Suite**

An AI-powered guide for building automations in n8n, Power Automate, and Copilot Studio. Describe what you want to build in plain language — Autowolf tells you exactly which nodes, connectors, and auth methods to use, and walks you through each step.

Built with the Anthropic Claude API and web search, so guidance is current rather than cached.

**Hosted version:** [wolflow.ai/autowolf](https://wolflow.ai/autowolf/) — free, no install, bring your own Anthropic API key (it stays in your browser's memory, never stored). This repo is the run-it-locally version, which keeps your key server-side behind a small proxy instead.

---

## What it does

- Select a platform: **n8n**, **Power Automate**, or **Copilot Studio**
- Describe your automation goal in plain language
- Get opinionated, step-by-step guidance — no options menus, no "it depends"
- Sessions persist in localStorage, named by platform and timestamp
- Export sessions as JSON (backup/restore) or TXT (readable conversation)

---

## Requirements

- [Node.js](https://nodejs.org/) v18 or later
- An [Anthropic API key](https://console.anthropic.com/)

---

## Setup

**1. Clone the repo**
```bash
git clone https://github.com/YOUR_USERNAME/autowolf.git
cd autowolf
```

**2. Install backend dependencies**
```bash
cd backend
npm install
```

**3. Create your start script**

Copy `start.example.bat` to `start.bat` in the root folder:
```
autowolf\
  start.example.bat   ← template, safe to commit
  start.bat           ← your copy, never committed
```

Open `start.bat` in Notepad and replace the placeholder with your Anthropic API key:
```bat
set ANTHROPIC_API_KEY=sk-ant-your-actual-key-here
```

Save and close.

**4. Run Autowolf**

Double-click `start.bat`. It will:
- Open the Node proxy in its own terminal window (port 3001)
- Launch the frontend in Chrome automatically

To shut down, close the proxy terminal window.

---

## Project structure

```
autowolf/
  backend/
    index.js              Express proxy — keeps your API key server-side
    package.json
  frontend/
    automation-guide.html Full app — single file, no framework, no build step
  .gitignore
  start.example.bat       Startup script template — edit and save as start.bat
  README.md
```

---

## Why a proxy?

Browsers block direct calls to the Anthropic API (CORS). The local Express proxy forwards your requests server-side, keeping your API key out of the browser entirely. Your key is set in `start.bat` as an environment variable — it never touches the frontend or the repo.

---

## Security note

`start.bat` contains your API key in plain text and is excluded from the repo via `.gitignore`. Never commit it. If you accidentally push it, rotate your key immediately at [console.anthropic.com](https://console.anthropic.com/).

---

## Sessions

Sessions are stored in your browser's localStorage and survive page refreshes. Each session is named by platform and timestamp (e.g. `n8n · 20260430_1437`). Use **Export TXT** to save a readable conversation and **Export JSON** to back up all sessions for import on another machine.

---

## Part of the Wolflow Suite

| Tool | URL | Purpose |
|---|---|---|
| Wolflow | app.wolflow.ai | AI problem qualifier — should you start? |
| Wolfpath | path.wolflow.ai | Automation path mapper — how to start |
| Wolfbridge | bridge.wolflow.ai | Enterprise platform intelligence |
| Autowolf | wolflow.ai/autowolf | Step-by-step automation guide (hosted · BYO key · local via this repo) |

---

*Open source. Bring your own Anthropic API key.*
