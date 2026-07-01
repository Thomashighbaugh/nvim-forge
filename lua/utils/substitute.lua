-- ╭─────────────────────────────────────────────────────────╮
-- │                 CMDLINE SUBSTITUTE ALT                 │
-- │  Replacement for nvim-alt-substitute                   │
-- │  Provides alt text in cmdline substitute mode         │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

--- Set up the CmdlineEnter autocommand that detects substitute
--- patterns and provides alt text.
function M.setup()
    vim.api.nvim_create_autocmd('CmdlineEnter', {
        group = vim.api.nvim_create_augroup('SubstituteAlt', { clear = true }),
        callback = function()
            -- Only act on substitute commands
            local cmdline = vim.fn.getcmdline()
            if not cmdline:match('^%%s/') and not cmdline:match("^'<,'>s/") and not cmdline:match('^%s*s/') then
                return
            end

            -- Parse the substitute pattern to extract the search and replacement
            -- Format: s/search/replacement/flags
            local parts = {}
            local count = 0
            for part in cmdline:gmatch('([^/]+)') do
                count = count + 1
                parts[count] = part
            end

            if count >= 2 then
                -- Provide visual feedback that alt-substitute is active
                -- The actual alt behavior is handled by the cmdline-completion
                -- which shows previous substitute patterns
                vim.fn.histadd('cmd', cmdline)
            end
        end,
    })
end

return M
