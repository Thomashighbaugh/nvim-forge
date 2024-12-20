-- Ref: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/pick.lua

---@class utils.pick
---@overload fun(command:string, opts?:utils.pick.Opts): fun()
local M = setmetatable({}, {
	__call = function(m, ...)
		return m.wrap(...)
	end,
})

---@class utils.pick.Opts: table<string, any>
---@field root? boolean
---@field cwd? string
---@field buf? number
---@field show_untracked? boolean

---@class utils.pick.ThemeOpts: table<string,any>

---@class Picker
---@field name string
---@field open fun(command:string, opts?:utils.pick.Opts)
---@field theme fun(opts?:utils.pick.ThemeOpts): table<string,any>
---@field commands table<string, string>

---@type Picker?
M.picker = nil
function M.register(picker)
	if vim.v.vim_did_enter == 1 then
		return true
	end

	if M.picker and M.picker.name ~= M.want() then
		M.picker = nil
	end

	if M.picker and M.picker.name ~= picker.name then
		Utils.warn(
			"`Utils.pick`: picker already set to `"
				.. M.picker.name
				.. "`,\nignoring new picker `"
				.. picker.name
				.. "`"
		)
		return false
	end
	M.picker = picker
	return true
end

function M.want()
	vim.g.nvim_forger_picker = vim.g["nvim-forge_picker"] or "auto"
	if vim.g.nvim-forge_picker == "auto" then
		return Utils.has_feature("fzf") and "fzf" or "telescope"
	end
	return vim.g.nvim-forge_picker
end

function M.who()
	return { name = M.picker.name, backend = M.picker.backend }
end

function M.open(command, opts)
	if M.picker == nil then
		Utils.warn("No picker set, use `Utils.register` to set one")
	end

	command = command ~= "auto" and command or "files"
	opts = opts or {}

	opts = vim.deepcopy(opts)

	if type(opts.cwd) == "boolean" then
		opts.cwd = Utils.root({ buf = opts.buf })
	end

	command = M.picker.commands[command] or command
	M.picker.open(command, opts)
end

---@param opts? utils.pick.ThemeOpts
function M.theme(opts)
	if M.picker == nil then
		Utils.warn("No picker set, use `Utils.register` to set one")
	end

	opts = opts or {}

	return M.picker.theme(opts)
end

---@param command? string
---@param opts? utils.pick.Opts
function M.wrap(command, opts)
	opts = opts or {}
	return function()
		Utils.pick.open(command, vim.deepcopy(opts))
	end
end

return M
