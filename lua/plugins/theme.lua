local settings = require("core.settings")

if settings.theme == "tundra" then
	return {
		"sam4llis/nvim-tundra",
		config = function()
			require("plugins.themes.tundra")
		end,
	}
elseif settings.theme == "kanagawa" then
	return {
		"rebelot/kanagawa.nvim",
		config = function()
			require("plugins.themes.kanagawa")
		end,
	}
elseif settings.theme == "vscode" then
	return {
		"Mofiqul/vscode.nvim",
		config = function()
			require("plugins.themes.vscode")
		end,
	}
elseif settings.theme == "nightfly" then
	return {
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		config = function()
			require("plugins.themes.nightfly")
		end,
	}
else
	return {
		"EdenEast/nightfox.nvim",
		config = function()
			require("plugins.themes.nightfox")
		end,
	}
end
