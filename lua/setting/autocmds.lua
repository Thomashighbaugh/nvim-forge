--- Autocommand configuration list.
-- @module settings.autocmds

local nv = require("utils.neovim")
local autocmd = nv.autocmd
local augroup = nv.augroup
local notify = nv.notify
local opt_local = vim.opt_local

autocmd(
  "BufEnter",
  "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  {
    nested = true,
    desc = "Auto-close NvimTree on opening a file"
  }
)

autocmd(
  "BufWritePost",
  function()
    require("packer").compile()
  end,
  {
    patterns = "*/lua/plugin/spec/*.lua",
    desc = "Automatically re-compile plugin specifications on changing the matched pattern files."
  }
)

autocmd(
  "TextYankPost",
  function()
    vim.highlight.on_yank(
      {
        higroup = "YankFeed",
        on_macro = true,
        on_visual = true,
        timeout = 150
      }
    )
  end,
  {
    desc = "Provide a visual color feedback on yanking."
  }
)

augroup(
  "ReplaceModes",
  {
    {
      events = {
        "BufEnter",
        "FileType"
      },
      command = function()
        require("utils.mapping").cmdline_override(true)
      end,
      options = {
        desc = "Adds mappings specific to fine-cmdline.nvim",
        patterns = "cmdline"
      }
    },
    {
      events = {
        "BufEnter",
        "FileType"
      },
      command = function()
        require("utils.mapping").search_override()
      end,
      options = {
        desc = "Adds mappings specific to searchbox.nvim",
        patterns = "search"
      }
    }
  }
)

augroup(
  "NativeAdjustments",
  {
    {
      events = {
        "TermOpen",
        "BufReadCmd"
      },
      command = function()
        opt_local.number = false
        opt_local.relativenumber = false
        require("utils.term")._TERM_KEYMAPS()
      end,
      options = {
        patterns = {
          "term://*",
          "zsh",
          "*/zsh",
          "sh",
          "bash",
          "toggleterm"
        },
        desc = "Add convenience terminal keymaps for getting out of a terminal easily, for instance."
      }
    },
    {
      events = "FileType",
      command = function()
        opt_local.formatoptions:remove(
          {
            "c",
            "r",
            "o"
          }
        )
      end,
      options = {
        desc = "Removes comment continuations from every file."
      }
    }
  }
)

augroup(
  "NotifyOnPackerOperation",
  {
    {
      events = "User",
      command = function()
        notify(
          {
            message = "Operation complete!",
            title = "packer.nvim",
            icon = ""
          }
        )
      end,
      options = {
        patterns = "PackerComplete",
        desc = "Show a notification when any packer operation is complete. For example a notification with the title 'Finised compiled!' will be shot when Compiling plugin specifications are finished!"
      }
    },
    {
      events = "User",
      command = function()
        notify(
          {
            message = "Finished compiling!",
            title = "packer.nvim",
            icon = ""
          }
        )
      end,
      options = {
        patterns = "PackerCompileDone",
        options = {
          desc = "Show a notification when any packer operation is complete!"
        }
      }
    }
  }
)

autocmd(
  "FileType",
  [[nnoremap <buffer><silent> q :quit<CR>]],
  {
    patterns = "man"
  }
)

-- NOTE: Enable this only if you want a scrollbar.
augroup(
  "ScrollbarInit",
  {
    {
      events = {
        "WinEnter",
        "FocusGained",
        "WinScrolled",
        "VimResized",
        "QuitPre"
      },
      command = function()
        require("scrollbar").show()
      end,
      options = {desc = "Show scrollbar when foucsed and when scrolled."}
    },
    {
      events = {"WinLeave", "BufLeave", "BufWinLeave", "FocusLost"},
      command = function()
        require("scrollbar").clear()
      end,
      options = {
        desc = "Remove scrollbar when not foucsed or, leaving the current window/buffer."
      }
    }
  }
)

augroup(
  "CursorLineFeedback",
  {
    {
      events = "InsertEnter",
      command = function()
        opt_local.cursorline = true
      end,
      options = {desc = "Show cursorline in Insert Mode."}
    },
    {
      events = "InsertLeave",
      command = function()
        opt_local.cursorline = false
      end,
      options = {desc = "Show cursorline in Insert Mode."}
    }
  }
)

augroup(
  "KittyPaddingOnNvim",
  {
    {
      events = "UIEnter",
      command = function()
        -- @see https://is.gd/QSh8RE
        -- @see https://is.gd/XXso9o
        -- @see https://is.gd/ZQ7EwS
        local socket = vim.env.KITTY_LISTEN_ON
        if socket then
          io.popen(string.format("kitty @ --to %s set-spacing padding=0", socket)):close()
        end
      end,
      options = {
        desc = [[Adds padding to kitty when Nvim connects to the UI.
      Using UIEnter and not VimEnter as we don't want this to happen
      when we start an headless Nvim instance.]]
      }
    },
    {
      events = "UILeave",
      command = function()
        local socket = vim.env.KITTY_LISTEN_ON
        if socket then
          io.popen(string.format("kitty @ --to %s set-spacing padding=default", socket)):close()
        end
      end,
      options = {
        desc = "Removes padding from kitty when Nvim disconnects from the UI."
      }
    }
  }
)

-- vim:ft=lua
