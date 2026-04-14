return {
    'ravnheim/project_notes',
    url = 'https://codeberg.org/ravnheim/project_notes',
    event = 'VeryLazy',
    keys = {
        { '<leader>nm', desc = 'Project Notes Main' },
        { '<leader>nt', desc = 'Project Notes Toggle' },
        { '<leader>nl', desc = 'Project Notes List' },
        { '<leader>nd', desc = 'Project Notes Delete' },
        { '<leader>ne', desc = 'Project Notes Delete Empty' },
    },
    config = function()
        local opts = {
            notes_path = '.documentation/', -- platform neutral and easier to find while not crowding things out like non-hidden directories
            autosave = true,
            extension = '.md',
            confirmation = true,
            keymaps = {
                main = '<leader>nm',
                toggle = '<leader>nt',
                list = '<leader>nl',
                delete = '<leader>nd',
                delete_empty = '<leader>ne',
            },
            highlight = {
                fg = '#cbcbcb',
                bg = '#2e2e2e',
            },
        }
        require('project_notes').setup(opts)
    end,
}
