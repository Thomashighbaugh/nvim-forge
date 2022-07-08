require("sidebar-nvim").setup(
    {
        sections = {"datetime", "diagnostics", "git", "buffers"},
        open = true,
        side = "right",
        datetime = {
            icon = "",
            format = "%a %b %d, %H:%M",
            clocks = {
                {name = "local"}
            }
        }
    }
)
