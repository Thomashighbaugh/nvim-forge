-- Auto-require all autocommand files in this directory
-- Add a new .lua file under autocommands/ and it'll be loaded automatically
local dir = vim.fn.stdpath('config') .. '/lua/core/autocommands'
local files = vim.fn.readdir(dir, function(name)
    return name:match('%.lua$') and name ~= 'init.lua'
end)
if files then
    for _, file in ipairs(files) do
        require('core.autocommands.' .. file:gsub('%.lua$', ''))
    end
end