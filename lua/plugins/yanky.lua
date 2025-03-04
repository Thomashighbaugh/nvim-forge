return {
    'gbprod/yanky.nvim',
    enabled = true,
    keys = {
        { '<leader>y', '<cmd>YankyRingHistory<cr>', mode = { 'n', 'x' }, desc = 'Yank Ring History (Yanky)' },
        { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank (Yanky)' },
        { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put After (Yanky)' },
        { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put Before (Yanky)' },
        { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'GPut After (Yanky)' },
        { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'GPut Before (Yanky)' },
        {
            '<C-left>P',
            '<Plug>(YankyPutIndentBeforeLinewise)',
            mode = { 'n', 'x' },
            desc = 'Put Indent Before Linewise (Yanky)',
        },
        {
            '>p',
            '<Plug>(YankyPutIndentAfterShiftRight)',
            mode = { 'n', 'x' },
            desc = 'Put Indent After Shift Right (Yanky)',
        },
        {
            '<p',
            '<Plug>(YankyPutIndentAfterShiftLeft)',
            mode = { 'n', 'x' },
            desc = 'Put Indent After Shift Left (Yanky)',
        },
        {
            '>P',
            '<Plug>(YankyPutIndentBeforeShiftRight)',
            mode = { 'n', 'x' },
            desc = 'Put Indent Before Shift Right (Yanky)',
        },
        {
            '<P',
            '<Plug>(YankyPutIndentBeforeShiftLeft)',
            mode = { 'n', 'x' },
            desc = 'Put Indent Before Shift Left (Yanky)',
        },
        { '=p', '<Plug>(YankyPutAfterFilter)', mode = { 'n', 'x' }, desc = 'Put After Filter (Yanky)' },
        { '=P', '<Plug>(YankyPutBeforeFilter)', mode = { 'n', 'x' }, desc = 'Put Before Filter (Yanky)' },
    },
    opts = {
        highlight = {
            on_put = true,
            on_yank = true,
            timer = 300,
        },
    },
}
