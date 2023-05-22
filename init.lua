-- References to ./lua/

-- Load global functions
require("core.globals")
-- Plugin management via lazy
require("core.lazy")
-- "Global" Keymappings
require("core.mappings")
-- All non-plugin related (vim) options
require("core.options")
-- Vim autocommands/autogroups
local autocmds = require("core.autocmd")
autocmds.load_defaults()

-- Let's get these things working finally
require("lsp")
