# Managed Offerings and Adjacent Platforms

This is a living map, not legal or vendor advice.

## Nous Portal / Tool Gateway

Official Nous surface for model access, provider auth, and hosted tool usage. Current docs describe a Tool Gateway included with paid Nous Portal subscriptions, routing tools such as web search, image generation, text-to-speech, and cloud browser automation without separately managing every vendor account.

Use when:

- you want the lowest-friction official Hermes Agent provider/tool setup;
- you want hosted tool usage;
- you do not want to manually wire Browserbase, Firecrawl, FAL, etc.

## Higgsfield Supercomputer

Higgsfield describes Supercomputer as a managed agentic creative pipeline that runs Higgsfield for content creation. Public material says it is powered by an enhanced Hermes 3 model tuned for agentic task execution.

Treat as:

- an adjacent managed creative-agent product;
- evidence that Hermes model tech is being used in managed creative workflows.

Do not claim:

- it is a hosted Hermes Agent fleet;
- it exposes Hermes Agent profiles, Kanban, skills, or `HERMES_HOME`;
- Starlight depends on Higgsfield unless your own implementation actually does.

## LiteLLM Agent Platform

Local repo `litellm-agent-platform` includes a `templates/hermes` bridge that exposes Hermes Agent behind an Anthropic Managed Agents-style API. This is useful if you want a unified UI/API for multiple runtimes: OpenCode, Hermes, Claude Managed Agents, Cursor Agents API, and DeepAgents.

Use when:

- you want a multi-runtime agent control plane;
- Hermes should be one runtime among several;
- provider credentials should stay in a gateway layer.

## OpenClaw Launch and Community Hosts

Some community guides and products present one-click or managed Hermes deployment. Treat these as third-party hosting layers. Verify:

- who controls the `HERMES_HOME` volume;
- how updates happen;
- whether provider keys are stored by you or the host;
- whether the dashboard is protected by auth;
- whether shell execution is isolated.

## NVIDIA NemoClaw Example

NVIDIA has published an example using Hermes Agent with NemoClaw for self-evolving research workflows. Treat this as an enterprise/security-oriented reference architecture, especially for safer runtime boundaries.

