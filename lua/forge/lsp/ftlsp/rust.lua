local exec = 'rust-analyzer'
if vim.fn.executable(exec) == 0 then
  vim.api.nvim_err_writeln(string.format('lsp: %q is not installed', exec))
  return
end

require('forge.core.lsp').setup('rust_analyzer', {
  flags = {
    debounce_text_changes = 500,
  },
})
