# Operator Decision Guide

This guide turns the Hermes/Starlight landscape into concrete operating choices.
Use it when deciding whether to run agents locally, deploy them as services, buy a
managed product, or let Codex maintain the config layer.

## First Principles

1. Keep agent identity durable.
   A named Hermes profile is more reliable than an anonymous process or tab. It
   has its own config, memory, skills, sessions, and operating history.
2. Keep coordination durable.
   Hermes Kanban is the default multi-agent board because tasks, runs,
   handoffs, comments, and heartbeats persist in the same `kanban.db` instead of
   living only inside a chat transcript.
3. Keep control plane state in Git.
   Codex should manage desired state: profile specs, swarm topology, env var
   names, deployment manifests, dashboard registry entries, and docs. Runtime
   state stays in Hermes homes, databases, queues, and logs.
4. Keep execution stateful.
   A shell-executing agent needs a durable filesystem and an isolated runtime.
   Use serverless request handlers for control panels and webhooks, not as the
   main place an autonomous shell agent lives.
5. Keep claims precise.
   Hermes Agent, Hermes models, Nous Portal, Higgsfield Supercomputer, and
   Starlight architecture are related surfaces, not interchangeable names.

## Decision Tree

Start with the smallest stable topology that matches the job.

| Need | Default choice | Why |
| --- | --- | --- |
| Personal coding or research on one machine | Local Hermes profile | Lowest setup cost, direct filesystem access, easy dashboard use. |
| Multiple named assistants on one machine | Hermes profiles plus Hermes Kanban | Durable profile isolation and shared task state. |
| Codex should generate and maintain agents | Git-backed Starlight/Hermes config repo | Codex can review diffs, regenerate manifests, and push changes. |
| Founder demo or always-on CPU workers | Railway services, one service per role/profile | Railway's own multi-agent guide uses separate services for independent scaling and failure isolation. |
| Public control panel, docs, or registry UI | Vercel | Excellent for frontend/API control planes; pair with a stateful worker elsewhere. |
| Expose a local dashboard or webhook safely | Cloudflare Tunnel plus Cloudflare Access | Edge auth in front of local/stateful services. |
| Fastest official tool/model setup | Nous Portal and Tool Gateway | One OAuth path for provider plus hosted tool backends. |
| Managed creative content production | Higgsfield Supercomputer | Treat as an adjacent creative-agent product, not a Hermes Agent hosting layer unless documented as such. |
| Enterprise/private-data agent | NemoClaw/OpenShell-style sandbox boundary | Use policy enforcement, credential mediation, and network controls around the agent. |

## Reference Topologies

### Local Founder Workstation

Use when the user wants a personal agent army that works on local repos.

- `HERMES_HOME`: local profile store.
- Hermes profiles: `researcher`, `coder`, `reviewer`, `publisher`, `operator`.
- Coordination: Hermes Kanban.
- Control plane: this repo plus Starlight Intelligence System.
- Dashboard: local Hermes dashboard and optional Starlight cockpit.
- Security: no public tunnel unless a webhook needs it; if tunneled, put auth in
  front of it.

### Git-Managed Swarm

Use when Codex is expected to create and manage agents.

- Source of truth: `configs/starlight-hermes-swarm.example.json`.
- Compiler output: Hermes profile creation commands, env var checklist,
  deployment manifests, dashboard registry rows, and runbooks.
- Runtime state: never committed.
- Review loop: Codex edits config, runs `scripts/hermes-swarm.ps1 doctor`, and
  pushes a clean diff.

### Railway Worker Fleet

Use when agents need to stay awake off the user's laptop.

- One Railway service per role/profile.
- Shared Postgres/Redis or another queue/store for task state.
- Hermes home mounted on persistent storage where available.
- Secrets injected through Railway variables.
- External LLM APIs; do not assume Railway is running local models.

### Vercel Control Plane

Use when the product is a dashboard, registry, marketplace, or API that schedules
agent work.

- Vercel hosts the UI/API.
- A Railway/Fly/VM/Modal/Daytona worker executes long-running Hermes work.
- Vercel functions enqueue, authorize, inspect, and display work.
- Never put long-running shell execution or unbounded agent loops directly in a
  short-lived request handler.

### Secure Enterprise Agent

Use when Hermes touches private email, Slack, GitHub, customer data, or internal
knowledge.

- Put the agent inside a sandboxed runtime.
- Mediate credentials outside the agent process when possible.
- Enforce outbound network policy.
- Persist only approved memories and skills.
- Keep an audit trail for every tool call that crosses trust boundaries.

## Buy vs Build

Build with Hermes Agent when you need:

- local repo/file awareness;
- custom tools and skills;
- profile-level memory;
- transparent runtime ownership;
- a control plane your team can inspect and version.

Use Nous Portal when you need:

- fast official onboarding;
- hosted tool backends;
- fewer vendor API keys;
- OAuth-based setup.

Use Higgsfield Supercomputer when you need:

- managed creative production;
- finished ads, films, briefs, content variants, or product visuals;
- built-in creative tools and presets.

Use a NemoClaw/OpenShell-style deployment when you need:

- stronger security boundary;
- credential isolation;
- public/private data separation;
- governed enterprise research workflows.

## Starlight Architecture Pattern

Starlight's role is the operating system around agent armies:

- memory and provenance across tools;
- profile topology and skill taxonomy;
- Codex-managed config generation;
- local/cloud deployment recipes;
- dashboards and health checks;
- precise provenance so nobody confuses FrankX/Starlight patterns with official
  Nous Research ownership.

The clean public language is:

> "Built for Hermes Agent, with Starlight operating patterns."

Avoid:

> "Starlight's Hermes", "hosted Hermes Agent by Higgsfield", or "Hermes 3 equals
> Hermes Agent."

## Source Anchors

- Hermes docs describe Hermes Agent as a self-improving agent with a built-in
  learning loop, installer paths, providers, messaging, tools, and memory:
  https://hermes-agent.nousresearch.com/docs/
- Hermes Kanban is documented as a durable board shared across profiles:
  https://hermes-agent.nousresearch.com/docs/user-guide/features/kanban
- The Hermes README documents Nous Portal and Tool Gateway setup:
  https://github.com/NousResearch/hermes-agent
- Railway's multi-agent guide recommends separate services per agent role:
  https://docs.railway.com/guides/multi-agent-system
- NVIDIA's NemoClaw example shows Hermes Agent inside a governed runtime with
  credential and network controls:
  https://developer.nvidia.com/blog/deploy-self-evolving-agents-for-faster-more-secure-research-with-a-hermes-agent-and-nvidia-nemoclaw/
- Higgsfield's Supercomputer page describes a managed creative agent experience:
  https://higgsfield.ai/supercomputer-intro
