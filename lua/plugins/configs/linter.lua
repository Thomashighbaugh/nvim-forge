local status_ok, _ = pcall(require, 'lint')
if not status_ok then
    return
end

vim.cmd([[if exists('#autolint#BufWritePost')
	:autocmd! autolint
	endif]])
