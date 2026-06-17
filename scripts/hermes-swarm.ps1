param(
  [ValidateSet('list', 'doctor', 'emit-local', 'emit-railway', 'emit-vercel', 'emit-cloudflare')]
  [string] $Command = 'list',

  [string] $Spec = 'configs/starlight-hermes-swarm.example.json'
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$specPath = if ([System.IO.Path]::IsPathRooted($Spec)) { $Spec } else { Join-Path $repoRoot $Spec }

if (-not (Test-Path -LiteralPath $specPath)) {
  throw "Spec not found: $specPath"
}

$swarm = Get-Content -LiteralPath $specPath -Raw | ConvertFrom-Json
$agents = @($swarm.agents)

function Test-AgentSpec {
  param($Agent)
  foreach ($field in @('id', 'profile', 'displayName', 'purpose')) {
    if (-not $Agent.$field) {
      throw "Agent is missing required field '$field': $($Agent | ConvertTo-Json -Compress)"
    }
  }
}

foreach ($agent in $agents) {
  Test-AgentSpec $agent
}

switch ($Command) {
  'list' {
    $agents | Select-Object id, profile, displayName, @{ Name = 'deploy'; Expression = { ($_.deploy -join ',') } }
  }

  'doctor' {
    $hermes = Get-Command hermes -ErrorAction SilentlyContinue
    if (-not $hermes) {
      throw 'hermes command was not found on PATH'
    }
    "hermes: $($hermes.Source)"
    hermes version
    "spec: $specPath"
    "agents: $($agents.Count)"
  }

  'emit-local' {
    foreach ($agent in $agents) {
      if ($agent.deploy -contains 'local') {
        "# $($agent.displayName)"
        "hermes profile create $($agent.profile)"
        "$($agent.profile) setup"
        "$($agent.profile) chat"
        ''
      }
    }
  }

  'emit-railway' {
    foreach ($agent in $agents) {
      if ($agent.deploy -contains 'railway') {
        "# Railway service for $($agent.displayName)"
        "railway service create $($agent.id)"
        "railway variables --set HERMES_PROFILE=$($agent.profile)"
        "railway variables --set HERMES_AGENT_ID=$($agent.id)"
        "railway up --service $($agent.id)"
        ''
      }
    }
  }

  'emit-vercel' {
    foreach ($agent in $agents) {
      if ($agent.deploy -contains 'vercel-control-plane') {
        "# Vercel control-plane surface for $($agent.displayName)"
        "vercel env add HERMES_AGENT_ID production"
        "vercel env add HERMES_WORKER_ENDPOINT production"
        "vercel deploy --prod"
        ''
      }
    }
  }

  'emit-cloudflare' {
    foreach ($agent in $agents) {
      if (($agent.deploy -contains 'local') -or ($agent.deploy -contains 'railway')) {
        "# Optional Cloudflare Tunnel route for $($agent.displayName)"
        "cloudflared tunnel route dns <tunnel-name> $($agent.id).agents.example.com"
        ''
      }
    }
  }
}
