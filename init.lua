require('core.autocommands')
require('core.options')
require('core.mappings')
require('core.utils')
require('colors.highlights')
require('plugins')
require('plugins.packerInit')
local modules = {
    'plugins',
    'core.mappings',
    'core.options',
    'core.utils'
}

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            for i = 1, #modules, 1 do
                local ok, res = xpcall(require, debug.traceback, modules[i])
                if not (ok) then
                    print('Error loading module : ' .. modules[i])
                    print(res) -- print stack traceback of the error
                end
            end
            async:close()
        end
    )
)
async:send()

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
