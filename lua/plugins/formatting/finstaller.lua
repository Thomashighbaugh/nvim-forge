local null_ls = require'null-ls'
local formatter_install = require'format-installer'

local sources = {}
for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
    local config = { command = formatter.cmd }
    table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
end

null_ls.setup({
    sources = sources,
})

require("format-installer").setup({
    -- change path to suit your needs
    installation_path = vim.fn.stdpath('data') .. '/formatters/',
})

require'format-installer'.install_formatter('stylua', 'prettier', 'shfmt', 'markdownlint', 'eslint', 'black', 'fixjson')

