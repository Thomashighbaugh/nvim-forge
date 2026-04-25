# Neovim Plugin Configuration Reference

This document provides a comprehensive overview of all plugins configured in this Neovim setup.

## Plugin Overview

**Total Plugins**: 58 active plugins
**Categories**: LSP, UI, Text Editing, Git, AI, Debug, Utilities  
**Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim)  
**Recent Update**: Major migration to Mini.nvim ecosystem; Copilot replaced with Ollama (glm-5:cloud)

---

## Complete Plugin Catalog

| Plugin Name             | Repository                                  | Category          | Functionality                                                      | Key Bindings                                               |
| ----------------------- | ------------------------------------------- | ----------------- | ------------------------------------------------------------------ | ---------------------------------------------------------- |
| **Advanced Git Search** | aaronhallaert/advanced-git-search.nvim      | Git               | Advanced git search capabilities                                   | `:AdvancedGitSearch`                                       |
| **Alt Substitute**      | chrisgrieser/nvim-alt-substitute            | Text Editing      | Better substitute command with preview                             | Auto-triggered on `:s/`                                    |
| **Avante**              | yetone/avante.nvim                          | AI                | AI-powered coding assistant sidebar (auto-suggestions disabled)     | `<leader>Oaa`, `<leader>Oae`, `<leader>Oat`                |
| **Command Completion**  | smolck/command-completion.nvim              | UI                | Wildmenu-style command completion with fuzzy matching (cmdwin disabled) | `<Tab>` (complete), auto-triggered                         |
| **Bufferline**          | akinsho/bufferline.nvim                     | UI                | Enhanced buffer/tab line with diagnostics                          | Visual only                                                |
| **CodeCompanion**       | olimorris/codecompanion.nvim                | AI                | Main chat interface with Ollama glm-5:cloud model                  | `<leader>Oc` (chat), `<leader>Oa` (actions), `<leader>Od` (cmd), `<leader>O<space>` (inline) |
| **CodeSnap**            | mistricky/codesnap.nvim                     | Screenshots       | Generate beautiful code screenshots                                | `<leader>cc`, `<leader>cs` (visual mode)                   |
| **Color Picker**        | wsdjeg/cpicker.nvim                         | Colors            | Color picker and shade generator                                   | `<leader>Cp`, `<leader>Cs`, `<leader>Ch`                   |
| **Colorizer**           | norcalli/nvim-colorizer.lua                 | Colors            | Highlight color codes in files                                     | Auto-triggered                                             |
| **Comment Box**         | LudoPinelli/comment-box.nvim                | Comments          | Create decorative comment boxes                                    | `<leader>cb`, `<leader>cd`, `<leader>ca`                   |
| **Comment Frame**       | s1n7ax/nvim-comment-frame                   | Comments          | Create comment frames around text                                  | `<leader>cf`, `<leader>cm`                                 |
| **Conform**             | stevearc/conform.nvim                       | Formatting        | Code formatter with format-on-save                                 | Auto format on save                                        |
| **DAP**                 | mfussenegger/nvim-dap                       | Debug             | Debug Adapter Protocol support                                     | `<leader>Db` (breakpoint)                                  |
| **DAP UI**              | rcarriga/nvim-dap-ui                        | Debug             | Debug UI with variables and watches                                | `<leader>Du`                                               |
| **DAP Virtual Text**    | theHamsta/nvim-dap-virtual-text             | Debug             | Show variable values as virtual text                               | Auto-triggered                                             |
| **Diffview**            | sindrets/diffview.nvim                      | Git               | Git diff viewer with file history                                  | `<leader>do`, `<leader>dc`, `<leader>dh`                   |
| **Dressing**            | stevearc/dressing.nvim                      | UI                | Better UI for vim.ui.select and vim.ui.input                       | Auto-triggered                                             |
| **Flash**               | folke/flash.nvim                            | Navigation        | Fast cursor movement and search                                    | `s` (jump), `<leader>s` (treesitter), `<space>v` (search)  |
| **Friendly Snippets**   | rafamadriz/friendly-snippets                | Snippets          | Collection of snippets for various languages                       | Loaded by mini.snippets via from_lang()                    |
| **Gitsigns**            | lewis6991/gitsigns.nvim                     | Git               | Git signs, hunks, and blame integration                            | `<leader>g*` (git operations)                              |
| **Glance**              | dnlhc/glance.nvim                           | LSP               | Preview LSP locations in floating window                           | `<space>gr`, `<space>gd`, `<space>gy`, `<space>gm`         |
| **Image Preview**       | 3rd/image.nvim                              | Media             | Preview images in terminal                                         | `<leader>pi`, `<leader>pp`                                 |
| **Img Clip**            | HakonHarnes/img-clip.nvim                   | Media             | Clipboard image support                                            | Auto-triggered                                             |
| **Inc Rename**          | smjonas/inc-rename.nvim                     | LSP               | Incremental LSP rename with preview                                | `<space>ir`                                                |
| **Java LSP (JDTLS)**    | mfussenegger/nvim-jdtls                     | LSP               | Java language server integration                                   | Auto-triggered for Java                                    |
| **Kitty Terminal**      | fladson/vim-kitty                           | Terminal          | Kitty terminal integration                                         | Auto-triggered                                             |
| **LazyDev**             | folke/lazydev.nvim                          | LSP               | Better Lua development for Neovim                                  | Auto-triggered                                             |
| **LSP Config**          | neovim/nvim-lspconfig                       | LSP               | Language server protocol configuration                             | `gr*` (LSP functions), `K` (hover), `<M-CR>` (code action) |
| **LSP Endhints**        | chrisgrieser/nvim-lsp-endhints              | LSP               | Show LSP inlay hints at end of line                                | Auto-triggered                                             |
| **Blink CMP**            | saghen/blink.cmp                            | Completion        | Fast completion with LSP, snippets, and many sources                 | `<C-Space>`, `<C-n>`, `<C-p>`, `<C-e>`, `<C-y>`    |
| **Blink CMP Spell**      | ribru17/blink-cmp-spell                     | Completion        | Spellcheck completion source for blink.cmp                           | Auto-triggered on spell context                         |
| **Blink Ripgrep**        | mikavilpas/blink-ripgrep.nvim               | Completion        | Ripgrep/gitgrep project-wide word completion for blink.cmp           | Auto-triggered                                           |
| **Blink Emoji**          | moyiz/blink-emoji.nvim                      | Completion        | Emoji completion source for blink.cmp                               | `:` in markdown/gitcommit                              |
| **Blink CMP Words**      | archie-judd/blink-cmp-words                  | Completion        | Dictionary and thesaurus completion via WordNet for blink.cmp         | Auto-triggered                                           |
| **Blink CMP Dictionary** | Kaiser-Yang/blink-cmp-dictionary             | Completion        | Dictionary file completion source for blink.cmp                      | Auto-triggered                                           |
| **Blink CMP Kitty**      | garyhurtz/blink_cmp_kitty                    | Completion        | Kitty terminal window content as blink.cmp source                    | Auto-triggered                                           |
| **Blink CMP Yanky**      | marcoSven/blink-cmp-yanky                    | Completion        | Yank history completion source for blink.cmp                         | Auto-triggered                                           |
| **Blink CMP Env**        | bydlw98/blink-cmp-env                        | Completion        | Environment variable completion source for blink.cmp                 | `$` trigger                                              |
| **Blink CMP Git**        | Kaiser-Yang/blink-cmp-git                    | Completion        | Git issues, PRs, commits, and mentions for blink.cmp               | `#`, `:`, `@` in gitcommit/markdown                    |
| **Mini Snippets**       | echasnovski/mini.snippets                   | Snippets          | Snippet management and expansion with mini.completion integration  | Auto-triggered via mini.completion                         |
| **Markdown Table Mode** | Kicamon/markdown-table-mode.nvim            | Markdown          | Table mode for markdown editing                                    | Auto-triggered in markdown                                 |
| **Mason**               | mason-org/mason.nvim                        | LSP               | LSP server installer and manager                                   | `<leader>lm`                                               |
| **Mason LSP Config**    | mason-org/mason-lspconfig.nvim              | LSP               | Bridge between mason and lspconfig                                 | Auto configuration                                         |
| **Mini Align**          | echasnovski/mini.align                      | Text Editing      | Align text by patterns                                             | `<leader>ma`, `<leader>mA`                                 |
| **Mini AI**             | echasnovski/mini.ai                         | Text Objects      | Enhanced text objects (around/inside)                              | `va)`, `yinq`, `ci'`, etc.                                 |
| **Mini Animate**        | echasnovski/mini.animate                    | UI                | Smooth animations for cursor and scroll movement                   | Auto-triggered                                             |
| **Mini Bracketed**      | echasnovski/mini.bracketed                  | Navigation        | Navigate with bracket motions ([/] for various objects)            | `[b`, `]b`, `[d`, `]d`, etc.                               |
| **Mini Bufremove**      | echasnovski/mini.bufremove                  | Buffer Management | Smart buffer deletion that preserves layout                        | `<leader>bd`, `<leader>bD`                                 |
| **Mini Comment**        | echasnovski/mini.comment                    | Comments          | Toggle comments with treesitter context _(REPLACES Comment.nvim)_  | `gc`, `gcc`, `gc` (visual)                                 |
| **Mini Completion**     | echasnovski/mini.completion                 | Completion        | Simple completion with LSP and cmdline _(REPLACES nvim-cmp)_       | `<C-Space>`, `<A-Space>`                                   |
| **Mini Icons**          | echasnovski/mini.icons                      | Icons             | Icon provider                                                      | Auto-triggered                                             |
| **Mini Indentscope**    | echasnovski/mini.indentscope                | UI                | Animated indent scope indicator                                    | Auto-triggered                                             |
| **Mini Notify**         | echasnovski/mini.notify                     | UI                | Notification system with LSP progress _(REPLACES nvim-notify)_     | Auto-triggered, `vim.notify()` calls                       |
| **Mini Pairs**          | echasnovski/mini.pairs                      | Text Editing      | Auto-close brackets and quotes                                     | Auto-triggered                                             |
| **Mini Pick**           | echasnovski/mini.pick                       | Fuzzy Finder      | Fuzzy picker for files, buffers, grep _(REPLACES Telescope)_       | `<leader>ff`, `<leader>fg`, `<leader>fb`, `<C-p>`, `-`     |
| **Mini Statusline**     | echasnovski/mini.statusline                 | UI                | Clean statusline with icons _(REPLACES Lualine.nvim)_              | None (automatic)                                           |
| **Mini Surround**       | echasnovski/mini.surround                   | Text Editing      | Add/delete/replace surroundings (sa, sd, sr)                       | `saiw)`, `sd'`, `sr)'`                                     |
| **Mini Visits**         | echasnovski/mini.visits                     | Navigation        | Track and navigate frequently/recently visited files               | `<leader>vv`, `<leader>vf`, `<leader>vr`, `<leader>vc`     |
| **Monokai Pro**         | loctvl842/monokai-pro.nvim                  | Color Scheme      | Professional color theme with transparent background support       | None                                                       |
| **Neogit**              | NeogitOrg/neogit                            | Git               | Git interface with staging and commit UI                           | `<leader>gg`                                               |
| **Nerdy**               | 2kabhishek/nerdy.nvim                       | Icons             | Browse and insert nerd font icons                                  | `<leader>in`, `<leader>iN`                                 |
| **Noice**               | folke/noice.nvim                            | UI                | Enhanced messages, cmdline and popups                              | `<space>nd`, `<space>nh`, `<space>nl`                      |
| **NUI**                 | MunifTanjim/nui.nvim                        | UI                | UI component library                                               | Dependency                                                 |
| **Nvim Autopairs**      | windwp/nvim-autopairs                       | Text Editing      | Auto-close brackets, quotes with smart rules                       | Auto-triggered                                             |
| **Nvim Lint**           | mfussenegger/nvim-lint                      | Linting           | Linting engine for multiple file types                             | Auto-triggered                                             |
| **Nvim Navic**          | SmiteshP/nvim-navic                         | LSP               | Breadcrumbs in winbar                                              | Auto-triggered in winbar                                   |
| **Nvim Surround**       | kylechui/nvim-surround                      | Text Editing      | Add/delete/change surroundings                                     | `sa`, `sd`, `sr` + motion                                  |
| **Nvim Toggler**        | nguyenvukhang/nvim-toggler                  | Utilities         | Toggle boolean values and words                                    | `<leader>w`                                                |
| **Nvim Treesitter**     | nvim-treesitter/nvim-treesitter             | Syntax            | Advanced syntax highlighting and AST parsing                       | `af`, `if`, `ac`, `ic` (textobjects)                       |
| **Nvim Web Devicons**   | nvim-tree/nvim-web-devicons                 | Icons             | File type icons                                                    | Auto-triggered                                             |
| **Ollama**              | nomnivore/ollama.nvim                       | AI                | Local LLM integration with Ollama                                  | `<leader>Oo`, `<leader>Om`, `<leader>Os`, `<leader>OM`     |
| **Outline**             | hedyhli/outline.nvim                        | LSP               | Code outline sidebar                                               | `<space>o`                                                 |
| **Plenary**             | nvim-lua/plenary.nvim                       | Utilities         | Lua utilities library                                              | Dependency                                                 |
| **Project Notes**       | ravnheim/project_notes                      | Note Taking       | Project-specific note management                                   | `<leader>nm`, `<leader>nt`, `<leader>nl`                   |
| **Rainbow Delimiters**  | HiPhish/rainbow-delimiters.nvim             | Syntax            | Colorize matching brackets/delimiters                              | Auto-triggered                                             |
| **Redraft**             | jim-at-jibba/nvim-redraft                   | AI                | LLM-powered code editing and generation                            | Commands available                                         |
| **Render Markdown**     | MeanderingProgrammer/render-markdown.nvim   | Markdown          | Live markdown preview and rendering                                | Auto-triggered                                             |
| **Smart Splits**        | mrjones2014/smart-splits.nvim               | Window Management | Smart window resizing and navigation                               | `<A-hjkl>` (resize), `<C-arrows>` (move)                   |
| **Snacks.nvim**         | folke/snacks.nvim                           | Multi-utility     | Multi-feature utility plugin with 8 submodules                     | Multiple keybindings                                       |
| **Sort**                | sQVe/sort.nvim                              | Text Editing      | Sort lines and visual selections                                   | `<leader>so`, `<leader>si`, `<leader>su`, `<leader>sn`     |
| **Snacks Statuscol**   | folke/snacks.nvim (statuscolumn)        | UI                | Configurable status column with git/fold/sign support _(REPLACES statuscol.nvim)_ | Auto-triggered, `<leader>Sc` toggle |
| **Symbols**             | oskarrrrrrr/symbols.nvim                    | LSP               | Symbol outline for current file                                    | `<leader>lS`                                               |
| **Todo Comments**       | folke/todo-comments.nvim                    | Comments          | Highlight and search TODO comments                                 | `<leader>tq`, `<leader>ts`                                 |
| **Todo Marker**         | maheshbansod/todo-marker.nvim               | Comments          | Toggle todo markers in comments                                    | `<leader>mt` (also `<leader>tm`)                          |
| **Trouble**             | folke/trouble.nvim                          | Diagnostics       | Diagnostics, references, and quickfix list UI                      | `<space>xx`, `<space>xs`, `<space>xl`                      |
| **TS Autotag**          | windwp/nvim-ts-autotag                      | HTML/XML          | Auto close and rename HTML tags                                    | Auto-triggered                                             |
| **TS Context**          | nvim-treesitter/nvim-treesitter-context     | Treesitter        | Show function/class context at top                                 | Auto-triggered                                             |
| **TS Node Action**      | ckolkey/ts-node-action                      | Treesitter        | Trigger actions on treesitter nodes                                | `+`                                                        |
| **TS Textobjects**      | nvim-treesitter/nvim-treesitter-textobjects | Treesitter        | Text objects based on syntax tree                                  | `af`, `if`, `ac`, `ic` and more                            |
| **TS Treehopper**       | mfussenegger/nvim-treehopper                | Treesitter        | Jump to treesitter nodes                                           | Commands available                                         |
| **Which Key**           | folke/which-key.nvim                        | UI                | Keymap hints and documentation                                     | Auto-triggered                                             |
| **Yanky**               | gbprod/yanky.nvim                           | Clipboard         | Enhanced yank/paste with history                                   | `<leader>y`, `p`, `P`, `gp`, `gP`                          |

## Replaced/Disabled Plugins

The following plugins have been replaced by Mini.nvim equivalents, Ollama, or other solutions and are no longer active:

| Replaced Plugin  | Repository                | Replaced By                     | Reason                                             |
| ---------------- | ------------------------- | ------------------------------- | -------------------------------------------------- |
| **Comment.nvim** | numToStr/Comment.nvim     | **mini.comment**                | Simpler configuration, same functionality          |
| **mini.completion** | echasnovski/mini.completion | **blink.cmp** | Replaced by blink.cmp for richer completion sources |
| **Lualine.nvim** | nvim-lualine/lualine.nvim | **mini.statusline**             | Lighter weight, better performance                 |
| **Snipe.nvim**   | leath-dub/snipe.nvim      | **mini.pick.builtin.buffers()** | Unified picker interface (mapped to `-` key)       |
| **Mini.files**   | echasnovski/mini.files    | **snacks.explorer**             | Disabled to preserve snacks.explorer functionality |
| **Codeium**     | Exafunction/codeium.nvim | **blink.cmp**                    | blink.cmp provides LSP + snippet completion natively    |
| **copilot.lua**  | zbirenbaum/copilot.lua   | **Codeium** + **Ollama**        | Codeium for inline completions; Ollama reserved for chat/keybound actions  |
| **Statuscol**      | luukvbaal/statuscol.nvim  | **snacks.statuscolumn**         | Redundant; snacks already provides equivalent functionality        |

## Plugin Categories

### 🏠 Mini.nvim Ecosystem (14 modules)

- **Core Modules**: mini.ai, mini.surround, mini.pairs, mini.icons
- **New Additions**: mini.visits, mini.completion, mini.pick, mini.comment, mini.statusline, mini.bufremove, mini.notify, mini.bracketed, mini.animate, mini.align, mini.indentscope
- **Disabled**: mini.files (conflicts with snacks.explorer)
- **Benefits**: Consistent API, better performance, unified configuration

### 🍿 Snacks.nvim Ecosystem (8 submodules)

- **Core Modules**: snacks.dashboard, snacks.terminal, snacks.quickfile, snacks.scope
- **File Operations**: snacks.explorer, snacks.picker
- **Notifications**: snacks.notifier
- **Performance**: snacks.bigfile, snacks.words
- **Benefits**: Lightweight, fast, integrated with folke ecosystem

### 🔧 LSP & Language Support (12 plugins)

- **Core**: nvim-lspconfig, mason.nvim, mason-lspconfig.nvim, lazydev.nvim
- **Java**: nvim-jdtls
- **Navigation**: glance.nvim, outline.nvim, nvim-navic, symbols.nvim
- **Enhancement**: inc-rename.nvim, nvim-lsp-endhints, trouble.nvim

### 🎨 UI & Visual Enhancement (10 plugins)

- **Theme**: monokai-pro.nvim
- **Status**: mini.statusline (replaces lualine), bufferline.nvim, statuscol.nvim
- **Notifications**: noice.nvim, mini.notify
- **Visual**: rainbow-delimiters.nvim, mini.indentscope, nvim-colorizer.lua
- **Multi-purpose**: snacks.nvim (8 submodules: dashboard, explorer, picker, terminal, notifier, bigfile, quickfile, scope), dressing.nvim

### ✏️ Text Editing & Manipulation (15 plugins)

- **Completion**: blink.cmp (replaces mini.completion and Codeium)
- **Snippets**: Mini Snippets, friendly-snippets (loaded by blink.cmp)
- **Editing**: nvim-surround, mini.surround, nvim-autopairs, flash.nvim
- **Formatting**: conform.nvim, nvim-lint
- **Comments**: mini.comment (replaces Comment.nvim), todo-comments.nvim, comment-box.nvim, nvim-comment-frame, todo-marker.nvim
- **Text Operations**: sort.nvim, nvim-toggler, chrisgrieser/nvim-alt-substitute

### 🔍 Navigation & File Management (5 plugins)

- **File Exploration**: snacks.explorer (mini.files disabled)
- **Fuzzy Finding**: mini.pick (replaces telescope), snacks.picker
- **Recent Files**: mini.visits
- **Buffer Management**: mini.bufremove, mini.pick.builtin.buffers() (replaces snipe)
- **Window Management**: smart-splits.nvim

### 📝 Git Integration (4 plugins)

- **Core**: gitsigns.nvim, neogit
- **Advanced**: diffview.nvim, advanced-git-search.nvim

### 🤖 AI & LLM Integration (6 plugins)

All AI/LLM keybindings are consolidated under the `<leader>O` prefix:
- **Inline completions**: Codeium (free, no Ollama load)
- **`<leader>Oo`**: Ollama prompt commands
- **`<leader>Oc`**: CodeCompanion subgroup (codecompanion.nvim)
- **`<leader>Oa`**: Avante subgroup (avante.nvim)

| Plugin               | Model         | Purpose                          | Key Bindings                                                      |
| -------------------- | ------------- | -------------------------------- | ------------------------------------------------------------------ |
| **codeium.nvim**     | Codeium Cloud | Free AI inline code completions  | Auto-triggered on insert                                          |
| **ollama.nvim**      | Various       | Prompt-based LLM interactions    | `<leader>Oo` (prompt), `<leader>Om` (model), `<leader>Os` (sample), `<leader>OM` |
| **CodeCompanion**    | glm-5:cloud   | Main chat interface (Ollama)     | `<leader>Oc` (chat), `<leader>Oa` (actions), `<leader>Od` (cmd), `<leader>O<space>` (inline) |
| **Avante**           | glm-5.1:cloud | AI coding assistant sidebar     | `<leader>Oaa`, `<leader>Oae`, `<leader>Oat`       |
| **Redraft**          | OpenRouter    | LLM-powered editing              | Commands available                                 |

### 🐛 Debug Support (3 plugins)

- **Core**: nvim-dap
- **UI**: nvim-dap-ui, nvim-dap-virtual-text

### 🎯 Syntax & Treesitter (6 plugins)

- **Core**: nvim-treesitter
- **Extensions**: nvim-treesitter-textobjects, nvim-treesitter-context, nvim-treehopper
- **Enhancements**: ts-node-action, nvim-ts-autotag

### 🖼️ Media & Visualization (4 plugins)

- **Screenshots**: codesnap.nvim
- **Image Support**: 3rd/image.nvim, HakonHarnes/img-clip.nvim
- **Colors**: wsdjeg/cpicker.nvim

### 📝 Documentation & Writing (4 plugins)

- **Markdown**: render-markdown.nvim, markdown-table-mode.nvim
- **Project Notes**: ravnheim/project_notes
- **Help**: which-key.nvim

### 🔧 Utilities & Dependencies (9 plugins)

- **Foundation**: plenary.nvim, nui.nvim
- **Icons**: mini.icons, nvim-web-devicons, nerdy.nvim
- **Terminal**: vim-kitty
- **Development**: lazydev.nvim (with wezterm-types, luvit-meta)
- **Clipboard**: yanky.nvim

## Key Features

### 🚀 Performance Optimizations

- **Lazy Loading**: Most plugins load only when needed
- **Large Files**: snacks.bigfile for performance optimization
- **Smart Startup**: Delayed initialization for better startup time
- **Mini.nvim**: Lighter alternative to heavy plugins

### 🎯 Modern Development Workflow

- **LSP Integration**: Full language server support with 15+ language servers
- **AI Assistance**: Ollama-powered AI with glm-5:cloud model (Copilot removed)
- **Git Workflow**: Complete git integration from staging to searching
- **Debug Support**: Full DAP implementation with UI

### 🎨 Enhanced User Experience

- **Rich UI**: Modern interface with notifications and popups
- **Smart Navigation**: Fast movement with flash.nvim and mini.pick
- **Visual Feedback**: Comprehensive syntax highlighting and colors
- **Unified Interface**: Consistent picker experience via mini.pick

## Recent Major Updates (2026-04-17)

### AI Migration: Copilot → Ollama

- **Removed Copilot**: copilot.lua and CopilotChat.nvim have been removed
- **CodeCompanion as Main Chat**: CodeCompanion is now the primary chat interface with Ollama glm-5:cloud model
- **Updated CodeCompanion**: Now uses Ollama with glm-5:cloud model
- **Keybinding Consolidation**: All AI/LLM keybindings now under `<leader>O` prefix
  - CodeCompanion: updated keybindings (`<leader>Oc`, `<leader>Oa`, `<leader>Od`, `<leader>O<space>`)
  - CodeCompanion: moved from `<leader>i` to `<leader>Oc`
  - Avante: already using `<leader>Oa`
- **Benefits**: Local control, no API costs, privacy, custom model selection

### Mini.nvim Migration

- **Migrated to Mini.nvim**: Replaced multiple heavy plugins with lightweight mini.nvim modules
- **Eliminated Issues**: Fixed cmp_cmdline errors by switching to mini.completion
- **Unified Experience**: Single picker interface (mini.pick) for all selection tasks
- **Performance**: Significant startup time improvements

### Key Replacements

1. **nvim-cmp → mini.completion → blink.cmp**: Full completion with LSP, snippets, and custom sources
2. **Comment.nvim → mini.comment**: Simpler configuration, treesitter context aware
3. **lualine.nvim → mini.statusline**: Lighter weight, better performance
4. **snipe.nvim → mini.pick.builtin.buffers()**: Unified picker interface (still mapped to `-`)
5. **mini.files disabled**: Preserved snacks.explorer functionality per user preference
6. **Copilot → Ollama**: Replaced GitHub Copilot with local Ollama (glm-5:cloud)

### New Features

- **File Visits**: Track frequently and recently visited files (mini.visits)
- **Enhanced Completion**: Better cmdline completion without errors
- **Smooth Animations**: Cursor and scroll animations for better UX
- **Smart Navigation**: Bracket motions for quick navigation
- **Local AI**: Full Ollama integration with glm-5:cloud model

## Configuration Structure

```
lua/plugins/
├── init.lua                 # Main snacks configuration and core plugins
├── mini-suite.lua           # All mini.nvim modules (NEW)
├── cmp.lua                  # Replaced by mini.completion (placeholder)
├── comments.lua             # Comment plugins (mini.comment + extras)
├── lualine.lua              # Replaced by mini.statusline (placeholder)
├── snipe.lua                # Replaced by mini.pick (placeholder)
├── aisync.lua               # Ollama chat + CodeCompanion (Ollama)
├── lsp/                     # LSP-specific configurations
├── ai/                      # AI and LLM plugins (ollama.nvim, avante.nvim)
└── [various].lua            # Individual plugin configs
```

## AI Configuration Details

### Ollama Integration

All AI plugins are configured to use Ollama. All AI/LLM keybindings are consolidated under the `<leader>O` prefix for consistency:

| Plugin               | Model         | Purpose                          | Key Bindings                                                      |
| -------------------- | ------------- | -------------------------------- | ------------------------------------------------------------------ |
| **codeium.nvim**     | Codeium Cloud | Free AI inline code completions  | Auto-triggered on insert                                          |
| **ollama.nvim**      | Various       | Prompt-based LLM interactions    | `<leader>Oo` (prompt), `<leader>Om` (model), `<leader>Os` (sample), `<leader>OM` |
| **CodeCompanion**    | glm-5:cloud   | Main chat interface (Ollama)     | `<leader>Oc` (chat), `<leader>Oa` (actions), `<leader>Od` (cmd), `<leader>O<space>` (inline) |
| **Avante**           | glm-5.1:cloud | AI coding assistant sidebar     | `<leader>Oaa`, `<leader>Oae`, `<leader>Oat`       |
| **Redraft**          | OpenRouter    | LLM-powered editing              | Commands available                                |

## Installation

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. All plugins are automatically installed on first startup.

## Maintenance

- **Health Check**: Run `:checkhealth` to verify plugin status
- **Updates**: Use `:Lazy update` to update all plugins
- **Update + Clean**: `:Lazy sync`
- **Profile**: Use `:Lazy profile` to check startup performance

---

_Last Updated_: 2026-04-22  
_Total Active Plugins_: 57  
_Configuration Version_: Modern Neovim Setup with Ollama AI (glm-5:cloud), Mini.nvim Migration, and Cmdline.nvim  
_Audit Date_: 2026-04-17
