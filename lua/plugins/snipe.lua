-- ╭─────────────────────────────────────────────────────────╮
-- │               SNIPE REPLACED BY MINI                    │
-- ╰─────────────────────────────────────────────────────────╯
-- snipe.nvim has been replaced by mini.pick.builtin.buffers()
-- Configuration is now in mini-suite.lua
-- This provides:
-- - Buffer selection via mini.pick interface
-- - Consistent picker experience
-- - Better integration with overall workflow
--
-- Benefits:
-- - Unified picker interface for all selection tasks
-- - Consistent keybindings and behavior
-- - Reduced plugin count

return {
    -- Snipe is now disabled in favor of mini.pick.builtin.buffers()
    -- The '-' key is still mapped in mini-suite.lua but may be remapped
    -- Use <leader>fb for buffer selection via mini.pick
}
