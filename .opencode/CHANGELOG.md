# CHANGELOG

All notable changes to this project are documented here.

## [Unreleased]

### Performance (2026-06-10)

- **Insert mode lag**: Removed `CursorHoldI` code action listener (~10ms every 100ms idle)
- **Insert mode lag**: Disabled global spell checking (runs per-keystroke O(n) overhead)
- **Boot time**: Made `llama-copilot.nvim` and `smart-splits.nvim` lazy-loaded
- **Keystroke overhead**: Removed `CursorMovedI`/`TextChangedI` from snacks.scope events
- **InsertLeave pause**: Removed `InsertLeave` from nvim-lint triggers
- **Config fix**: Removed duplicate autocommand (DiffViewFiles/checkhealth x2)
- **Config fix**: Removed duplicated/wasteful `maxmempattern` double-set (5000→1000)
- **Config fix**: Removed `regexpengine=1` (old engine slower than modern default)
- **Markdown**: Reduced blink.cmp markdown sources from 9 to 6
- **Markdown**: Made conform.nvim `format_on_save` async, removed prettier for markdown
- **Markdown**: Removed `syntax=off` from BufWinEnter handler (overly aggressive)

**Commit**: `18d64ab`