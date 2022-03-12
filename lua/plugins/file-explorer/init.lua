local g = vim.g
local icons = require("plugins.theme.icons")
local M = {}

function M.init()
	-- settings
	g.nvim_tree_git_hl = 1
	g.nvim_tree_refresh_wait = 300

	g.nvim_tree_special_files = {}
	g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
	}

	g.nvim_tree_icons = {
		default = "",
		symlink = icons.symlink,
		git = icons.git,
		folder = icons.folder,
		lsp = {
			hint = icons.hint,
			info = icons.info,
			warning = icons.warn,
			error = icons.error,
		},
	}


require'nvim-tree'.setup {
  ignore_ft_on_setup   = {},
  auto_close           = true,
  auto_reload_on_write = true,
  hijack_cursor        = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 15,
    height = 30,
    hide_root_folder = false,
    side = 'left',
      auto_resize = true,
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  }
end

return M
