# Arcanea Image Gen Skill

**Purpose:** Enable Hermes Agents to generate high-quality images, video, lipsync, and cinema content using Arcanea Studio's multi-model router (200+ models, provider-agnostic).

**When to use:**
- User requests image generation, visual assets for worlds, characters, lore.
- Creative tasks in Arcanea or Starlight universes.
- Integrate with hermes-cockpit for swarm media ops.
- Content for awesome skills, agentic-creator-os, etc.

**Integration notes:**
- Arcanea Studio: https://github.com/frankxai/arcanea-studio
- Router: src/lib/router/ supports muapi, gemini (NanoBanana), etc.
- Usage: Set localStorage keys or call via MCP/HTTP if exposed.
- Example prompt: Use "Luminor Artisan" hierarchy for creative briefs.
- For Hermes: Expose as tool in profile, or call from agent via shell/webhook.
- Pair with hermes-cockpit dashboard for monitoring gen jobs.

**Example invocation (in Hermes chat or script):**
```
Use arcanea-studio to generate image of [description] using Flux or Ideogram.
```

**Related:**
- See ARCANEA-FORK.md in arcanea-studio
- hermes-cockpit for registry
- awesome-hermes-agents for swarm patterns
- Improves Hermes integration with image/content capabilities.

**Status:** Draft skill for Starlight/Hermes creative agents. Expand with actual MCP tool wrapper.

---
Part of frankxai awesome-hermes-agents improvements for Hermes + Arcanea.
