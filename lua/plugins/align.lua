return {
    'Vonr/align.nvim',
    branch = 'v2',
    lazy = true,
    keys = {
        { '<leader>aa', desc = 'Align to 1 character' },
        { '<leader>ad', desc = 'Align to 2 characters (preview)' },
        { '<leader>aw', desc = 'Align to string (preview)' },
        { '<leader>ar', desc = 'Align to regex (preview)' },
        { '<leader>gaw', desc = 'Operator: Align to string' },
        { '<leader>gaa', desc = 'Operator: Align to 1 character' },
    },
    config = function()
        local NS = { noremap = true, silent = true }

        -- Aligns to 1 character
        vim.keymap.set('x', '<leader>aa', function()
            require('align').align_to_char({
                length = 1,
            })
        end, vim.tbl_extend('force', NS, { desc = 'Align to 1 character' }))

        -- Aligns to 2 characters with previews
        vim.keymap.set('x', '<leader>ad', function()
            require('align').align_to_char({
                preview = true,
                length = 2,
            })
        end, vim.tbl_extend('force', NS, { desc = 'Align to 2 characters (preview)' }))

        -- Aligns to a string with previews
        vim.keymap.set('x', '<leader>aw', function()
            require('align').align_to_string({
                preview = true,
                regex = false,
            })
        end, vim.tbl_extend('force', NS, { desc = 'Align to string (preview)' }))

        -- Aligns to a Vim regex with previews
        vim.keymap.set('x', '<leader>ar', function()
            require('align').align_to_string({
                preview = true,
                regex = true,
            })
        end, vim.tbl_extend('force', NS, { desc = 'Align to regex (preview)' }))

        -- Example gawip to align a paragraph to a string with previews
        vim.keymap.set('n', '<leader>gaw', function()
            local a = require('align')
            a.operator(a.align_to_string, {
                regex = false,
                preview = true,
            })
        end, vim.tbl_extend('force', NS, { desc = 'Operator: Align to string' }))

        -- Example gaaip to align a paragraph to 1 character
        vim.keymap.set('n', '<leader>gaa', function()
            local a = require('align')
            a.operator(a.align_to_char)
        end, vim.tbl_extend('force', NS, { desc = 'Operator: Align to 1 character' }))
    end,
}
