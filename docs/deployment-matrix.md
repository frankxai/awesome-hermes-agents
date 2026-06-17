# Deployment Matrix

Hermes Agent can run locally, on a VPS, in containers, or as part of a managed stack. The right target depends on whether the agent must stay awake, receive webhooks, execute shell commands, or expose a dashboard.

## Local Machine

Best for:

- Personal coding agents.
- File-system-aware research.
- Local MCP integration.
- Dashboard use on `127.0.0.1`.

Pattern:

```bash
hermes profile create coder
coder setup
coder chat
```

Use Cloudflare Tunnel or ngrok only when an external webhook must reach the local machine.

## VPS / Fly / Render

Best for:

- Always-on gateway agents.
- Telegram, Discord, Slack, WhatsApp, Matrix, or webhook bots.
- Persistent volumes for `HERMES_HOME`.

Requirements:

- Persistent disk for `~/.hermes`.
- Secret store for provider keys and messaging tokens.
- Health checks.
- HTTPS for webhook platforms.

## Railway

Best for:

- Multi-service CPU agents calling external LLM APIs.
- One service per agent/profile.
- Fast founder demos and public templates.

Use Railway services for long-running workers, not Vercel-style request handlers. Railway's own multi-agent guidance recommends separate services so agents can scale and fail independently.

Template: `templates/deploy/railway.service.example.json`

## Vercel

Best for:

- Documentation sites.
- Control panels.
- Profile registry UIs.
- API surfaces that enqueue work elsewhere.

Avoid running a long-lived Hermes gateway directly in Vercel serverless functions. If using Vercel, put Hermes execution behind:

- a queue,
- a Railway/Fly/VM worker,
- a hosted managed agent runtime,
- or an external API runtime such as LiteLLM Agent Platform.

Template: `templates/deploy/vercel.control-plane.example.json`

## Cloudflare

Best for:

- Cloudflare Tunnel to expose local dashboards/webhooks.
- Cloudflare Access in front of a dashboard.
- Workers for lightweight routing, auth, and webhooks.

Avoid assuming Cloudflare Workers can host a full shell-executing Hermes Agent. Use Workers as the edge gate and route to a stateful worker/VM/container behind it.

Template: `templates/deploy/cloudflare-tunnel.example.yml`

## Docker

Best for:

- Repeatable server deploys.
- Isolated terminal backend.
- Multi-profile stacks.

Minimum design:

- image with Python 3.11+, Node 20+, git, ripgrep
- volume at `/root/.hermes` or `/data/hermes-home`
- secrets injected by platform
- explicit startup command (`hermes gateway`, `hermes dashboard`, or profile-specific command)
