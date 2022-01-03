local M = {}

M.supported_themes = {
    'xresources-nvim'
}

function M.init(use, config)
    use('nekonako/xresources-nvim')
end

return M
