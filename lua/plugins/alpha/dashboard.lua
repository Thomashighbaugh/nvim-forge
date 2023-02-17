local alpha = require "alpha"

local headers = {
  ["nvim"] = {
    "                                                     ",
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  },
  ["hydra"] = {
    "                                   ",
    "                                   ",
    "                                   ",
    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    "                                   ",
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
  },
  }

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = headers.logo

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
  dashboard.button("n", "   Open NeoVimTree", ":NvimTreeOpen<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
}

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    local total_plugins = "   " .. lazy.stats().count .. " Plugins"
    return version .. total_plugins
  else
    return version
  end
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButton"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
