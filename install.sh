#!/usr/bin/env bash
# Installs these standards for Claude Code on Linux/macOS (and in Claude's cloud sessions):
# CLAUDE.md -> ~/.claude/CLAUDE.md, agents/*.md -> ~/.claude/agents/.
# An existing ~/.claude/CLAUDE.md that isn't ours is kept as CLAUDE.md.bak first.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="$HOME/.claude"
mkdir -p "$target/agents"

marker="cing-h/claude-standards"
if [[ -f "$target/CLAUDE.md" ]] && ! grep -q "$marker" "$target/CLAUDE.md"; then
    cp "$target/CLAUDE.md" "$target/CLAUDE.md.bak"
    echo "Kept your previous CLAUDE.md as $target/CLAUDE.md.bak"
fi
cp "$here/CLAUDE.md" "$target/CLAUDE.md"
cp "$here"/agents/*.md "$target/agents/"
echo "Claude standards installed to $target"
