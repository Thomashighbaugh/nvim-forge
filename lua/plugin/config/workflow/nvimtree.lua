local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

-- press g? to show nvimtree shortcuts

local config = {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_buffer_on_setup = true,
  ignore_ft_on_setup = {"dashboard", "alpha"},
  auto_reload_on_write = true,
  open_on_tab = true,
  hijack_cursor = false,
  update_cwd = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  "
      }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500
  },
  view = {
    width = 35,
    hide_root_folder = false,
    side = "left",
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
      global = true
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
          buftype = {"nofile", "terminal", "help"}
        }
      }
    }
  }
}

nvimtree.setup(config)

-- vim:ft=lua
