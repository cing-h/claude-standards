# The owner's standing instructions for Claude (every project)

These are the owner's rules for how we work together, in every coding session and every project. Each project's
own `CLAUDE.md` adds what is specific to it (how to build, test, deploy); where the two disagree, the project wins.

This file lives in the `cing-h/claude-standards` repo and is installed to `~/.claude/CLAUDE.md`. When the owner
states a new lasting preference, add it in the same session: to "Learned behaviors" below if it applies to every
project (edit the repo, commit and push to `main`), or to the project's `CLAUDE.md` if it's about that project only.
The installed copy is not the source: never edit `~/.claude/CLAUDE.md` directly.

## How the owner likes to work

- **Plan first.** Present a plan and get their input before building anything big. Build in phases and check in
  after each phase.
- **Explain plainly.** Short, clear language; no unexplained jargon.
- **Code must be legible and future-proof**, especially for future AI sessions: clear names, comments that explain
  *why*, and a contributor guide (`AGENTS.md`) with a folder map and recipes, kept up to date.
- Report honestly: what was tested, what wasn't, and what can't be tested from where you are.

## Sessions: one feature per session

Long conversations are expensive: every step re-reads the whole conversation.

- **Each new feature (or phase) gets its own fresh session.** Don't start a second feature in a session that has
  already built one.
- **You are authorized to create new sessions yourself** (`create_session`) for work on a current project, unless
  the owner has told you to stop for the day. Use it to hand off the next feature once the current one is pushed
  and the next one is agreed (or already on the agreed plan). Never use it to start work the owner hasn't agreed to.
- Before handing off: update the project's roadmap (done / untested / next) and push. The new session's prompt must
  stand on its own: the goal, which items, relevant files, decisions already made, and "read CLAUDE.md first".
  Create it with the project's repo as `source_url`. Then tell the owner the new session exists and what it will do.

## Choosing the model

Pick the cheapest model that can do the job well, per session and per helper:
- **Sonnet** (`claude-sonnet-5-5`): the default for routine features: a new setting or page, wiring existing pieces
  together, tests, docs, fixes with a known cause.
- **Opus** (`claude-opus-5-5`): hard design or uncertain territory: new architecture, undocumented system behavior,
  tricky debugging, anything that needs a prototype first.
- **Haiku** (`claude-haiku-5-5`): the `scout`/`chore` helpers.
When creating a session, pass `model` and tell the owner which model and why. If a Sonnet session fails twice at the
same problem, stop and hand that problem to an Opus session instead of trying a third time.

## Plans

- When the owner approves a plan for a feature, save it as `docs/plans/<short-name>.md` (goal, decisions, steps,
  test steps, open questions) and push it to `main`. The session that builds it reads that file instead of
  re-planning. Tick off steps in the file as they're done, so a new session can pick up mid-feature.
- **Prototype risky ideas first.** If a feature depends on something that might not work (undocumented APIs, OS
  limits, effects nobody has tried), first prove the core trick in a tiny throwaway program (< ~100 lines, in the
  scratchpad or a `spikes/` folder that isn't merged). Only build the real feature once it works, and record what
  failed in the project's "tried and doesn't work" list.

## Branches

- **Every feature gets its own branch** from the latest `main`: `feature/<short-name>`; fixes to something already
  merged: `fix/<short-name>`. Push the branch, never a feature straight to `main`.
- Tell the owner exactly how to try it (e.g. `git fetch`, `git switch feature/<short-name>`, then the project's
  run command) and how to get back to the stable version (`git switch main`).
- Merge into `main` only after the owner says it works: open a pull request with a plain summary and what was
  tested, merge it when they OK it, then delete the branch.
- Exception: changes only to instructions and notes (`CLAUDE.md`, `AGENTS.md`, `docs/`) go straight to `main`.

## Saving tokens

- **Read less.** Use the project's code map / search tools first, then open only the files and lines you need.
  Never read a whole build log: use the project's quiet build script, or filter the output to errors and warnings.
- **New projects:** early on, add a small code-map script (files, types, members with line numbers) and a quiet
  build script that prints only distinct errors/warnings. See `tools/` in `cing-h/winmorph` for examples.
- **Delegate trivial work to cheaper models by default.** Two helpers are installed for every project (Haiku):
  - `scout`: read-only "where is X / what touches Y" searches; answers with `path:line`, not file dumps.
  - `chore`: small, fully-specified mechanical edits that you already designed.
  Keep planning, design, debugging, risky or system-level changes, and reviewing helpers' work for yourself.
  A helper's mistake costs more to fix than it saved; when in doubt, do it yourself.

## Working habits that save tokens

- Run independent steps in parallel (several reads/searches in one go).
- Don't re-read a file right after editing it; the edit tool already confirms success.
- Keep tool output small: limit search results, read files by line range, filter logs.
- Prefer one larger edit over many tiny ones to the same place.
- Let automated checks (build, tests, CI) find problems before asking the owner to test by hand. When the owner
  must test, give a short numbered checklist and ask for specific results (what happened, exact error text).
- Keep always-loaded files (`CLAUDE.md`, `AGENTS.md`) short; put reference material (recipes, long lists) in
  `docs/` and open it only when needed.

## Learned behaviors

Add new ones at the bottom, dated.

- 2026-10-31: One feature per session; Claude may create new sessions itself for the current project unless told
  to stop for the day.
- 2026-10-31: Use code maps, quiet builds and cheap helper agents by default to save tokens.
- 2026-10-31: A separate branch for every feature; merge to `main` only after the owner confirms it works.
- 2026-10-31: General rules live in `cing-h/claude-standards`; each project's `CLAUDE.md` holds only its specifics.
- 2026-10-31: Choose the model per session (Sonnet default, Opus for hard design, Haiku helpers); approved plans go
  to `docs/plans/`; prototype risky ideas first; follow the token-saving working habits.
- 2026-10-31: On the owner's PC, coding projects live in `OneDrive\Desktop\Coding Project\Claude Coding Scripts`
  (one folder per repo). Clone new projects there and give local paths relative to it.
