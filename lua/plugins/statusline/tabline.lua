require("tabline").setup({
	enable = true,
	options = {
		section_separators = { "", "" },
		component_separators = { "", "" },
		max_bufferline_percent = 66,
		show_tabs_always = true,
		show_devicons = true,
		show_bufnr = false,
		show_filename_only = true,
	},
})
vim.cmd([[
    set guioptions-=e
    set sessionoptions+=tabpages,globals
]])
