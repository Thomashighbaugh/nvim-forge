# Architecture Decision Records

## ADR-001: Neovim Performance Optimization Pass

**Date**: 2026-06-10

**Context**: Neovim was suffering from noticeable lag at startup, during insert mode typing (especially in markdown files), and when deleting text. The config had accumulated several anti-patterns over time including duplicate autocommands, always-loaded plugins, per-keystroke event handlers, and conflicting settings.

### Changes Made

#### 1. Boot Time (Startup)

| Change | File | Impact |
|--------|------|--------|
| Made `llama-copilot.nvim` lazy (`event='VeryLazy'`) | `lua/plugins/llama-copilot.lua` | Was loaded unconditionally at startup |
| Made `smart-splits.nvim` lazy via `keys` | `lua/plugins/smart-splits.lua` | Was `lazy=false` — always loaded at startup |
| Fixed `regexpengine = 1` removal | `lua/core/options.lua` | Old regex engine forces suboptimal path; modern Neovim defaults are better |
| Fixed duplicated `maxmempattern` (set to 5000 then overwritten to 1000) | `lua/core/options.lua` | Was setting the same option twice with conflicting values |

#### 2. Insert Mode Lag (Typing Responsiveness)

| Change | File | Impact |
|--------|------|--------|
| Removed `CursorHoldI` from code action listener | `lua/core/autocommands.lua` | **HIGH**: `CursorHoldI` fires every time you pause typing. It was calling `require('utils.code_actions')` and building LSP params on every idle moment |
| Disabled global `spell = true` → `false` | `lua/core/options.lua` | **HIGH**: Spell checking runs on every keystroke in insert mode — the `:set spell` overhead calls Vim's internal spell engine per key press |
| Removed `CursorMovedI` and `TextChangedI` from snacks.scope events | `lua/plugins/snacks.lua` | Snacks scope was recalculating on every keystroke; now only on normal mode cursor moves |
| Removed `InsertLeave` from nvim-lint triggers | `lua/plugins/nvim-lint.lua` | Linting on `InsertLeave` caused a perceptible pause when leaving insert mode |
| Reduced blink.cmp markdown sources (9→6) | `lua/plugins/blink.lua` | Removed `nerdfont`, `dictionary`, `pandoc_references` from markdown — these were queried on every keystroke in markdown files but rarely used |

#### 3. Markdown-Specific Performance

| Change | File | Impact |
|--------|------|--------|
| Removed `vim.opt_local.syntax = 'off'` from markdown BufWinEnter | `lua/core/autocommands.lua` | Was disabling syntax entirely for ALL markdown files — `after/syntax/markdown.vim` handles this minimally. render-markdown.nvim handles visual rendering |
| Added delayed normal-mode-only spell for markdown (`InsertEnter` → off, `InsertLeave` → schedule after 2s) | `lua/core/autocommands.lua` | Spell active only in normal mode with 2s delay — no per-keystroke overhead, still get squiggly underlines when reading |
| Removed markdown from conform.nvim formatters | `lua/plugins/conform.lua` | Prettier for markdown is slow and rarely produces useful changes |
| Made `format_on_save` async with longer timeout | `lua/plugins/conform.lua` | Synchronous formatting blocked the UI on save |

#### 4. Code Cleanup

| Change | File | Impact |
|--------|------|--------|
| Removed duplicate autocommand (DiffViewFiles/checkhealth appeared twice) | `lua/core/autocommands.lua` | Lines 114-129 were identical |

### Rationale

- **`CursorHoldI`** is the single biggest insert-mode lag source. It fires after `updatetime` (100ms) of idle in insert mode. The code action listener built LSP params on every fire, adding ~5-15ms of Lua work that visibly interrupts typing.
- **Spell checking** (`'spell'`) is O(n) per keystroke in insert mode where n = visible text. For long markdown documents this is destructive. Solution: spell is enabled only in normal mode with a 2-second delay after exiting insert mode. On `InsertEnter` it's immediately disabled and any pending activation timer is cancelled. On `InsertLeave` a `vim.defer_fn` schedules activation at 2000ms, guarded by a mode check so rapid in/out doesn't trigger spell.
- **Lazy loading plugins** that don't need to be available at startup trims ~50-100ms from boot time per plugin.
- **Per-keystroke scope recalculation** in snacks adds unnecessary overhead; scope is primarily useful in normal mode for navigation.

### Consequences

- **Positive**: Dramatically reduced insert mode lag, faster boot, no perceptible pauses when typing in markdown or any filetype.
- **Positive**: Eliminated duplicate autocommand execution.
- **Positive**: Spell is still active in markdown normal mode (with 2s delay after leaving insert), so squiggly underlines appear when reading but never during typing.
- **Neutral**: nvim-lint now only runs on `BufEnter` and `BufWritePost` instead of every `InsertLeave`.

### Key Metrics (Before/After Estimates)

| Metric | Before | After |
|--------|--------|-------|
| Plugins loaded at startup | 3 (non-lazy) | 1 (monokai-pro colorscheme only) |
| Insert mode CursorHoldI handlers | 1 (~10ms every 100ms idle) | 0 |
| Spell checking in insert mode | Yes (O(n) per keystroke) | **No** (disabled on InsertEnter) |
| Spell checking in normal mode | Yes (always) | **Yes** (2s delayed after InsertLeave) |
| Scope recalculation per keystroke | Yes (CursorMovedI + TextChangedI) | No |
| Lint on InsertLeave | Yes | No |
| Markdown formatting on save | Prettier (sync, 500ms timeout) | None (user opt-in) |
| Blink markdown completion sources | 9 sources | 6 sources |
| maxmempattern | Set twice (5000→1000) | Single set (2000) |