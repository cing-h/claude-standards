# Installs these standards for Claude Code on Windows:
# CLAUDE.md -> %USERPROFILE%\.claude\CLAUDE.md, agents\*.md -> %USERPROFILE%\.claude\agents\.
# An existing CLAUDE.md that isn't ours is kept as CLAUDE.md.bak first.
# Run again after `git pull` to pick up changes.
$ErrorActionPreference = 'Stop'
$target = Join-Path $HOME '.claude'
New-Item -ItemType Directory -Force -Path (Join-Path $target 'agents') | Out-Null

$installed = Join-Path $target 'CLAUDE.md'
if ((Test-Path $installed) -and -not (Select-String -Path $installed -Pattern 'cing-h/claude-standards' -Quiet)) {
    Copy-Item $installed "$installed.bak" -Force
    Write-Host "Kept your previous CLAUDE.md as $installed.bak"
}
Copy-Item (Join-Path $PSScriptRoot 'CLAUDE.md') $installed -Force
Copy-Item (Join-Path $PSScriptRoot 'agents\*.md') (Join-Path $target 'agents') -Force
Write-Host "Claude standards installed to $target"
