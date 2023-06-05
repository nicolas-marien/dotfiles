return {
	{ "RRethy/vim-illuminate" },
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			select = {
				enabled = true,
				backend = { "fzf", "telescope", "fzf_lua", "builtin", "nui" },
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_end_of_line = true,
		},
	},
	{
		"mvllow/modes.nvim",
		opts = {},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			preset = "splanted",
		},
		lazy = false,
		keys = {
			{
				"<leader>,",
				"<Cmd>BufferPrevious<CR>",
				{ noremap = true, silent = true, desc = "Go to previous buffer" },
			},
			{ "<leader>.", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" } },
			{ "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true, desc = "[B]uffer [P]in" } },
			{ "<leader>bc", "<Cmd>BufferClose<CR>", { noremap = true, silent = true, desc = "[B]uffer [C]lose" } },
			{ "<C-p>", "<Cmd>BufferPick<CR>", { noremap = true, silent = true, desc = "[P]ick buffer" } },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			-- NOTE: see https://github.com/Strazil001/Nvim/blob/main/after/plugin/lualine.lua for the helper functions

			local function getLspName()
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_active_clients()

				if next(clients) == nil then
					return "  No Active Lsp"
				end

				local activeLSP = {}
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						table.insert(activeLSP, client.name)
					end
				end

				return "  " .. table.concat(activeLSP, ", ")
			end

			local lsp = {
				function()
					return getLspName()
				end,
			}

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = vim.g.nicolas_colorscheme,
					always_divide_middle = true,
					component_separators = nil,
					section_separators = nil,
				},
				sections = {
					lualine_a = {
						"mode",
					},
					lualine_b = {
						"diagnostics",
					},
					lualine_c = {

						{ "branch", icon = { "", color = { fg = "#DCA561" } }, color = { fg = "#DCA561" } },
						{ "filename", path = 1 },
						{ "diff", colored = true, symbols = { added = "", modified = "", removed = "" } },
					},
					lualine_x = { "searchcount" },
					lualine_y = {},
					lualine_z = {
						lsp,
					},
				},
			})
		end,
	},
	{
		"code-biscuits/nvim-biscuits",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			cursor_line_only = true,
			default_config = {
				max_length = 12,
				min_distance = 5,
				prefix_string = "//",
			},
		},
	},
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				messages = {
					enabled = false,
				},
				cmdline = {
					view = "cmdline",
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		config = function()
			require("mini.animate").setup()
		end,
	},
}
