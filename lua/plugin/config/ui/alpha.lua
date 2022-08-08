local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local function footer()
  local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
  local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  return datetime .. "   Plugins " .. plugins_count .. nvim_version_info
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]]
}
local buttonhl = function(shortcut, text, command, hl)
  local button = dashboard.button(shortcut, text, command)
  button.opts.hl_shortcut = hl
  return button
end

dashboard.section.buttons.val = {
  buttonhl("<leader>   f", "   File Browser", ":Telescope file_browser <CR>"),
  buttonhl("<leader> e n", "   New File", ":ene <BAR> startinsert <CR>"),
  buttonhl("<leader> f p", "   Find Project", ":Telescope projects <CR>"),
  buttonhl("<leader> f h", "   Recently Files", ":Telescope oldfiles <CR>"),
  buttonhl("<leader> f t", "   Find Text", ":Telescope live_grep <CR>"),
  buttonhl("<leader>   u", "   Update Plugins", ":PackerUpdate <CR>"),
  buttonhl("<leader> i p", "   Add/Remove Plugins", ":e ~/.config/nvim/lua/core/plugins.lua<CR>"),
  buttonhl("<leader> e v", "   Configuration", ":e ~/.config/nvim/lua/config.lua <CR>"),
  buttonhl("<leader>   q", "   Quit Neovim", ":qa<CR>")
}
dashboard.section.footer.val = footer()
-- dashboard.opts.opts.noautocmd = true
vim.cmd [[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)
