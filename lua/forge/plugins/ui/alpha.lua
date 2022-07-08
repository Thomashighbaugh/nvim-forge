local present, alpha = pcall(require, "alpha")
if not present then
    return
end

local header = {
    type = "text",
    val = {
        "==================================================================",
        "==================================================================",
        "==================================================================",
        "==================================================================",
        "========   _______ __              __         __         =========",
        "========  |    ___|  |.-----.----.|  |_.----.|__|.----.  =========",
        "========  |    ___|  ||  -__|  __||   _|   _||  ||  __|  =========",
        "========  |_______|__||_____|____||____|__|  |__||____|  =========",
        "========    _______               __                     =========",
        "========   |_     _|.---.-.-----.|  |_.----.---.-.       =========",
        "========     |   |  |  _  |     ||   _|   _|  _  |       =========",
        "========     |___|  |___._|__|__||____|__| |___._|       =========",
        "========                                                 =========",
        "==================================================================",
        "==================================================================",
        "==================================================================",
        "=================================================================="
    },
    opts = {
        position = "center",
        hl = "Number"
    }
}

local function getGreeting(name)
    local tableTime = os.date("*t")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "望 Good night"
    }
    local greetingIndex = ""
    if hour == 23 or hour < 7 then
        greetingIndex = 1
    elseif hour < 12 then
        greetingIndex = 2
    elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
    elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
    elseif hour >= 21 then
        greetingIndex = 5
    end
    return greetingsTable[greetingIndex] .. ", " .. name
end

local userName = "Mr. Highbaugh"
local greeting = getGreeting(userName)

local greetHeading = {
    type = "text",
    val = greeting,
    opts = {
        position = "center",
        hl = "Function"
    }
}

local plugins = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
    local handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | grep pack | wc -l | tr -d "\n" ')
    if handle == nil then
        return nil
    end
    plugins = handle:read("*a")
    handle:close()

    plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
    plugins = "N/A"
end

local pluginCount = {
    type = "text",
    val = "  " .. plugins .. " plugins in total",
    opts = {
        position = "center",
        hl = "Function"
    }
}

local quote = [[
    "... the most persistent principles 
    of the universe were accident and error."
]]
local quoteAuthor = "Dune"
local fullQuote = quote .. "\n                  - " .. quoteAuthor

local fortune = {
    type = "text",
    val = fullQuote,
    opts = {
        position = "center",
        hl = "Comment"
    }
}

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 3,
        width = 48,
        align_shortcut = "right",
        hl_shortcut = "Number",
        hl = "String"
    }
    if keybind then
        opts.keymap = {"n", sc_, keybind, {noremap = true, silent = true}}
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts
    }
end

local buttons = {
    type = "group",
    val = {
        button("r", "   Recents", ":Telescope oldfiles<CR>"),
        button("f", "   Search", ":Telescope find_files<CR>"),
        button("e", "   Create", ":ene <BAR> startinsert<CR>"),
        button("u", "   Update", ":PackerSync<CR>")
    },
    opts = {
        position = "center",
        spacing = 1
    }
}

local section = {
    header = header,
    buttons = buttons,
    greetHeading = greetHeading,
    pluginCount = pluginCount,
    footer = fortune
}

local opts = {
    layout = {
        {type = "padding", val = 0},
        section.header,
        {type = "padding", val = 1},
        section.greetHeading,
        section.pluginCount,
        {type = "padding", val = 1},
        section.buttons,
        {type = "padding", val = 1},
        section.footer
    },
    opts = {
        margin = 20
    }
}
alpha.setup(opts)
