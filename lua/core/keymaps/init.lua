-- Auto-require all keymap files in this directory
-- Add a new .lua file under keymaps/ and it'll be loaded automatically
local dir = vim.fn.stdpath('config') .. '/lua/core/keymaps'
local files = vim.fn.readdir(dir, function(name)
    return name:match('%.lua$') and name ~= 'init.lua'
end)
if files then
    for _, file in ipairs(files) do
        require('core.keymaps.' .. file:gsub('%.lua$', ''))
    end
end