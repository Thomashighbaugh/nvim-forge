
--  ╭───────────────────────────────────────────────────────────────╮
--  │                                                               │
--  │                            VSCode                             │
--  │                                                               │
--  ╰───────────────────────────────────────────────────────────────╯
-- aka GOOD ENOUGH I GUESS 
-- Default options
-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/vscode",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
			functions = "NONE",
			keywords = "NONE",
			numbers = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = true,
			visual = false,
			search = false,
		},
		-- Override highlight groups (see ./lua/vscode/theme.lua)
		group_overrides = {
			-- this supports the same val table as vim.api.nvim_set_hl
			-- use colors from this colorscheme by requiring vscode.colors!
			Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
		},
	},
})

-- setup must be called before loading
vim.cmd("colorscheme vscode")
