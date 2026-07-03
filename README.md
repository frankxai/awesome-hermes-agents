<p align="center">
  <img src="assets/hero.svg" alt="Awesome Hermes Agents" width="100%">
</p>

<h1 align="center">✦ Awesome Hermes Agents</h1>

<p align="center">
  <strong>The definitive operator playbook for Hermes Agent — profiles, swarms, Starlight composition, and agentic income architecture.</strong>
</p>

<p align="center">
  <a href="https://github.com/frankxai/awesome-hermes-agents/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href="https://github.com/NousResearch/hermes-agent"><img src="https://img.shields.io/badge/Hermes_Agent-v0.16.0-purple" alt="Hermes Agent"></a>
  <a href="https://github.com/frankxai/awesome-hermes-agents/blob/main/CONTRIBUTING.md"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg" alt="Contributions Welcome"></a>
  <a href="https://awesome.re"><img src="https://awesome.re/badge.svg" alt="Awesome"></a>
</p>

<p align="center">
  <a href="#-quickstart">Quickstart</a> ·
  <a href="#-architecture">Architecture</a> ·
  <a href="#-ecosystem">Ecosystem</a> ·
  <a href="#-gencreator-evolution-layer">GenCreator</a> ·
  <a href="#-companion-repos">Repos</a> ·
  <a href="docs/operator-decision-guide.md">Decision Guide</a> ·
  <a href="docs/deployment-matrix.md">Deploy</a>
</p>

---

> **This is an independent FrankX / Starlight curation repo — not an official Nous Research repository.**
> Use the [official Nous docs](https://github.com/NousResearch/hermes-agent) as source of truth for Hermes Agent behavior.
> Use this repo as your operator playbook for local machines, founder systems, and agent-army architectures.

---

## What Is This?

Curated guides, architecture patterns, deployment notes, and templates for building with [Nous Research Hermes Agent](https://github.com/NousResearch/hermes-agent) and composing Hermes-style agent fleets.

**Who it's for:** Founders, engineers, and agent operators who want to run production-grade Hermes swarms — not toy demos.

**What you'll find:**
- Battle-tested profile patterns and swarm topologies
- Deployment configurations for Railway, Vercel, and Cloudflare
- GenCreator 6-Pillar CoE meta-orchestration layer
- Starlight Intelligence System (SIS) integration guides
- Skills and templates for agentic income systems

---

## ✦ What "Hermes" Means

There are several related but distinct things. Don't conflate them:

| Term | What It Is |
|---|---|
| **Hermes Agent** | Open-source agent framework by [Nous Research](https://github.com/NousResearch/hermes-agent) |
| **Hermes models** | Nous model family names (e.g. Hermes 3, Hermes 2 Pro) |
| **Nous Portal / Tool Gateway** | Nous-managed model and tool routing for Hermes Agent users |
| **Starlight Hermes pattern** | FrankX / Starlight architecture composing profiles, skills, memory, MCP, and Codex-managed config generation |
| **Higgsfield Supercomputer** | A managed creative pipeline product — do NOT describe as a hosted Hermes Agent fleet |

---

## ⚡ Quickstart

**Verified baseline: `v0.16.0` — `2026-06-17`**

```bash
# Verify install
hermes --help
hermes version
hermes doctor --fix

# Web dashboard
open http://127.0.0.1:9119/sessions
```

> **Windows note:** Native Electron desktop requires a safe-graphics rebuild that disables GPU/WebGPU paths and Chromium sandboxing (`exit_code=-2147483645`). See [Local Windows Setup](docs/local-windows-setup.md) for the patch.
> `hermes version` may report upstream updates available — rebase or reapply the local desktop patch **before** running `hermes update`.

---

## 📐 Architecture

The recommended pattern: use **Hermes Agent profiles as durable agent identities**, not ad-hoc port-spawned clones.

```bash
hermes profile create coder
coder setup
coder chat
```

Use **Hermes Kanban** for durable multi-agent work coordination. Use **Starlight Intelligence System (SIS)** as the cross-tool memory/provenance substrate when multiple CLIs and repos need shared state.

**Core architecture docs:**

| Doc | Purpose |
|---|---|
| [Architecture Pattern](docs/architecture.md) | Swarm topology and profile composition |
| [Operator Decision Guide](docs/operator-decision-guide.md) | When to use Hermes vs. Claude Code vs. Codex vs. DeepAgents |
| [Deployment Matrix](docs/deployment-matrix.md) | Railway / Vercel / Cloudflare / local targets |
| [Codex Control Plane](docs/codex-control-plane.md) | Config generation, hooks, and publish flows |
| [Provenance and Naming](docs/provenance-and-naming.md) | SIS identity, memory, and audit surface |
| [Managed Offerings](docs/managed-offerings.md) | Adjacent platforms and hosted options |
| [Roadmap](docs/roadmap.md) | Planned capabilities and evolution |

---

## 🌐 Ecosystem

Hermes Agent works best as **one layer in a broader agent operating system**. Keep this repo Hermes-specific; use companion repos for general agent OS design.

| Tool | Role in the Stack |
|---|---|
| **OpenClaw** | Chat and mobile gateway into selected local agents and channels |
| **DeepAgents / Deep Agents Code** | Durable harnesses for longer-running research and coding workflows |
| **Claude Code** | Repo maintainer lanes built around `CLAUDE.md`, skills, MCP, and subagents |
| **Codex** | Control-plane work for repo edits, tests, rules, hooks, skills, worktrees, and publish flows |
| **LiteLLM Agent Platform** | Model routing, provider policy, key management, budgets, and observability |
| **Starlight Intelligence System** | Memory, provenance, health checks, and swarm audit surface |
| [arcanea-agent](https://github.com/frankxai/arcanea-agent) | Local creative intelligence cockpit |
| [arcanea-agents](https://github.com/frankxai/arcanea-agents) | Agent registry and creative profile distribution |

---

## 🧬 GenCreator Evolution Layer

> **Added 2026-06-26** — Meta artifacts for continuous `Test → Eval → Experiment → Evolve → Build` cycles.

These artifacts advance the Starlight Hermes pattern and GenCreator 6-Pillar CoE toward an autonomous, self-improving swarm:

### GenCreator Hermes Swarm Intelligence Dashboard
**File:** `docs/gencreator-swarm-dashboard.html`

An interactive world-class HTML dashboard with:
- Live swarm status across all registered agents
- 6-Pillar CoE Guardian overview
- Full GitHub registry with links to all companion repos
- Experiment hooks and live build actions

Open directly in browser — no server required.

### gencreator-swarm-evolver Skill
**File:** `~/.hermes/skills/gencreator-swarm-evolver/SKILL.md`

Self-improving meta-orchestrator for the entire swarm. Integrates:
- 6-Pillar Guardians
- Multi-LLM Arena
- `frontend-ultimate`, `kanban`, `cron`, ASPH modules

Load into any Hermes session with:
```bash
hermes chat -s gencreator-swarm-evolver
```

---

## 🛠 Skills

| Skill | Path | What It Does |
|---|---|---|
| `arcanea-image-gen` | `skills/arcanea-image-gen/SKILL.md` | Enables agents to call Arcanea Studio's 200+ model router for images, video, lipsync, and cinema |
| `gencreator-swarm-evolver` | `~/.hermes/skills/gencreator-swarm-evolver/SKILL.md` | Self-improving meta-orchestrator for the full swarm |

---

## 📦 Companion Repos

| Repo | Purpose |
|---|---|
| [agentic-architecture-field-guide](https://github.com/frankxai/agentic-architecture-field-guide) | Vendor-neutral guide: when to use Hermes, OpenClaw, DeepAgents, Claude Code, Codex, MCP, LiteLLM |
| [awesome-agent-operating-systems](https://github.com/frankxai/awesome-agent-operating-systems) | Broader curated index of agent OS, coding agents, MCP, memory, orchestration, safety, and managed-agent projects |
| [starlight-agent-army-architecture](https://github.com/frankxai/starlight-agent-army-architecture) | Starlight-specific playbook: profile topology, SIS memory/provenance, Codex workflows, swarm operations |
| [hermes-cockpit](https://github.com/frankxai/hermes-cockpit) | Swarm control cockpit and registry for local and Railway Hermes Agents |

---

## 🔍 Validate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 list
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 emit-local
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 doctor
```

---

## 📁 Repo Structure

```
awesome-hermes-agents/
├── .github/workflows/      # CI / agent operating guide
├── assets/                 # Hero SVG and visual assets
├── configs/                # starlight-hermes-swarm.example.json
├── docs/                   # All operator guides and the swarm dashboard
├── examples/               # Reference configs and usage examples
├── scripts/                # hermes-swarm.ps1 — list, validate, emit
├── skills/                 # Hermes skill modules (arcanea-image-gen, etc.)
└── templates/
    ├── agents/             # Profile spec shape for registry compilers
    └── deploy/             # Railway, Vercel, Cloudflare Tunnel templates
```

This repo is intentionally **documentation-first**, with just enough executable surface to validate and emit a Hermes swarm topology.

---

## 🤝 Contributing

Contributions are welcome — especially for:
- New skill modules (`skills/`)
- Operator patterns and deployment guides (`docs/`)
- Profile spec examples (`templates/agents/`)

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. Please keep contributions Hermes-Agent-specific. For broader agent OS content, contribute to [awesome-agent-operating-systems](https://github.com/frankxai/awesome-agent-operating-systems).

---

## 📜 License

[MIT](LICENSE) — FrankX / Starlight Intelligence

---

<p align="center">
  Built by <a href="https://github.com/frankxai">frankxai</a> · Powered by <a href="https://github.com/NousResearch/hermes-agent">Nous Research Hermes Agent</a> · Part of the <strong>Starlight Intelligence System</strong>
</p>
