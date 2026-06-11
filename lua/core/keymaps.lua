-- Keymaps loader
-- Each category is split into its own file under keymaps.d/
--
-- Available files:
--   editor.lua  — Basic editor keymaps (movement, search, split, paste, spell, etc.)
--   ui.lua      — UI/plugin keymaps (bufferline, lazy, notifications, terminal, todo, treesitter)
--   git.lua     — Git keymaps (diffview toggle)
--   debug.lua   — Debug (DAP) keymaps
--   sort.lua    — Sort keymaps (built-in :sort via :Sort alias)
--   image.lua   — Image clear keymap (snacks.image)

require('core.keymaps.d.editor')
require('core.keymaps.d.ui')
require('core.keymaps.d.git')
require('core.keymaps.d.debug')
require('core.keymaps.d.sort')
require('core.keymaps.d.image')
