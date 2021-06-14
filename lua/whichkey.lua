require('which-key').setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {gc = 'Comments'},
    icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+' -- symbol prepended to a group
    },
    window = {
        border = 'single', -- none, single, double, shadow
        position = 'bottom', -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {'<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ '}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = 'auto' -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
}
local mappings = {
    ['/'] = 'Comment',
    ['c'] = 'Close Buffer',
    ['e'] = 'Explorer',
    ['f'] = 'Find File',
    ['h'] = 'No Highlight',
    ['p'] = 'Projects',
    d = {
        name = '+Diagnostics',
        t = {'<cmd>TroubleToggle<cr>', 'trouble'},
        w = {'<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', 'workspace'},
        d = {'<cmd>TroubleToggle lsp_document_diagnostics<cr>', 'document'},
        q = {'<cmd>TroubleToggle quickfix<cr>', 'quickfix'},
        l = {'<cmd>TroubleToggle loclist<cr>', 'loclist'},
        r = {'<cmd>TroubleToggle lsp_references<cr>', 'references'}
    },
    D = {
        name = '+Debug',
        b = {'<cmd>DebugToggleBreakpoint<cr>', 'Toggle Breakpoint'},
        c = {'<cmd>DebugContinue<cr>', 'Continue'},
        i = {'<cmd>DebugStepInto<cr>', 'Step Into'},
        o = {'<cmd>DebugStepOver<cr>', 'Step Over'},
        r = {'<cmd>DebugToggleRepl<cr>', 'Toggle Repl'},
        s = {'<cmd>DebugStart<cr>', 'Start'}
    },
    g = {
        name = '+Git',
        j = {'<cmd>NextHunk<cr>', 'Next Hunk'},
        k = {'<cmd>PrevHunk<cr>', 'Prev Hunk'},
        p = {'<cmd>PreviewHunk<cr>', 'Preview Hunk'},
        r = {'<cmd>ResetHunk<cr>', 'Reset Hunk'},
        R = {'<cmd>ResetBuffer<cr>', 'Reset Buffer'},
        s = {'<cmd>StageHunk<cr>', 'Stage Hunk'},
        u = {'<cmd>UndoStageHunk<cr>', 'Undo Stage Hunk'},
        o = {'<cmd>Telescope git_status<cr>', 'Open changed file'},
        b = {'<cmd>Telescope git_branches<cr>', 'Checkout branch'},
        c = {'<cmd>Telescope git_commits<cr>', 'Checkout commit'},
        C = {'<cmd>Telescope git_bcommits<cr>', 'Checkout commit(for current file)'}
    },
    l = {
        name = '+LSP',
        a = {'<cmd>Lspsaga code_action<cr>', 'Code Action'},
        A = {'<cmd>Lspsaga range_code_action<cr>', 'Selected Action'},
        d = {'<cmd>Telescope lsp_document_diagnostics<cr>', 'Document Diagnostics'},
        D = {'<cmd>Telescope lsp_workspace_diagnostics<cr>', 'Workspace Diagnostics'},
        f = {'<cmd>LspFormatting<cr>', 'Format'},
        i = {'<cmd>LspInfo<cr>', 'Info'},
        l = {'<cmd>Lspsaga lsp_finder<cr>', 'LSP Finder'},
        L = {'<cmd>Lspsaga show_line_diagnostics<cr>', 'Line Diagnostics'},
        p = {'<cmd>Lspsaga preview_definition<cr>', 'Preview Definition'},
        q = {'<cmd>Telescope quickfix<cr>', 'Quickfix'},
        r = {'<cmd>Lspsaga rename<cr>', 'Rename'},
        t = {'<cmd>LspTypeDefinition<cr>', 'Type Definition'},
        x = {'<cmd>cclose<cr>', 'Close Quickfix'},
        s = {'<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols'},
        S = {'<cmd>Telescope lsp_workspace_symbols<cr>', 'Workspace Symbols'}
    },
    s = {
        name = '+Search',
        b = {'<cmd>Telescope git_branches<cr>', 'Checkout branch'},
        c = {'<cmd>Telescope colorscheme<cr>', 'Colorscheme'},
        d = {'<cmd>Telescope lsp_document_diagnostics<cr>', 'Document Diagnostics'},
        D = {'<cmd>Telescope lsp_workspace_diagnostics<cr>', 'Workspace Diagnostics'},
        f = {'<cmd>Telescope find_files<cr>', 'Find File'},
        m = {'<cmd>Telescope marks<cr>', 'Marks'},
        M = {'<cmd>Telescope man_pages<cr>', 'Man Pages'},
        r = {'<cmd>Telescope oldfiles<cr>', 'Open Recent File'},
        R = {'<cmd>Telescope registers<cr>', 'Registers'},
        t = {'<cmd>Telescope live_grep<cr>', 'Text'}
    },
    S = {name = '+Session', s = {'<cmd>SessionSave<cr>', 'Save Session'}, l = {'<cmd>SessionLoad<cr>', 'Load Session'}}

    -- extras
}

local wk = require('which-key')
wk.register(mappings)
