# Starlight Hermes Swarm Topology

Use this as a conceptual target, then compile it into real Hermes profiles and Kanban workers.

## Core Profiles

- `conductor`: decomposes work and writes Kanban tasks.
- `researcher`: web/docs/local-repo research.
- `coder`: code editing, tests, reviews.
- `operator`: deployment, dashboards, observability.
- `publisher`: docs, guides, social/content packaging.
- `sentinel`: security, provenance, quality gates.

## Coordination

Use Hermes Kanban for durable work assignment. Avoid fragile in-process "swarms" for serious work. Every worker should be restartable, inspectable, and tied to a profile.

## Memory

- Hermes profile memory for agent-specific habits and sessions.
- Starlight vaults for cross-tool decisions, provenance, and reusable system knowledge.
- Repo docs for public claims and setup instructions.

## Codex Role

Codex can safely manage:

- profile specs;
- generated setup guides;
- dashboard registry updates;
- deployment manifests;
- health-check scripts;
- provenance checks.

Codex should ask before:

- creating public GitHub repos;
- pushing secrets or configs;
- changing paid cloud resources;
- enabling public webhooks.

