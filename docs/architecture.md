# Architecture Pattern

The clean architecture is: Hermes Agent for durable agent identities and tool execution, Starlight Intelligence System for cross-tool memory/provenance, and Codex for generating and maintaining configs, guides, and profile registries.

## Layers

1. Operator layer: Frank, founders, teams, or creators define goals and approval policy.
2. Control layer: Codex / Claude Code / other coding agents maintain repositories, configs, scripts, and deployment templates.
3. Hermes identity layer: Hermes profiles represent named durable agents with isolated home directories.
4. Coordination layer: Hermes Kanban or an external queue coordinates tasks across profiles.
5. Memory/provenance layer: Starlight Intelligence System, Hermes memory, and repo docs store decisions and reusable skills.
6. Execution layer: local shell, Docker, SSH, Modal, Daytona, Railway/Fly/Render services, or other configured terminal backends.
7. Provider layer: Nous Portal, OpenRouter, Anthropic, OpenAI, local Ollama/vLLM/LM Studio, or other OpenAI-compatible endpoints.

## Profile-First Agent Armies

Prefer profiles over fake long-running clones:

```bash
hermes profile create researcher
hermes profile create coder
hermes profile create publisher
```

Each profile owns:

- `config.yaml`
- `.env`
- `SOUL.md`
- memories
- sessions
- skills
- gateway state

That isolation is what makes a "swarm" debuggable.

## Starlight Pattern

For Starlight Intelligence System, do not present "Hermes" as a proprietary Starlight technology. Present it as:

- Official dependency: Nous Research Hermes Agent.
- Starlight contribution: profile topology, memory/provenance substrate, agent-army operating model, founder deployment guides, Codex-managed config generation.

The Starlight swarm can compile:

- profile specs
- skill bundles
- MCP server registrations
- dashboard registry rows
- deployment manifests
- health checks

## Control-Plane Contract

Codex should treat Hermes profiles as desired state, not as an opaque running process. A practical repo contract is:

- source of truth: `configs/*.json` or `configs/*.yaml`
- generated artifacts: `.env.example`, Railway services, Cloudflare tunnel routes, Vercel control-plane APIs, dashboard registry rows
- runtime state: Hermes profile homes, Hermes Kanban, sessions, memories
- audit trail: Git commits plus Starlight memory/provenance notes

The control plane should never store raw provider keys in Git. It should emit instructions for secret stores and validate that required env var names exist.

## Avoid This

Do not claim:

- "Starlight built Hermes Agent."
- "Higgsfield Supercomputer is a Hermes Agent hosting service."
- "Hermes 3 model equals Hermes Agent."
- "Ports 8081/8082 mean agents are online" unless there is a real server health endpoint.

Do claim:

- "Built with/for Hermes Agent."
- "Uses the Hermes Agent profile and Kanban model."
- "Powered by Starlight memory/provenance patterns."
- "Independent guide; official Hermes behavior belongs to Nous Research docs."
