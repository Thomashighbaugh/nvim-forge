local present, impatient = pcall(require, "impatient")
local impatient = require("impatient")
-- if not present then
  -- return
-- end

impatient.enable_profile()
require("plugin.compiledSpec")

-- vim:ft=lua
