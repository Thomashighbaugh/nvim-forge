local neovim_modules = {
    'neovim.core.disabled',
    'neovim.core.pluginsInit',
    'neovim.core.commands',
    'neovim.core.editor',
    'neovim.config.editor',
    'neovim.core.mappings',
    'neovim.config.mappings'
}

for _, mod in ipairs(neovim_modules) do
    local ok, err = pcall(require, mod)
    if not ok and not mod:find('neovim.config') then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
