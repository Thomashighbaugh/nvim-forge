require("noteflow"):setup(
    {
        vault_dir = "~/Notes", -- nuff said
        -- relative to vault_dir or absolute
        -- "Templates" is default value
        templates_dir = "Templates",
        -- relative to vault_dir
        -- "Daily" is default value
        daily_dir = "Daily",
        -- optional hook to make note filename
        make_note_slug = function(title)
            return title
        end,
        -- optional hook to make daily note filename
        make_daily_slug = function(title)
            return title
        end,
        -- on buffer open hook
        on_open = function(bufnr)
            -- buffer local bindings and options
            vim.api.nvim_exec(
                [=[
        setl omnifunc=v:lua.noteflow_omnifunc
        nn <buffer> <silent> <C-]> :NoteflowFollowWikilink<cr>

        set nonumber
        set norelativenumber
        set signcolumn=yes:1
        hi SignColumn guibg=bg
        ]=],
                false
            )
        end,
        -- will overwrite user's highlighting
        syntax = {
            todo = true,
            wikilink = true,
            fenced_block_overlay = true -- false by default
        }
    }
)
