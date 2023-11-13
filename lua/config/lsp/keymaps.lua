local M = {}

function M.get()
  return {
    -- Goto
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
    { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
    { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show diagnostics" },
    { "]d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic" },
    { "[d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostic" },
  }
end

function M.resolve(buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}

  local function add(keymap)
    local keys = Keys.parse(keymap)
    if keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end
  for _, keymap in ipairs(M.get()) do
    add(keymap)
  end

  local opts = require("util").opts("nvim-lspconfig")
  local clients = vim.lsp.get_active_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
    for _, keymap in ipairs(maps) do
      add(keymap)
    end
  end
  return keymaps
end

M.attach = function(_, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = M.resolve(buffer)

  for _, keys in pairs(keymaps) do
    local opts = Keys.opts(keys)
    opts.silent = opts.silent ~= false
    opts.buffer = buffer
    vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
  end
end

return M
