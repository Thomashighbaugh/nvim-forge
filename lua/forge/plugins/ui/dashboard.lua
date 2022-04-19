local icons = require("forge.plugins.ui.icons")
local g = vim.g

g.dashboard_custom_header = {
	"==================================================================",
	"==================================================================",
	"==================================================================",
	"==================================================================",
	"==================================================================",
	"========   _______ __              __         __         =========",
	"========  |    ___|  |.-----.----.|  |_.----.|__|.----.  =========",
	"========  |    ___|  ||  -__|  __||   _|   _||  ||  __|  =========",
	"========  |_______|__||_____|____||____|__|  |__||____|  =========",
	"========    _______               __                     =========",
	"========   |_     _|.---.-.-----.|  |_.----.---.-.       =========",
	"========     |   |  |  _  |     ||   _|   _|  _  |       =========",
	"========     |___|  |___._|__|__||____|__| |___._|       =========",
	"========                                                 =========",
	"==================================================================",
	"==================================================================",
	"==================================================================",
	"==================================================================",
	"=================================================================="
}

g.dashboard_default_executive = "telescope"

g.dashboard_session_directory = vim.fn.stdpath("data") .. "/sessions"

g.dashboard_custom_section = {
	find_file = {
		description = {icons.file .. " Find File           <leader>ff"},
		command = "Telescope find_files"
	},
	file_explorer = {
		description = {icons.folder.open .. " File Manager        <C-n>     "},
		command = "NvimTreeToggle"
	},
	find_string = {
		description = {icons.information .. " Grep String         <leader>fs"},
		command = "Telescope grep_string"
	}
}

g.dashboard_custom_footer = {"https://github.com/the-Electric-Tantra-Linux"}