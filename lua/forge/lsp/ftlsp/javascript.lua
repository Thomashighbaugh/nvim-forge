local tsserver_exec = 'typescript-language-server'
if vim.fn.executable(tsserver_exec) == 0 then
  vim.api.nvim_err_writeln(string.format('lsp: %q is not installed', tsserver_exec))
  return
end


local root_pattern = require('lspconfig').util.root_pattern
local filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx' }
local node_root = vim.fn.getcwd() .. '/package.json'


local is_node = vim.fn.filereadable(node_root) == 1


if is_node then
  -- Run tsserver only on Nodejs projects
  require('forge.core.lsp').setup('tsserver', {
    filetypes = filetypes,
    root_dir = root_pattern('package.json', 'jsconfig.json'),
    flags = {
      debounce_text_changes = 500,
    },
  })
end
