local mods = {
    'neovim.compiled',
    'neovim.core',
    'neovim.theme'
}

for _, mod in ipairs(mods) do
    local ok, err = pcall(require, mod)
    if mod == 'neovim.compiled' and not ok then
        vim.notify(
            'Run :PackerCompile!',
            vim.log.levels.WARN,
            {
                title = 'Electric Tantra NeoVim'
            }
        )
    elseif not ok and not mod:find('neovim.config') then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
