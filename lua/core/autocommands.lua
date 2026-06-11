-- Autocommands loader
-- Each category is split into its own file under autocommands.d/
--
-- Available files:
--   editor.lua    — General editor autocommands (yank highlight, autosave, windows, filetype, etc.)
--   markdown.lua  — Markdown-specific (soft wrap, smart spell)
--   lsp.lua       — LSP-related (CursorHold code action listener)
--   largefile.lua — Large file optimization
--   linters.lua   — Manual external linter integration

require('core.autocommands.d.editor')
require('core.autocommands.d.markdown')
require('core.autocommands.d.lsp')
require('core.autocommands.d.largefile')
require('core.autocommands.d.linters')
