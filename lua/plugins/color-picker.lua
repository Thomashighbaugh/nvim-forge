return {
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                  COLOR-PICKER.NVIM                      │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'ziontee113/color-picker.nvim',
        cmd = { 'PickColor', 'PickColorInsert', 'ConvertHEXandRGB', 'ConvertHEXandHSL' },
        keys = {
            { '<leader>Cp', '<cmd>PickColor<cr>', desc = 'Color Picker' },
            { '<leader>CP', '<cmd>PickColorInsert<cr>', desc = 'Color Picker Insert' },
            { '<leader>Cr', '<cmd>ConvertHEXandRGB<cr>', desc = 'Convert HEX to RGB' },
            { '<leader>Ch', '<cmd>ConvertHEXandHSL<cr>', desc = 'Convert HEX to HSL' },
        },
        config = function()
            require('color-picker').setup({
                ['icons'] = { 'ﱢ', '' },
                ['border'] = 'rounded',
                ['background_highlight_group'] = 'Normal',
                ['border_highlight_group'] = 'FloatBorder',
                ['text_highlight_group'] = 'Normal',
            })
        end,
    },
}
