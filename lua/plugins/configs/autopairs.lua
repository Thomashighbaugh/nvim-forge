local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.compe")

if not (present1 or present2) then
    return
end

autopairs.setup()
autopairs_completion.setup(
    {
        map_cr = true,
        map_complete = true -- insert () func completion
    },
    vim.cmd [[
        let g:AutoPairsFlyMode = 0
        let g:AutoPairsShortcutBackInsert = '<M-C-v>'
        let g:AutoPairsShortcutFastWrap = '<M-S-n>'
        let g:AutoPairsMapCh = 0
        let g:AutoPairsMoveCharacter = "()[]{}\"'"
        au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>', '\W\zs|': '|', '/*': '*/', "\W\zs\'": ''})
        au FileType c,cpp let b:AutoPairs = AutoPairsDefine({'<': '>', '/*': '*/', "\W\zs\'": ''})
      ]]
)
