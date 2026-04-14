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