# Agent Guidelines for Nvim Forge Configuration

## Build/Test/Format Commands
- **Lint Lua**: `stylua --check .` (check), `stylua .` (format)
- **Test config**: Launch `nvim` and check for errors in `:checkhealth`
- **No specific test suite** - this is a Neovim configuration, not a software project

## Code Style & Conventions
- **Language**: Lua (LuaJIT runtime)
- **Indentation**: 4 spaces (set in options.lua)
- **Quotes**: Auto-prefer single quotes (stylua config)
- **Plugin structure**: `lua/plugins/` with descriptive filenames
- **Core config**: `lua/core/` for options, keymaps, autocommands, utils

## File Organization
- Plugin configs in `lua/plugins/` (one plugin per file or grouped logically)
- Core settings in `lua/core/options.lua`, keymaps in `lua/core/keymaps.lua`
- Snippets organized by language in `snippets/` directory
- Use consistent header comments with box drawing for visual separation

## Plugin Management
- Uses `lazy.nvim` for plugin management
- Plugin specs follow lazy.nvim format with opts, config, dependencies
- Enable lazy loading with events, keys, cmd, or ft triggers when appropriate

## Naming & Imports
- Use descriptive variable names (e.g., `monokai` not `m`)
- Require plugins at function scope: `require('plugin-name')`
- Global vim options via `vim.opt`, `vim.g`, `vim.o`