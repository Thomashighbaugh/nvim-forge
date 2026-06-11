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
- **Markdown**: Smart spell — only in normal mode, 2s delayed after InsertLeave, disabled immediately on InsertEnter

### Plugin Cleanup (2026-06-10)

- **Removed 13 plugins** replaced by built-in or consolidated equivalents:
  - `nvim-lsp-endhints` → `vim.lsp.inlay_hint` (Neovim 0.10+ built-in)
  - `sQVe/sort.nvim` → built-in `:sort` (aliased as `:Sort` with flag completion)
  - `inc-rename.nvim` → `vim.lsp.buf.rename()`
  - `3rd/image.nvim` → `snacks.image` (already configured)
  - `nvim-autopairs` → `mini.pairs` (already loaded, eliminated duplicate)
  - `nvim-surround` → `mini.surround` (already loaded, eliminated duplicate)
  - `mini-indentscope` → `snacks.indent` (already enabled)
  - `noice.nvim` → `snacks.notifier` + `mini.notify` (consolidation)
  - `nvim-lint` → manual `vim.system()` autocmd calls (eslint/jsonlint/yamllint)
  - `lualine.nvim`, `LuaSnip`, `codeium.nvim`, `statuscol.nvim`, `snipe.nvim` (dead placeholders, all already disabled)
- **Updated which-key labels** for removed plugins
- **Added `:Sort` user command** with flag completion (`i`, `u`, `n`, `iu`, `in`, `un`, `iun`)
- **Replaced noice keymaps** with snacks.notifier equivalents

### Commits

- `18d64ab` — perf fixes batch 1
- `d96e3b4` — smart markdown spell
- `fbaf20d` — changelog update
- `ad9d599` — project-scoped opencode.jsonc
- `13fedd3` — remove 13 plugins