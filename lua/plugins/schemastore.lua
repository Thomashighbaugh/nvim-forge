-- ╭──────────────────────────────────────────────────────────╮
-- │               SCHEMASTORE.NVIM                            │
-- │  JSON/YAML schema catalog for LSP validation               │
-- │                                                           │
-- │  NOTE: This repo force-pushes to `main` on every catalog   │
-- │  update (rewrites history). The `build` step ensures the   │
-- │  local git state stays in sync so lazy.nvim's checkout     │
-- │  doesn't fail with "unable to update local ref."           │
-- ╰──────────────────────────────────────────────────────────╯
return {
    'b0o/schemastore.nvim',
    build = function()
        -- Force-reset local branch to match remote after every update.
        -- schemastore.nvim force-pushes to main, so lazy.nvim's detached
        -- HEAD checkout can leave the local branch ref stale. This ensures
        -- the git state is consistent for the next update attempt.
        local dir = vim.fn.stdpath('data') .. '/lazy/schemastore.nvim'
        if vim.fn.isdirectory(dir .. '/.git') == 1 then
            vim.fn.system({ 'git', '-C', dir, 'fetch', 'origin', 'main' })
            vim.fn.system({ 'git', '-C', dir, 'reset', '--hard', 'origin/main' })
        end
    end,
}
