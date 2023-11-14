local M ={}
local dict = require("cmp_dictionary")

dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  sqlite = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

dict.switcher({
  spelllang = {
    en = "/home/tlh/.config/nvim/spell/en.dict",
    hi ="/home/tlh/.config/nvim/spell/hi.dict",
    es = "/home/tlh/.config/nvim/spell/es.dict",

  },
})
return M
