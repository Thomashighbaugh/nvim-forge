-- ╭─────────────────────────────────────────────────────────╮
-- │                     NEOVIM TIPS                          │
-- ╰─────────────────────────────────────────────────────────╯
return {
    'saxon1964/neovim-tips',
    version = '*', -- Only update on tagged releases
    lazy = true, -- Load only when keybinds are triggered
    dependencies = {
        'MunifTanjim/nui.nvim',
        -- Clean rendering of tips (markdown renderer)
        'MeanderingProgrammer/render-markdown.nvim',
    },
    opts = {
        -- IMPORTANT: Daily tip does NOT work with lazy = true
        -- (plugin only loads when keybinds are triggered, but the daily
        -- tip needs it loaded at startup), so it stays off.
        daily_tip = 0, -- 0 = off, 1 = once per day, 2 = every startup
        bookmark_symbol = '🌟 ',
        -- Keep user tips out of the git-tracked config dir (stdpath('config')
        -- resolves to the repo via symlink); state dir is machine-local.
        user_file = vim.fn.stdpath('state') .. '/neovim_tips/user_tips.md',
    },
    keys = {
        { '<Space>nto', '<cmd>NeovimTips<CR>', desc = 'Neovim tips' },
        { '<Space>ntb', '<cmd>NeovimTipsBookmarks<CR>', desc = 'Bookmarked tips' },
        { '<Space>ntr', '<cmd>NeovimTipsRandom<CR>', desc = 'Show random tip' },
        { '<Space>nte', '<cmd>NeovimTipsEdit<CR>', desc = 'Edit your tips' },
        { '<Space>nta', '<cmd>NeovimTipsAdd<CR>', desc = 'Add your tip' },
        { '<Space>ntp', '<cmd>NeovimTipsPdf<CR>', desc = 'Open tips PDF' },
    },
}
