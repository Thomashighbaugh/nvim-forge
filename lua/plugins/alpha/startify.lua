local alpha = require "alpha"
local startify = require "alpha.themes.startify"

local headers = {
  ["nvim"] = {
    "    ███╗   ██╗██╗   ██╗██╗███╗   ███╗         ",
    "    ████╗  ██║██║   ██║██║████╗ ████║         ",
    "    ██╔██╗ ██║██║   ██║██║██╔████╔██║         ",
    "    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║         ",
    "    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║         ",
    "    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝         ",
    "    ███████╗ ██████╗ ██████╗  ██████╗ ███████╗",
    "    ██╔════╝██╔═══██╗██╔══██╗██╔════╝ ██╔════╝",
    "    █████╗  ██║   ██║██████╔╝██║  ███╗█████╗  ",
    "    ██╔══╝  ██║   ██║██╔══██╗██║   ██║██╔══╝  ",
    "    ██║     ╚██████╔╝██║  ██║╚██████╔╝███████╗",
    "    ╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
  },

  ["distro"] = {
    "_______  _______  __    _  _______  _______  _______  __    _  _______ ",
    "|       ||   _   ||  |  | ||   _   ||       ||   _   ||  |  | ||   _   |",
    "|  _____||  |_|  ||   |_| ||  |_|  ||_     _||  |_|  ||   |_| ||  |_|  |",
    "| |_____ |       ||       ||       |  |   |  |       ||       ||       |",
    "|_____  ||       ||  _    ||       |  |   |  |       ||  _    ||       |",
    " _____| ||   _   || | |   ||   _   |  |   |  |   _   || | |   ||   _   |",
    "|_______||__| |__||_|  |__||__| |__|  |___|  |__| |__||_|  |__||__| |__|",
    "               ___      ___   __    _  __   __  __   __                 ",
    "              |   |    |   | |  |  | ||  | |  ||  |_|  |                ",
    "              |   |    |   | |   |_| ||  | |  ||       |                ",
    "              |   |    |   | |       ||  |_|  ||       |                ",
    "              |   |___ |   | |  _    ||       | |     |                 ",
    "              |       ||   | | | |   ||       ||   _   |                ",
    "              |_______||___| |_|  |__||_______||__| |__|                "
  },
  ["logo"] = {
    "+-------------------------------------------------------------------+",
    "|                                 ,.                                |",
    "|                                lxk'                               |",
    "|                               oKOKK:                              |",
    "|                             .o0KOKKKc                             |",
    "|                            .OK00kXXXKc                            |",
    "|                           ;KXXXXXXOOXKk.                          |",
    "|                          oXkXXXXkK0KKxKO,                         |",
    "|                        .xXK0KOXKOKKKK0XK0:                        |",
    "|                       .kKKKOXOKK000OOO0K00;                       |",
    "|                      .oKKK0kKKXKxKKKKkKKKKdl                      |",
    "|                     :KXXkKKKXXXXXXOOKKKXXXXX0.                    |",
    "|                    lK0xKO0OxKKKKx000Kx000Kd0Kk'                   |",
    "|                   dx00OKXXKOKxOKOKXXKOXOxKO0KXK:                  |",
    "|                  ;c';,'...';l:xKOKKKK00OxKO0KKKOl                 |",
    "|                'l....          .'xXXKxK0KKdO0KKxOd                |",
    "|               ,KXOo,  .,lx,  ''..  ,xKXXXXXXX0NNXXO.              |",
    "|              lkc.  ,o0NNNK  .,,,.    .:OKKkXXKXk0XX0.             |",
    "|            .dKl  .0NNNNNN0  .,,,.       ,lxKKXX0KKOX0;            |",
    "|           .x00Od' .oNNNNNN, .,,,,..  ....   ..'',,...l:           |",
    "|          .0xOKKKOo. .dXNNNK,  .,,,,',,,,,.   :doll;  :Kl          |",
    "|         :XXXXXkKKKXk; .c0NNNx.  .......   .oKNNOl' .l0Xkx.        |",
    "|        oKXKxO00KkO00Kk;. .lONNOl;..  .';o0N0d;. .ckKOk0OKx.       |",
    "|      .dK0xKOKXXXOKXx00OKkc' .,cdkOOOOxdl;.  .:dkKKxK00XXX0O'      |",
    "|     .kOKKkKO0KKK00KxKKOKKKKkd:,'......'';ld0KKKO0KkK0OKKK0O0,     |",
    "|    .OKxKK00x0XXX0x00K0d0000xKK00kXXXKxK0KKdO0KKxOK00kOXXXKx00c    |",
    "+-------------------------------------------------------------------+"
  }
}

startify.section.header.val = headers.nvim
startify.section.header.opts.hl = "AlphaHeader"

startify.section.top_buttons.val = {
  startify.button("f", "  Find File", ":Telescope find_files<CR>"),
  startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  startify.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
  startify.button("t", "  Find Text", ":Telescope live_grep<CR>"),
  startify.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  startify.button("u", "  Update Plugins", ":Lazy update<CR>"),
  startify.button("q", "  Quit Neovim", ":qa!<CR>")
}
-- disable MRU
startify.section.mru.val = {{type = "padding", val = 0}}
-- disable MRU cwd
startify.section.mru_cwd.val = {{type = "padding", val = 0}}

startify.nvim_web_devicons.enabled = true
-- startify.nvim_web_devicons.highlight = false
-- startify.nvim_web_devicons.highlight = 'Keyword'
--
startify.section.bottom_buttons.val = {}

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor ..
                      "." .. vim.version().patch .. " | "
  local message = "nvim-forge by TLH ©2023 | "
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    local total_plugins = " " .. lazy.stats().count .. " Plugins"
    return "\n\n" .. message .. version .. total_plugins
  else
    return "\n\n" .. message .. version
  end
end

startify.section.footer.val = {{type = "text", val = footer}}
-- ignore filetypes in MRU

local default_mru_ignore = {"gitcommit"}

startify.mru_opts.ignore = function(path, ext)
  return (string.find(path, "COMMIT_EDITMSG")) or
             (vim.tbl_contains(default_mru_ignore, ext))
end
alpha.setup(startify.config)
