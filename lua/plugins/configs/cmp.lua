local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup {
    preselect = cmp.PreselectMode.None,
    completion = {completeopt = "menu,menuone,noselect,noinsert"},
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
        ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
        ["<C-m>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() == 1 then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
                elseif has_words_before() and luasnip.expand_or_jumpable() then
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        "",
                        true
                    )
                else
                    fallback()
                end
            end,
            {"i", "s"}
        ),
        ["<S-Tab>"] = cmp.mapping(
            function()
                if cmp.visible() == 1 then
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", true)
                elseif luasnip.jumpable(-1) then
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                        "",
                        true
                    )
                end
            end,
            {"i", "s"}
        ),
        ["<C-l>"] = cmp.mapping(
            function()
                if has_words_before() and luasnip.expand_or_jumpable() then
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        "",
                        true
                    )
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "", true)
                end
            end,
            {"i", "s"}
        ),
        ["<C-h>"] = cmp.mapping(
            function()
                if luasnip.jumpable(-1) then
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                        "",
                        true
                    )
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "", true)
                end
            end,
            {"i", "s"}
        )
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
        winhighlight = "FloatBorder:TelescopeBorder"
    },
    sources = {
        {name = "luasnip"},
        {name = "nvim_lua"},
        {name = "nvim_lsp"},
        {name = "calc"},
        {name = "path"},
        {name = "buffer"},
        {name = "neorg"},
        {name = "cmp_tabnine"}
    },
    formatting = {
        format = lspkind.cmp_format(
            {
                with_text = true,
                menu = ({
                    buffer = "[B]",
                    nvim_lsp = "[L]",
                    luasnip = "[S]",
                    calc = "[C]",
                    path = "[P]",
                    neorg = "[N]",
                    cmp_tabnine = "[T]"
                })
                -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            }
        )
    },
    experimental = {ghost_text = false, custom_menu = true}
}
