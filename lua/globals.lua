O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = "xresources",
    hidden_files = true,
    wrap_lines = true,
    number = true,
    relative_number = false,
    shell = "zsh",
    timeoutlen = 100,
    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },
    database = {save_location = "~/.config/nvcode_db", auto_execute = 1},
    python = {
        linter = "",
        -- @usage can be 'yapf', 'black'
        formatter = "",
        autoformat = true,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
        analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    dart = {sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot"},
    lua = {
        -- @usage can be 'lua-format'
        formatter = "",
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = "",
        -- @usage can be 'shfmt'
        formatter = "",
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = "",
        -- @usage can be 'prettier'
        formatter = "",
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = "prettier",
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tailwindls = {filetypes = {"html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact"}},
    clang = {diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}},
    ruby = {
        diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
        filetypes = {"rb", "erb", "rakefile"}
    },
    css = {formatter = "prettier", autoformat = true, virtual_text = true},
    -- json = {formatter = '', autoformat = true, virtual_text = true}

    dashboard = {
        custom_header = {
            "==================================================================",
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
            "==================================================================",
            "=================================================================="
        },
        footer = {"thomasleonhighbaugh.me"}
    }
}

DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
