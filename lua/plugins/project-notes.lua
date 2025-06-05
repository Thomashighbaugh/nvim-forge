return {
    'ravnheim/project_notes',
    url = 'https://codeberg.org/ravnheim/project_notes',
    event = 'VeryLazy',

    config = function()
        local opts = {
            notes_path = '.github/documentation/',
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
                fg = '#a0a0a0',
                bg = '#2e2e2e',
            },
        }
        require('project_notes').setup(opts)
    end,
}
