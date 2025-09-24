return {
    'mistricky/codesnap.nvim',
    build = 'make',
    cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapASCII' },
    keys = {
        { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'v', desc = 'Code Screenshot to Clipboard' },
        { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'v', desc = 'Code Screenshot Save' },
    },
    opts = {
        save_path = '~/Desktop',
        has_breadcrumbs = true,
        bg_padding = 0,
        watermark = '',
    },
}
