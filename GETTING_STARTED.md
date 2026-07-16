# Getting Started — Hermes Agents

This guide is for **Hermes Agent** (Nous Research), not Claude Code skill folders.

Official install and first chat always win:

1. [Installation](https://hermes-agent.nousresearch.com/docs/getting-started/installation)
2. [Quickstart](https://hermes-agent.nousresearch.com/docs/getting-started/quickstart)
3. [Profiles](https://hermes-agent.nousresearch.com/docs/user-guide/profiles)
4. [Kanban tutorial](https://hermes-agent.nousresearch.com/docs/user-guide/features/kanban-tutorial)

## 1. Confirm the runtime

```bash
hermes version
hermes doctor
hermes --help
```

On Windows, also read [docs/local-windows-setup.md](docs/local-windows-setup.md) if the desktop app crashes on GPU/sandbox paths.

## 2. Create durable agent identities (profiles)

```bash
hermes profile create researcher
hermes profile create coder
hermes profile create publisher
```

Each profile gets its own config, env, soul, memory, sessions, skills, and gateway state. That isolation is what makes multi-agent systems debuggable.

## 3. Coordinate with Kanban

```bash
hermes kanban
# or use the web dashboard after:
hermes dashboard
```

Kanban is a durable board shared across profiles — prefer it over chat-only handoffs for serious multi-agent work.

## 4. Add skills (companion repo)

**Skills live primarily in:**

→ [frankxai/awesome-hermes-agent-skills](https://github.com/frankxai/awesome-hermes-agent-skills)

```bash
# Example: copy a free pack into your Hermes skills directory
# Windows typical: %LOCALAPPDATA%\hermes\skills\
# or profile-specific skills under your Hermes home

# Then reload skills / start a new session and invoke the skill by name.
```

Open-core free packs today include:

- `coding-agents-superpack`
- `todo-discipline`

See Skill Portfolio OS docs inside that repo: `docs/skill-portfolio-os/`.

## 5. Optional: emit a Starlight swarm skeleton from this repo

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 list
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 emit-local
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\hermes-swarm.ps1 doctor
```

Config shape: [`configs/starlight-hermes-swarm.example.json`](configs/starlight-hermes-swarm.example.json)

## 6. Decision shortcuts

| Goal | Default |
| --- | --- |
| Solo coding / research on laptop | Local Hermes profile + dashboard |
| Multi-role army on one machine | Profiles + Kanban |
| Always-on bots / messaging | Railway / VPS / Fly / Render worker with persistent `HERMES_HOME` |
| Public UI / docs only | Vercel control plane; workers elsewhere |
| Skill library growth | awesome-hermes-agent-skills + official creating-skills guide |

Full matrix: [docs/operator-decision-guide.md](docs/operator-decision-guide.md)

## 7. Where *not* to put things

- Do not commit real `.env`, profile homes, sessions, or provider tokens.
- Do not treat Hermes **models** as Hermes **Agent**.
- Do not dump skill packs into this agents repo when they belong in the skills repo.

## 8. Next reading

- [docs/architecture.md](docs/architecture.md)
- [docs/deployment-matrix.md](docs/deployment-matrix.md)
- [docs/provenance-and-naming.md](docs/provenance-and-naming.md)
- Official: [Skills](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills) · [Messaging](https://hermes-agent.nousresearch.com/docs/user-guide/messaging/telegram)
