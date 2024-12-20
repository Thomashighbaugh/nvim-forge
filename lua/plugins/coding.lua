---@diagnostic disable-next-line: different-requires
local Icons = require("core").icons

return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load()
				local lua = require("luasnip.loaders.from_lua")
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = function()
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			local monokai_opts = Utils.plugin.opts("monokai-pro.nvim")
			local auto_select = true

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})
			cmp.setup.filetype("java", { completion = { keyword_length = 2 } })
			return {
				window = vim.tbl_contains(monokai_opts.background_clear or {}, "float_win") and {
					completion = cmp.config.window.bordered({ border = "rounded" }),
					documentation = cmp.config.window.bordered({ border = "rounded" }),
				} or nil,
				performance = {
					fetching_timeout = 1,
				},
				completion = {
					completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
				},
				preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping(
						cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						{ "i", "c" }
					),
					["<C-p>"] = cmp.mapping(
						cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						{ "i", "c" }
					),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					-- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					-- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<Esc>"] = cmp.mapping(function(fallback)
						require("luasnip").unlink_current()
						fallback()
					end),
				}),
				sources = cmp.config.sources({
					{ name = "codeium", keyword_length = 2 },
					{ name = "copilot", keyword_length = 2 },
					{ name = "nvim_lsp" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "path" },
					{ name = "luasnip", keyword_length = 2 },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, item)
						item.menu = ({
							codeium = "Codeium",
							copilot = "Copilot",
							nvim_lsp = item.kind,
							luasnip = "Snippet",
							buffer = "Buffer",
							path = "Path",
						})[entry.source.name]
						if Icons.kinds[item.kind] then
							item.kind = Icons.kinds[item.kind]
						end
						local brain_kind = Icons.brain[entry.source.name]
						if brain_kind then
							local hl_gr =
								Utils.string.capitalize("CmpItemKind" .. Utils.string.capitalize(entry.source.name))
							item.kind = brain_kind
							item.kind_hl_group = hl_gr
							vim.api.nvim_set_hl(0, hl_gr, { fg = Icons.colors.brain[entry.source.name] })
						end
						return item
					end,
				},
				experimental = { ghost_text = true },
				sorting = defaults.sorting,
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts)
			cmp.event:on("confirm_done", function(event)
				if vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
					Utils.cmp.auto_brackets(event.entry)
				end
			end)
		end,
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},

	-- comments
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"LudoPinelli/comment-box.nvim",
		config = function()
			require("comment-box").setup({
				doc_width = 80, -- width of the document
				box_width = 65, -- width of the boxes
				borders = { -- symbols used to draw a box
					top = "─",
					bottom = "─",
					left = "│",
					right = "│",
					top_left = "╭",
					top_right = "╮",
					bottom_left = "╰",
					bottom_right = "╯",
				},
				line_width = 65, -- width of the lines
				line = { -- symbols used to draw a line
					line = "─",
					line_start = "─",
					line_end = "─",
				},
				outer_blank_lines = true, -- insert a blank line above and below the box
				inner_blank_lines = true, -- insert a blank line above and below the text
				line_blank_line_above = true, -- insert a blank line above the line
				line_blank_line_below = true, -- insert a blank line below the line
			})
		end,
	},
	--  ╞═══════════════════════════════════════════════════════════════╡
	{
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			local status_ok, comment = pcall(require, "Comment")
			if not status_ok then
				vim.notify("Comment not found!")
				return
			end

			comment.setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufRead", "BufEnter" },
		dependencies = "nvim-telescope/telescope.nvim",
		 -- stylua: ignore
		 keys = {
			 { ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
			 { '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
			 { '<leader>Tt', '<cmd>TodoTrouble<CR>', desc = 'Todo (Trouble)' },
			 { '<leader>TT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
			 { '<leader>Tt', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
			 { '<leader>TT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
		 },
		opts = { signs = false },
	},

	--╞═══════════════════════════════════════════════════════════════╡
	{
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup()
		end,
	},
	-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
	{
		"echasnovski/mini.surround",
		keys = function(_, keys)
			-- Populate the keys based on the user's options
			local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete surrounding" },
				{ opts.mappings.find, desc = "Find right surrounding" },
				{ opts.mappings.find_left, desc = "Find left surrounding" },
				{ opts.mappings.highlight, desc = "Highlight surrounding" },
				{ opts.mappings.replace, desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "Ga", -- Add surrounding in Normal and Visual modes
				delete = "Gd", -- Delete surrounding
				find = "Gf", -- Find surrounding (to the right)
				find_left = "GF", -- Find surrounding (to the left)
				highlight = "Gh", -- Highlight surrounding
				replace = "Gr", -- Replace surrounding
				update_n_lines = "Gn", -- Update `n_lines`
			},
		},
	},
}
