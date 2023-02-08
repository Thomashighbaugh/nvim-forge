if not vim.g.vscode then
	require("core")

	-- Release note
	vim.schedule(function()
		vim.notify_once(
			[[
This is the new, lazy-loading neovim configuration I will be crafting code and pulling my hair out using. 


To silence this message, remove it from `init.lua` at ~/.config/nvim
]],
			vim.log.levels.WARN
		)
	end)
end
