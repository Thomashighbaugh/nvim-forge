local fn = vim.fn
local api = vim.api

local tsserver_exec = 'typescript-language-server'
if fn.executable(tsserver_exec) == 0 then
  api.nvim_err_writeln(string.format('lsp: %q is not installed', tsserver_exec))
  return
end



local root_pattern = require('lspconfig').util.root_pattern
local filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
local node_root = string.format('%s/package.json', fn.getcwd())


local is_node = fn.filereadable(node_root) == 1

if is_node then
  -- Run tsserver only on Nodejs projects
  require('forge.core.lsp').setup('tsserver', {
    filetypes = filetypes,
    root_dir = root_pattern('package.json', 'tsconfig.json'),
    flags = {
      debounce_text_changes = 500,
    },
  })

end
