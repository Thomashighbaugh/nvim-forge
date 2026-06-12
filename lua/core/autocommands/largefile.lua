-- Large file optimization autocommands
local au = vim.api.nvim_create_autocmd
local large_file_group = vim.api.nvim_create_augroup('LargeFile', { clear = true })

au('BufReadPre', {
    group = large_file_group,
    callback = function()
        local file_path = vim.api.nvim_buf_get_name(0)
        local file_size = vim.fn.getfsize(file_path)
        local large_file_threshold = 25 * 1024 * 1024

        if file_size > large_file_threshold or file_size == -2 then
            vim.b.large_buf = true
            vim.opt_local.swapfile = false
            vim.opt_local.bufhidden = 'unload'
            vim.opt_local.undolevels = -1
            vim.opt_local.spell = false
            vim.opt_local.foldmethod = 'manual'
            vim.opt_local.syntax = 'off'
            vim.opt_local.synmaxcol = 200
            vim.opt_local.lazyredraw = true
            print(
                string.format(
                    'Large file detected (%.2f MB), performance optimizations applied',
                    file_size / 1024 / 1024
                )
            )
        else
            vim.b.large_buf = false
        end
    end,
})
