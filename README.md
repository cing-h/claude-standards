# claude-standards

My standing instructions for Claude Code, used in every coding session and every project:

- `CLAUDE.md`: how we work (plan first, one feature per session, a branch per feature, saving tokens, learned behaviors)
- `agents/`: cheap helper agents (`scout` finds code, `chore` makes small exact edits), both on Haiku

Claude Code reads `~/.claude/CLAUDE.md` and `~/.claude/agents/` at the start of every session. The install
scripts copy these files there. Projects keep their own specifics in their own `CLAUDE.md`.

## Cloud sessions (claude.ai/code)

Cloud sessions start on a fresh computer, so the environment's **setup script** installs the standards each time.
Environment menu in the session's title bar → Edit → Setup script:

```bash
git clone --depth 1 https://github.com/cing-h/claude-standards ~/claude-standards && bash ~/claude-standards/install.sh
```

## On a PC (Windows)

Once, in PowerShell:

```powershell
git clone https://github.com/cing-h/claude-standards "$HOME\claude-standards"
& "$HOME\claude-standards\install.ps1"
```

After Claude adds new rules: `git -C "$HOME\claude-standards" pull` and run `install.ps1` again.

## Changing the rules

Tell Claude in any session; it edits this repo and pushes. Or edit `CLAUDE.md` here yourself.
