# Local Windows Setup

This runbook captures the working state on Frank's Windows machine as of 2026-06-17.

## Installed Paths

- Hermes source: `C:\Users\frank\AppData\Local\hermes\hermes-agent`
- Hermes CLI: `C:\Users\frank\AppData\Local\hermes\hermes-agent\venv\Scripts\hermes.exe`
- Hermes home/config: `C:\Users\frank\AppData\Local\hermes`
- Web dashboard: `http://127.0.0.1:9119`

## Verified Commands

```powershell
hermes version
hermes doctor --fix
hermes dashboard --port 9119 --no-open --skip-build
```

The dashboard loaded successfully in-browser with title `Hermes Agent - Dashboard` and redirected to `/sessions`.

## Native Desktop Fix

The native Windows desktop originally failed on this machine after rebuild. Source-mode logs showed:

```text
GPU process exited unexpectedly: exit_code=-2147483645
FATAL: GPU process isn't usable. Goodbye.
```

Tried:

- Config migration: fixed `config.yaml` from v0 to v29.
- Hermes source: local `c6e99ab`, fetched `origin/main` `36ae9584` with 33 newer upstream commits.
- Forced desktop rebuild: succeeded and regenerated `apps/desktop/release/win-unpacked/Hermes.exe`.
- Fresh Electron user data profile.
- GPU/WebGL/Vulkan flags.
- Windows safe-graphics patch in `apps/desktop/electron/main.cjs`.
- `--no-sandbox` inside the Windows safe-graphics fallback, which stopped the renderer crash loop.

Result: CLI, dashboard, and packaged desktop are healthy after a local dirty rebuild. The Start Menu shortcut points at:

```text
C:\Users\frank\AppData\Local\hermes\hermes-agent\apps\desktop\release\win-unpacked\Hermes.exe
```

The fix is local to this Hermes checkout and may be overwritten by a future `hermes update`. Before updating, rebase or reapply the Windows fallback and rebuild the desktop, unless upstream has shipped an equivalent fix.

## Working Web UI

Run:

```powershell
hermes dashboard --port 9119 --no-open --skip-build
```

Open:

```text
http://127.0.0.1:9119/sessions
```

## Health Checklist

```powershell
hermes version
hermes doctor
hermes logs errors -n 80
hermes logs desktop -n 80
```

Expected acceptable warnings:

- Optional messaging packages not installed until configured.
- Missing provider auth for providers you are not using.
- Missing `OPENROUTER_API_KEY` if using another provider or Nous Portal.

Blocking issues:

- No configured inference provider.
- Dashboard not returning HTTP 200.
- New renderer crash entries after the safe-graphics rebuild.
