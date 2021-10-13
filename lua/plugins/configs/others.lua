local M = {}

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
        colorizer.setup()
        vim.cmd("ColorizerReloadAllBuffers")
    end
end

M.comment = function()
    local present, nvim_comment = pcall(require, "nvim_comment")
    if present then
        nvim_comment.setup()
    end
end

M.lspkind = function()
    local present, lspkind = pcall(require, "lspkind")
    if present then
        lspkind.init()
    end
end

M.neoscroll = function()
    pcall(
        function()
            require("neoscroll").setup()
        end
    )
end

M.blankline = function()
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
    vim.cmd [[hi IndentBlanklineIndent1 guifg=#17191e guibg=NONE blend=10]]
    vim.cmd [[hi IndentBlanklineIndent2 guifg=#17191e guibg=NONE blend=10]]
    vim.cmd [[hi IndentBlanklineIndent3 guifg=#17191e guibg=NONE blend=10]]
    vim.cmd [[hi IndentBlanklineIndent4 guifg=#17191e guibg=NONE blend=10]]
    vim.cmd [[hi IndentBlanklineIndent5 guifg=#17191e guibg=NONE blend=10]]
    vim.cmd [[hi IndentBlanklineIndent6 guifg=#17191e guibg=NONE blend=10]]
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "packer", "norg"}
    vim.g.indent_blankline_buftype_exclude = {"terminal", "norg", "TelescopePrompt", "Startify"}
end

return M
