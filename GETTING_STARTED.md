# Getting Started — Hermes Agents

This repo is a **web-first awesome list** of Hermes Agent resources, plus optional operator playbooks under `docs/`.

## 1. Official install (always first)

1. [Installation](https://hermes-agent.nousresearch.com/docs/getting-started/installation)
2. [Quickstart](https://hermes-agent.nousresearch.com/docs/getting-started/quickstart)
3. [Profiles](https://hermes-agent.nousresearch.com/docs/user-guide/profiles)
4. [Kanban tutorial](https://hermes-agent.nousresearch.com/docs/user-guide/features/kanban-tutorial)

```bash
hermes version
hermes doctor
```

Windows desktop notes: [docs/local-windows-setup.md](docs/local-windows-setup.md)

## 2. Browse the ecosystem (README)

Open [README.md](./README.md) for curated links **from across the web**:

- UIs (WebUI, Studio, Workspace, …)
- Skills (wondelai, skill-factory, oh-my-hermes, …)
- Memory (gbrain, mnemosyne, codegraph, …)
- Multi-agent / deploy tools

Skills deep-dive: [awesome-hermes-agent-skills](https://github.com/frankxai/awesome-hermes-agent-skills)  
Also: [0xNyk](https://github.com/0xNyk/awesome-hermes-agent) · [SamurAIGPT](https://github.com/SamurAIGPT/awesome-hermes-agent)

## 3. First multi-agent setup

```bash
hermes profile create researcher
hermes profile create coder
hermes kanban
```

## 4. Optional operator docs in this repo

| Doc | When |
| --- | --- |
| [docs/operator-decision-guide.md](docs/operator-decision-guide.md) | Topology choices |
| [docs/deployment-matrix.md](docs/deployment-matrix.md) | Local / Railway / Vercel / CF |
| [docs/architecture.md](docs/architecture.md) | Profile-first pattern |
| `scripts/hermes-swarm.ps1` | Emit/validate example swarm |

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 doctor
```

## 5. Install skills from the *web* first

Prefer ecosystem packs (wondelai, skill-factory, etc.) from the README.  
Our free packs are optional extras under [awesome-hermes-agent-skills](https://github.com/frankxai/awesome-hermes-agent-skills).
