# Neovim Forge

My [Winchester Mystery](https://en.wikipedia.org/wiki/Winchester_Mystery_House) Neovim configuration, powered by `lazy.nvim`.

> **Warning**
> This is a personal config. It changes unpredictably — rebases, rewrites, and breakage happen without notice. Feel free to borrow pieces or use it as a starting point. Pull requests welcome.

---

## Quick Start

```sh
# Back up your current config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this one
git clone https://github.com/Thomashighbaugh/nvim-forge ~/.config/nvim
```

Open Neovim — `lazy.nvim` bootstraps itself, installs plugins, and pulls Treesitter grammars + Mason LSP servers. Give it a few minutes on first launch.

**Leader key:** `,` (comma) — both `mapleader` and `maplocalleader`.

## What's Here

```
init.lua                    Bootstrap: lazy.nvim, leader keys, core modules
├── lua/core/               Vim options, keymaps, autocommands, commands, notifications
├── lua/plugins/            Plugin specs (lazy.nvim format)
│   └── lsp/                LSP, Mason, diagnostics, outlines
├── lua/utils/              Shared utilities
├── after/syntax/           Filetype syntax overrides
├── ftplugin/               Filetype-specific settings (Java, etc.)
├── snippets/               LuaSnip + VSCode-compatible snippets
├── spell/                  Custom dictionary additions
└── syntax/                 Additional syntax files
```

Plugin specs live in `lua/plugins/` — one file per plugin (or per concern). They're loaded by `lazy.nvim` via `{ import = 'plugins' }` and `{ import = 'plugins.lsp' }`. Unlike most configs, there's no author-namespaced subdirectory; require paths stay flat.

## Core Modules

| Module | Purpose |
|--------|---------|
| `core/options` | Editor settings (numbers, splits, clipboard, etc.) |
| `core/keymaps` | All keybindings — general, plugin, terminal, AI |
| `core/autocommands` | Autocmds for highlighting, formatting, events |
| `core/usercommands` | Custom `:Commands` |
| `core/notifications` | Enhanced notification system |
| `core/smart-redraw` | Lazyredraw optimization during macros |
| `core/error-logging` | Structured error capture and display |

## Plugin Categories

| Category | Plugins |
|----------|---------|
| **Completion & Snippets** | blink.cmp, LuaSnip |
| **AI** | Avante, Codeium, Ollama, AiSync |
| **LSP** | nvim-lspconfig, Mason, Trouble, Glance, Outline, LSP Endhints, LazyDev |
| **Fuzzy Finding** | Snacks (picker) |
| **File Navigation** | Snacks (explorer), Snipe |
| **Git** | Snacks (git), Diffview |
| **Editing** | nvim-surround, mini-align, mini-indentscope, flash, nvim-autopairs, rainbow-delimiters, yanky, conform, nvim-lint |
| **UI** | bufferline, lualine, noice, statuscol, which-key, colorizer, image_preview, CodeSnap, cmdline |
| **Debug** | nvim-dap |
| **Search & Replace** | inc-replace, smart-splits |
| **Project** | project-notes, snacks (dashboard, bigfile, quickfile, scope, scroll, terminal) |

## Keybinding Cheat Sheet

`,` is the leader key. `Space` is also used extensively as a prefix.

| Category | Sample Bindings |
|----------|----------------|
| **Save** | `,w` save |
| **Navigation** | `Space h/j/k/l` move between splits |
| **Buffers** | `Space b` prefix — pin, pick, close, go-to-buffer (1-9) |
| **Search/Replace** | `,R` replace word under cursor; `,r` replace in selection |
| **LSP** | `gr` prefix — `grd` definition, `grr` references, `grn` rename, `gra` code action |
| **Debug** | `,D` prefix — continue, step, breakpoint, terminate |
| **Lazy** | `,l` prefix — `,la` open, `,ls` sync, `,lc` clean |
| **AI** | `,Oa` prefix — grammar, explain, complete, fix bugs, add tests |
| **Noice** | `Space n` prefix — messages, errors, history |
| **Terminal** | `Esc` or `kj` to exit terminal mode |

Full keybinding reference: [`.documentation/keybindings.md`](.documentation/keybindings.md) (if available).

## Adding a Plugin

1. Create `lua/plugins/your-plugin.lua`
2. Follow the `lazy.nvim` spec format:

```lua
return {
    'author/plugin-name',
    event = 'VeryLazy', -- or keys, cmd, ft for lazy loading
    opts = {},
    config = function(_, opts)
        require('plugin-name').setup(opts)
    end,
}
```

3. Restart or run `:Lazy sync`

## Gotchas

- **Leader is `,`** — if you're used to `<Space>` as leader, many bindings won't work as expected.
- **`kj` exits insert/terminal mode** — no need to reach for Escape.
- **`dd` on empty lines** doesn't yank — intentional, uses the black-hole register.
- **`c` and `C` don't yank** — intentional, uses the black-hole register.
- **`p` in visual mode pastes without overwriting** the default register.
- **Smart redraw** automatically toggles `lazyredraw` during macros and expensive operations.
- **Big files** (>1MB) get automatic performance optimizations via Snacks.
- **`z=`** uses `vim.ui.select` instead of the default spelling suggestion list.
- **Treesitter context** toggle: `,ct`

## Inspiration

- [Allaman/nvim](https://github.com/Allaman/nvim)
- [Alexis12119/nvim-config](https://github.com/Alexis12119/nvim-config)
- [glepnir/nvim](https://github.com/glepnir/nvim)
- [ayamir/nvimdots](https://github.com/ayamir/nvimdots)
- [CharlesChiuGit/nvimdots.lua](https://github.com/CharlesChiuGit/nvimdots.lua)
- [dragove/nvim](https://github.com/dragove/nvim)
- [Dharmx/nvim](https://github.com/dharmx/nvim)
- [loctvl842/nvim](https://github.com/loctvl842/nvim)