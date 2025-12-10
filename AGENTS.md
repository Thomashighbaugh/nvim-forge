# Agent Guidelines for Nvim Configuration

## Build/Test/Format Commands
- **Format**: `stylua .` (4 spaces, single quotes)
- **Lint**: `stylua --check .`
- **Test**: Launch `nvim` and run `:checkhealth`

## Code Style & Conventions
- **Language**: Lua (LuaJIT)
- **Indentation**: 4 spaces
- **Quotes**: Single quotes preferred
- **Structure**: Plugin configs in `lua/plugins/`, core in `lua/core/`
- **Naming**: Descriptive names (`monokai` not `m`)
- **Imports**: Require at function scope: `require('plugin-name')`
- **Options**: Use `vim.opt`, `vim.g`, `vim.o` for global settings

## Plugin Management
- Uses `lazy.nvim` with lazy loading (events, keys, cmd, ft)
- Plugin specs follow lazy.nvim format with opts, config, dependencies

## Visual Style
- Use box drawing characters for section headers
- Consistent comment formatting with visual separators