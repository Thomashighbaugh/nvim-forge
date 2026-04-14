return {
    'echasnovski/mini.align',
    enabled = true,
    version = false,
    keys = {
        { '<leader>ma', desc = 'Align with preview', mode = { 'n', 'x' } },
        { '<leader>mA', desc = 'Align without preview', mode = { 'n', 'x' } },
    },
    config = function()
        require('mini.align').setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                start = '<leader>ma',
                start_with_preview = '<leader>mA',
            },
            -- Modifiers changing alignment steps and/or options
            modifiers = {
                -- Main option modifiers
                ['s'] = --[[ (s)plit ]] function(steps, opts)
                    opts.split_pattern = vim.fn.input('Split pattern: ')
                    return steps
                end,
                
                ['j'] = --[[ (j)ustify ]] function(steps, opts)
                    opts.justify_side = vim.fn.input('Justify side (left/center/right): ', 'left')
                    return steps
                end,
                
                ['m'] = --[[ (m)erge delimiter ]] function(steps, opts)
                    opts.merge_delimiter = ''
                    return steps
                end,
                
                -- Modifiers adding pre-steps
                ['f'] = --[[ (f)ilter ]] function(steps, opts)
                    local filter_lua_pattern = vim.fn.input('Lua pattern to filter parts: ')
                    if filter_lua_pattern == '' then return steps end
                    
                    table.insert(steps, 1, MiniAlign.gen_step.filter(filter_lua_pattern))
                    return steps
                end,
                
                ['i'] = --[[ (i)gnore_case ]] function(steps, opts)
                    local ignore_case = true
                    table.insert(steps, 1, MiniAlign.gen_step.ignore_split(ignore_case))
                    return steps
                end,
                
                ['p'] = --[[ (p)airs ]] function(steps, opts)
                    table.insert(steps, 1, MiniAlign.gen_step.pairs())
                    return steps
                end,
                
                ['t'] = --[[ (t)rim ]] function(steps, opts)
                    table.insert(steps, 1, MiniAlign.gen_step.trim())
                    return steps
                end,
            },
        })
    end,
}
