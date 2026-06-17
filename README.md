<p align="center">
  <img src="assets/hero.svg" alt="Awesome Hermes Agents" width="100%">
</p>

<h1 align="center">Awesome Hermes Agents</h1>

<p align="center">
  <strong>Hermes Agent operator guides, profile patterns, deployment notes, and Starlight composition resources.</strong>
</p>

<p align="center">
  <a href="#start-here">Start Here</a> ·
  <a href="docs/operator-decision-guide.md">Decision Guide</a> ·
  <a href="docs/architecture.md">Architecture</a> ·
  <a href="docs/deployment-matrix.md">Deploy</a> ·
  <a href="docs/provenance-and-naming.md">Provenance</a>
</p>

Curated guides, architecture patterns, deployment notes, and templates for building with [Nous Research Hermes Agent](https://github.com/NousResearch/hermes-agent) and composing Hermes-style agent fleets.

This is an independent FrankX / Starlight curation repo. It is not an official Nous Research repository. Use the official Nous docs as source of truth for Hermes Agent behavior, and use this repo as an operator playbook for local machines, founder systems, and agent-army architectures.

## Current Baseline

Verified on 2026-06-17:

- Hermes Agent local install: `v0.16.0`, local source `c6e99ab`, current fetched `origin/main` `36ae9584`.
- CLI works: `hermes --help`, `hermes version`, `hermes doctor --fix`.
- Web dashboard works: `http://127.0.0.1:9119/sessions`.
- Native Windows desktop works after a local Electron safe-graphics rebuild. The fix disables GPU/WebGPU paths and Chromium sandboxing on Windows because this machine hit renderer crashes with `exit_code=-2147483645`.
- `hermes version` currently reports upstream updates available. Rebase or reapply the local desktop patch before running `hermes update` on this machine.

## Start Here

- [Local Windows Setup](docs/local-windows-setup.md)
- [Operator Decision Guide](docs/operator-decision-guide.md)
- [Architecture Pattern](docs/architecture.md)
- [Deployment Matrix](docs/deployment-matrix.md)
- [Codex Control Plane](docs/codex-control-plane.md)
- [Provenance and Naming](docs/provenance-and-naming.md)
- [Managed Offerings and Adjacent Platforms](docs/managed-offerings.md)
- [Roadmap](docs/roadmap.md)

## Companion Repositories

- [agentic-architecture-field-guide](https://github.com/frankxai/agentic-architecture-field-guide) - vendor-neutral architecture guide for deciding when to use Hermes Agent, OpenClaw, DeepAgents, Claude Code, Codex, MCP, LiteLLM, and cloud deployment targets.
- [awesome-agent-operating-systems](https://github.com/frankxai/awesome-agent-operating-systems) - broader curated index of agent OS, coding agent, MCP, memory, orchestration, safety, deployment, and managed-agent projects.
- [starlight-agent-army-architecture](https://github.com/frankxai/starlight-agent-army-architecture) - Starlight-specific implementation playbook for profile topology, SIS memory/provenance, Codex workflows, and swarm operations.

## What "Hermes" Means

There are several related but distinct things:

- Hermes Agent: the open-source agent framework by Nous Research.
- Hermes models: Nous model family names such as Hermes 3.
- Nous Portal / Tool Gateway: Nous-managed model and tool routing for Hermes Agent users.
- Starlight Hermes pattern: FrankX/Starlight architecture that composes Hermes Agent profiles, skills, memory, MCP, and Codex-managed config generation.
- Higgsfield Supercomputer: a managed creative pipeline product; do not describe it as a hosted Hermes Agent fleet unless Higgsfield documents that explicitly.

## Works With

Hermes Agent works best as one layer in a broader agent operating system:

- OpenClaw: chat and mobile gateway into selected local agents and channels.
- DeepAgents / Deep Agents Code: durable harnesses for longer-running research and coding workflows.
- Claude Code: repo maintainer lanes built around `CLAUDE.md`, skills, MCP, and subagents.
- Codex: control-plane work for repo edits, tests, rules, hooks, skills, worktrees, and publish flows.
- LiteLLM Agent Platform: model routing, provider policy, key management, budgets, and observability.
- Starlight Intelligence System: memory, provenance, health checks, and swarm audit surface.

Keep this repo Hermes-specific. Use the companion architecture guide and awesome list when the topic becomes general agent OS design.

## Recommended Pattern

Use Hermes Agent profiles as durable agent identities, not ad-hoc port-spawned clones:

```bash
hermes profile create coder
coder setup
coder chat
```

Use Hermes Kanban for durable multi-agent work coordination, and use Starlight Intelligence System as the cross-tool memory/provenance substrate when multiple CLIs and repos need shared state.

## Validate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 list
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 emit-local
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 doctor
```

## Repo Status

This repo is intentionally documentation-first, with just enough executable
surface to validate and emit a Hermes swarm topology:

- `scripts/hermes-swarm.ps1` lists, validates, and emits local setup commands.
- `configs/starlight-hermes-swarm.example.json` is the machine-readable swarm example.
- `templates/deploy/` includes Railway, Vercel control-plane, and Cloudflare Tunnel templates.
- `templates/agents/` includes a profile spec shape for future registry compilers.
