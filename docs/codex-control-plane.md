# Codex Control Plane

Codex can manage Hermes swarms by treating profiles, skills, secrets, MCP servers, and deployment targets as desired state. The goal is not to replace Hermes Agent; the goal is to make Hermes fleets reproducible.

## Responsibilities

- Read the swarm spec.
- Validate that each agent has an id, profile name, purpose, owner, and deploy target.
- Emit local profile commands.
- Emit cloud deployment hints for Railway, Vercel control planes, and Cloudflare Tunnel.
- Keep provenance clear: official Hermes Agent behavior belongs to Nous Research docs; this repo provides operator patterns.

## Local Loop

```powershell
pwsh ./scripts/hermes-swarm.ps1 list
pwsh ./scripts/hermes-swarm.ps1 doctor
pwsh ./scripts/hermes-swarm.ps1 emit-local
```

The script intentionally prints commands instead of executing them. That makes it safe for Codex, Claude Code, and humans to review before creating profiles or cloud services.

## Cloud Loop

Use Railway/Fly/Render/VPS for long-running Hermes workers. Use Vercel and Cloudflare as control, auth, routing, and dashboard layers unless you have a stateful worker runtime behind them.

```powershell
pwsh ./scripts/hermes-swarm.ps1 emit-railway
pwsh ./scripts/hermes-swarm.ps1 emit-vercel
pwsh ./scripts/hermes-swarm.ps1 emit-cloudflare
```

## Founder Pattern

For a founder or small team, start with three profiles:

- `operator`: coordinates tasks, priorities, and Kanban.
- `builder`: edits repos and runs tests.
- `researcher`: gathers sources, synthesizes docs, and writes market maps.

Add specialist profiles only when there is a repeated job with its own memory, tools, and risk boundaries.
