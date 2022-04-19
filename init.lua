-- Name: Arnold Chand
-- Github: https://github.com/creativenull
-- My vimrc, tested on Linux and Windows
-- + python3
-- + ripgrep
-- + bat
-- + curl
-- + deno
-- =============================================================================

-- Initialize
local core = require("forge.core")
core.setup(
  {
    config = {
      -- Leader key
      leader = " ",
      -- Colorscheme config
      theme = {
        name = "xresources",
        enable_transparent_features = false,
        enable_custom_visual_hl = true,
        on_before = function()
          -- nightfly
          vim.g.nightflyNormalFloat = true
          vim.g.nightflyTransparent = true

          -- starry
          vim.g.starry_disable_background = true
        end
      },
      -- Adjust packer config
      plugins = {
        init = {
          compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua"
        }
      }
    },
    -- Events
    on_before = function()
      local autocmd = require("forge.core.event").autocmd

      -- Highlight text yank
      autocmd(
        {
          event = "TextYankPost",
          exec = function()
            vim.highlight.on_yank({higroup = "Search", timeout = 500})
          end
        }
      )
    end,
    on_after = function()
      require("forge.user.keymaps")
      require("forge.user.options")
      require("forge.user.abbreviations")

      -- Custom user commands
      require("forge.user.conceal")
      require("forge.user.codeshot")
    end
  }
)
