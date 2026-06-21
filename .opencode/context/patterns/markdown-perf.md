# Markdown Insert-Mode Performance Optimization

## Problem
Significant per-keystroke lag in markdown files during fast typing and backspace sequences. 7 layers of overhead compounded on every keystroke with **zero debounce** anywhere.

## Root Causes (Stacked Per-Keystroke)
| Layer | What | Impact | Fix Applied |
|-------|------|--------|-------------|
| ltex-ls | Java grammar/spell checker re-analyzes entire buffer on every `textDocument/didChange` | 🔥🔥🔥 | `debounce = 600ms` — delays didChange until typing pause |
| blink.cmp ripgrep | Spawns `rg` subprocess across entire project | 🔥🔥 | `prefix_min_len = 4` |
| blink.cmp engine + 7 providers | Fetches LSP, spell, dictionary, emoji, git, pandoc refs | 🔥🔥 | multiple mitigations (see below) |
| blink.cmp backspace triggers | All 4 `show_on_backspace_*` flags fire on delete | 🔥🔥 | all `false` for markdown |
| render-markdown.nvim | `render_modes = true` re-rendered buffer in insert mode | 🔥 | `render_modes = { 'n', 'v' }` + `debounce = 200` |
| snacks.words | Re-highlights all word matches on `TextChanged` | 🔥 | Suppressed in ftplugin |
| snacks.scope | Fires on `TextChanged` + `CursorMoved` | Lower | Not directly changed (minor) |

## Changes Made

### 1. `lua/plugins/lsp/servers/ltex.lua`
Added `LspAttach` autocmd setting `client.debounce = 600` for ltex-ls only.

### 2. `lua/plugins/blink.lua`
- `completion.trigger.show_on_backspace*` — all 4 flags disabled for markdown
- `completion.trigger.show_on_blocked_trigger_characters` — per-filetype function blocking ` . / ( [ : !` in markdown
- `completion.menu.auto_show_delay_ms` — per-filetype: 600ms in markdown, 0 elsewhere
- `completion.list.selection.preselect` — per-filetype: false in markdown (no auto-preselect)
- `sources.min_keyword_length` — per-filetype: 3 in markdown, 0 elsewhere
- `providers.ripgrep.opts.prefix_min_len` — increased from 3 to 4 globally

### 3. `lua/plugins/init.lua`
- `render-markdown.render_modes` — changed from `true` (all modes) to `{ 'n', 'v' }`
- `render-markdown.debounce` — added 200ms

### 4. `ftplugin/markdown.lua` (new)
- Disables `copilot_enabled` (AI ghost text)
- Disables `minipairs` auto-pairing
- Suppresses snacks.words

## Design Decision
**Debounce over disable**: Rather than disabling features entirely (which breaks the experience once you *do* pause), we apply debounce delays so everything fires when you're actually reading/deliberating, not when you're actively typing. The completion menu appears after 600ms of inactivity — exactly when you'd look at it.

## Key Principle
The completion menu should appear **when you pause to look at it**, not on every keystroke. With `min_keyword_length = 3` and `auto_show_delay_ms = 600`, fast typing produces zero visible overhead while the engine is still free to compute results in the background.