# Contributing

This repo is an independent operator guide for Hermes Agent fleets. Contributions should make the system easier to run, verify, deploy, or explain.

## Standards

- Prefer official Hermes/Nous docs for behavior claims.
- Link primary sources for deployment/provider details.
- Keep provenance clear: this is not an official Nous Research repository.
- Do not commit secrets, provider keys, profile homes, session data, or memory databases.
- Prefer reproducible specs and scripts over screenshots or vague prose.

## Good Additions

- Tested profile templates.
- Deployment manifests with persistent storage and secret-store notes.
- Control-plane scripts that print or validate commands before executing them.
- Case studies that distinguish Hermes Agent, Hermes models, and third-party managed products.

## Validation

Before opening a PR or pushing to `main`, run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 list
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 emit-local
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Content .\configs\starlight-hermes-swarm.example.json -Raw | ConvertFrom-Json | Out-Null"
```
