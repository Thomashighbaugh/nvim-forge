M = {
    "elentok/togglr.nvim",
    opts = {
        -- Specify key map (set to false or nil to disable)
        key = "<Leader>tg",

        -- Specify which register to use (to avoid overriding the default register)
        register = "t",

        -- Enable debugging mode
        debug = true,

        -- Add custom sets to values to toggle between
        values = {
            ["value"] = "opposite-value",
        },
    },
}

return M
