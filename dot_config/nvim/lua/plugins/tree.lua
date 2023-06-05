return {
	{

		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("nvim-web-devicons").setup({
				-- globally enable default icons (default to false)
				-- will get overridden by `get_icons` option
				default = true,
				strict = true,
				override_by_extension = {
					["cy.ts"] = {
						icon = "",
						color = "#519aba",
						cterm_color = "74",
						name = "TestCypressTs",
					},
				},
			})

			require("neo-tree").setup({
				close_if_last_window = true,
				nesting_rules = {
					ts = { "spec.ts" },
					tsx = { "spec.tsx" },
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
							".git",
							".husky",
						},
					},
				},
			})
		end,
		keys = {
			{
				"\\",
				"<cmd>Neotree toggle reveal<cr>",
				{ desc = "[T]oggle [E]xplorer" },
			},
		},
		enabled = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		enabled = false,
		config = function()
			require("nvim-web-devicons").setup({
				-- globally enable default icons (default to false)
				-- will get overriden by `get_icons` option
				default = true,
				strict = true,
				override_by_extension = {
					["cy.ts"] = {
						icon = "",
						color = "#519aba",
						cterm_color = "74",
						name = "TestCypressTs",
					},
				},
			})
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					update_root = false,
					ignore_list = {},
				},
				git = {
					enable = true,
					ignore = false,
					timeout = 500,
				},
				diagnostics = {
					enable = true,
					show_on_dirs = false,
				},
			})
		end,
		keys = {
			{
				"\\",
				"<cmd>NvimTreeFindFileToggle<cr>",
				{ desc = "[T]oggle [E]xplorer" },
			},
		},
	},
}
