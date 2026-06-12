return {
    'Chaitanyabsprip/fastaction.nvim',
    keys = {
        { '<Space>aa', '<cmd>lua require("fastaction").code_action()<CR>', desc = 'Code Actions', mode = { 'n', 'x' } },
        {
            '<Space>af',
            '<cmd>lua require("fastaction").code_action({ select_first = true })<CR>',
            desc = 'Apply First Code Action',
            mode = { 'n', 'x' },
        },
    },
    ---@type FastActionConfig
    opts = {
        dismiss_keys = { 'j', 'k', '<c-c>', 'q' },
        keys = 'qwertyuiopasdfghlzxcvbnm',
        popup = {
            border = 'rounded',
            hide_cursor = true,
            highlight = {
                action = 'MoreMsg',
                divider = 'FloatBorder',
                key = 'MoreMsg',
                source = 'Comment',
                title = 'Title',
                window = 'NormalFloat',
            },
            title = 'Select one of:',
        },
        register_ui_select = false,
    },
}
