local M = {}

local function get_basename(file)
    return file:match('^.+/(.+)$')
end
-- ------------------------------------------------- --
function M.map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- ------------------------------------------------- --
function M.buf_map(bufnr, mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = M.merge(options, opts)
    end
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
end
-- ------------------------------------------------- --
function M.get_git_root()
    local git_dir = require('galaxyline.providers.vcs').get_git_dir()
    if not git_dir then
        return 'this is not a git directory...'
    end

    local git_root = git_dir:gsub('/.git/?$', '')
    return get_basename(git_root) .. ' '
end
-- ------------------------------------------------- --
function M.split(str, sep)
    local res = {}
    for w in str:gmatch('([^' .. sep .. ']*)') do
        if w ~= '' then
            table.insert(res, w)
        end
    end
    return res
end
-- ------------------------------------------------- --
function M.highlight(group, bg, fg, gui)
    if gui ~= nil and gui ~= '' then
        vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s gui=%s', group, bg, fg, gui))
    else
        vim.api.nvim_command(string.format('hi %s guibg=%s guifg=%s', group, bg, fg))
    end
end
-- ------------------------------------------------- --
function M.merge(...)
    return vim.tbl_deep_extend('force', ...)
end
-- ------------------------------------------------- --
function M.get_active_lsp_client_names()
    local active_clients = vim.lsp.get_active_clients()
    local client_names = {}
    for _, client in pairs(active_clients or {}) do
        local buf = vim.api.nvim_get_current_buf()
        -- only return attached buffers
        if vim.lsp.buf_is_attached(buf, client.id) then
            table.insert(client_names, client.name)
        end
    end

    if not vim.tbl_isempty(client_names) then
        table.sort(client_names)
    end
    return client_names
end
-- ------------------------------------------------- --
local function unload(module_pattern, reload)
    reload = reload or false
    for module, _ in pairs(package.loaded) do
        if module:match(module_pattern) then
            package.loaded[module] = nil
            if reload then
                require(module)
            end
        end
    end
end
-- ------------------------------------------------- --
local function clear_cache()
    if 0 == vim.fn.delete(vim.fn.stdpath('config') .. '/lua/config/compiled.lua') then
        vim.cmd(':LuaCacheClear')
    end
end
-- ------------------------------------------------- --
function M.get_install_dir()
    local config_dir = os.getenv('NEOVIM_INSTALL_DIR')
    if not config_dir then
        return vim.fn.stdpath('config')
    end
    return config_dir
end
-- ------------------------------------------------- --

return M
