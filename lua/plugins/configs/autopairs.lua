local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.compe")

if not (present1 or present2) then
    return
end

autopairs.setup()
