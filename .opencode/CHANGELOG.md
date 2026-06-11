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

### Architecture Refactor (2026-06-10)

- **AI consolidation**: Removed `avante.nvim` (heaviest AI plugin, 6+ unique deps)
- **AI models**: Updated all plugins to `deepseek-v4-flash:cloud` / `deepseek-v4-pro:cloud`
- **Notifications**: Disabled `mini.notify` — primary is now `snacks.notifier` + history via `core/notifications.lua`
- **Which-key**: Merged duplicate groups, removed `<space>e`, cleaned labels (83→57 entries)
- **Lazy loading**: Moved `rainbow-delimiters`, `todo-comments`, `nvim-colorizer` to `VeryLazy`
- **Removed** `after/syntax/markdown.vim` (dead weight with render-markdown.nvim)
- **Status column**: Removed unused `MiniDiffSign` pattern from snacks config
- **LSP config**: Split 529-line file into 16 per-server files under `lua/plugins/lsp/servers/`
- **Autocommands**: Split 262-line file into 5 category files under `lua/core/autocommands.d/`
- **Keymaps**: Split 405-line file into 6 category files under `lua/core/keymaps.d/`
- **Removed avante-related keymaps** (20+ keymap definitions)

### Commits

- `18d64ab` — perf fixes batch 1
- `d96e3b4` — smart markdown spell
- `fbaf20d` — changelog update
- `ad9d599` — project-scoped opencode.jsonc
- `13fedd3` — remove 13 plugins
- `fd90c2d` — changelog update
- `3f435c2` — major config consolidation