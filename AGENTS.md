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

## Custom Utilities (`lua/utils/`)
Local function replacements for plugins — loaded from `init.lua` (or lazily where noted).

### No mini.nvim equivalent — DO NOT REMOVE without a verified drop-in replacement
| File | Purpose | Loaded from |
|------|---------|-------------|
| `window.lua` | Split maximize/equalize + swap buffers across windows (smart-splits replacement) | `init.lua` |
| `toggler.lua` | Toggle boolean words (`<leader>wt`: true/false, on/off, …) | `init.lua` |
| `todo-marker.lua` | Cycle TODO/FIXME/HACK marker (`<leader>tt`), toggle checkbox (`<leader>tc`) | `init.lua` |
| `substitute.lua` | Cmdline substitute helper (nvim-alt-substitute replacement) | `init.lua` |
| `code_actions.lua` | FastAction-style code action listener | `lua/core/autocommands/editor.lua` |

### Replaced by mini.nvim modules (2026-08) — files deleted, do not recreate
| Former util | Replacement | Notes |
|-------------|-------------|-------|
| `surround.lua` | `mini.surround` (in `mini-suite.lua`) | `sa`/`sd`/`sr` kept; HTML tag surround lost; visual add bound to `sa` (not mini's default `s`, avoids flash conflict) |
| `autopairs.lua` | `mini.pairs` | `vim.g.autopairs_enabled` toggle removed |
| `buffer.lua` | `mini.bufremove` | `<leader>bd`/`<leader>bD` re-bound in `mini-suite.lua` keys |
| `comment.lua` | `mini.comment` | `gc`/`gcc`/`gb`/`gbc` defaults |

### Shared helper
- `lua/core/utils.lua` — `max_or_equal()` split toggle, used by `<Space>m`

**WARNING**: This repo previously lost `lua/utils/` entirely in an over-eager cleanup. These utils exist because their behavior differs from (or has no) plugin equivalent. Any removal requires explicit user approval with verified identical behavior.

## Visual Style
- Use box drawing characters for section headers
- Consistent comment formatting with visual separators

## Documentation Management
When plugins are added, removed, or significantly modified, the plugin documentation MUST be updated.

### Plugin Documentation Update Requirements
- **Location**: `/home/tlh/.config/nvim/.documentation/plugins.md`
- **Trigger Events**: Any time plugins are added, removed, or have major configuration changes
- **Update Method**: Use the Task tool with 'explore' agent to regenerate the plugin catalog

### When to Update Documentation
1. **Adding new plugins**: After installing any new plugin
2. **Removing plugins**: After deleting plugin files or disabling plugins  
3. **Major configuration changes**: When plugin functionality or keybindings change significantly
4. **Dependency changes**: When plugin dependencies are modified

### Documentation Update Process
1. **Scan Configuration**: Use Task tool to explore all plugin files in `lua/plugins/` and `lua/plugins/lsp/`
2. **Extract Information**: Gather plugin names, repositories, categories, functionality, and keybindings
3. **Update Table**: Regenerate the markdown table in `.documentation/plugins.md`
4. **Verify Accuracy**: Ensure all active plugins are documented and removed plugins are deleted from docs

### Task Tool Usage for Documentation
```
Use Task tool with:
- subagent_type: "explore"  
- description: "Update plugin documentation"
- prompt: "Scan all plugin files and update the plugin documentation table in .documentation/plugins.md with current plugins, their functionality, and keybindings"
```

### Documentation Standards
- **Table Format**: Plugin Name | Repository | Category | Functionality | Key Bindings
- **Categories**: LSP, UI, Text Editing, Git, AI, Debug, Utilities, etc.
- **Completeness**: Every active plugin must be documented
- **Accuracy**: Remove documentation for deleted/disabled plugins
- **Consistency**: Follow existing format and categorization patterns

**IMPORTANT**: Documentation updates are mandatory, not optional. Keeping plugin documentation current ensures the configuration remains maintainable and understandable.