@echo off
echo Starting Autowolf...

REM ── SET YOUR ANTHROPIC API KEY HERE ──────────────────────────────────────────
REM Copy this file to start.bat, then replace the placeholder with your key.
REM Never commit start.bat — it contains your real API key.
set ANTHROPIC_API_KEY=sk-ant-REPLACE-WITH-YOUR-KEY
REM ─────────────────────────────────────────────────────────────────────────────

REM Start the Node proxy in a new window
start "Autowolf Proxy" cmd /k "cd /d %~dp0backend && set ANTHROPIC_API_KEY=%ANTHROPIC_API_KEY% && npm start"

REM Wait for the server to boot
timeout /t 2 /nobreak >nul

REM Open the frontend in Chrome
start chrome "%~dp0frontend\automation-guide.html"

echo Autowolf is running. Close the proxy window to shut down.
