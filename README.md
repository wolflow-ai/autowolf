# Autowolf

**Automation Guide · Wolflow Suite**

An AI-powered guide for building automations in n8n, Power Automate, and Copilot Studio. Describe what you want to build in plain language — Autowolf tells you exactly which nodes, connectors, and auth methods to use, and walks you through each step.

Built with the Anthropic Claude API and web search, so guidance is current rather than cached.

---

## What it does

- Select a platform: **n8n**, **Power Automate**, or **Copilot Studio**
- Describe your automation goal in plain language
- Get opinionated, step-by-step guidance — no options menus, no "it depends"
- Sessions persist in localStorage and can be exported/imported as JSON

---

## Setup

You need [Node.js](https://nodejs.org/) installed (v18 or later).

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

**3. Set your Anthropic API key**

PowerShell:
```powershell
$env:ANTHROPIC_API_KEY="sk-ant-..."
```

Bash/Mac:
```bash
export ANTHROPIC_API_KEY="sk-ant-..."
```

**4. Start the proxy**
```bash
npm start
# Proxy runs on http://localhost:3001
```

**5. Open the frontend**

Open `frontend/automation-guide.html` directly in your browser. No build step needed.

---

## Project structure

```
autowolf/
  backend/
    index.js          Express proxy — keeps your API key off the browser
    package.json
  frontend/
    automation-guide.html   Full app — single file, no framework
  .gitignore
  README.md
```

---

## Why a proxy?

Browsers block direct calls to the Anthropic API (CORS). The local Express proxy forwards your requests server-side, keeping your API key out of the browser entirely. Your key is set as an environment variable — it never touches the frontend.

---

## Sessions

Sessions are stored in your browser's localStorage and survive page refreshes. Use **Export** to save a JSON snapshot and **Import** to restore it on another machine.

---

## Part of the Wolflow Suite

| Tool | URL | Purpose |
|---|---|---|
| Wolflow | app.wolflow.ai | AI problem qualifier — should you start? |
| Wolfpath | path.wolflow.ai | Automation path mapper — how to start |
| Wolfbridge | bridge.wolflow.ai | Enterprise platform intelligence |
| Autowolf | local / this repo | Step-by-step automation guide |

---

*Open source. Bring your own Anthropic API key.*
