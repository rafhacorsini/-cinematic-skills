# publish.ps1 - sobe a versao do plugin, commita e da push num comando so.
# Uso:
#   .\publish.ps1 "mensagem do commit"
# Ex.:
#   .\publish.ps1 "melhora pareamento de fontes"

param(
  [string]$Message = "update skill"
)

$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

$pluginPath = "plugins/direction/.claude-plugin/plugin.json"
$marketPath = ".claude-plugin/marketplace.json"

# --- 1. Le e sobe a versao (patch: 0.1.0 -> 0.1.1) ---
$plugin = Get-Content $pluginPath -Raw | ConvertFrom-Json
$parts  = $plugin.version.Split(".")
$parts[2] = [int]$parts[2] + 1
$newVersion = $parts -join "."
$plugin.version = $newVersion
($plugin | ConvertTo-Json -Depth 10) | Set-Content $pluginPath -Encoding UTF8

# --- 2. Reflete a versao no marketplace.json ---
$market = Get-Content $marketPath -Raw | ConvertFrom-Json
if ($market.metadata) { $market.metadata.version = $newVersion }
($market | ConvertTo-Json -Depth 10) | Set-Content $marketPath -Encoding UTF8

Write-Host "Versao atualizada para $newVersion" -ForegroundColor Green

# --- 3. Git add/commit/push ---
git add .
git commit -m "v${newVersion}: $Message"
git push

Write-Host ""
Write-Host "Publicado! v$newVersion no ar." -ForegroundColor Cyan
Write-Host "Clientes atualizam com: /plugin marketplace update cinematic-skills" -ForegroundColor Yellow
