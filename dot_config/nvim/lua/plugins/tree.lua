return {
	{

		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
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
				sources = {
					"filesystem",
					"buffers",
					"document_symbols",
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
		event = "VeryLazy",
		keys = {
			{
				"\\",
				"<cmd>Neotree toggle reveal<cr>",
				{ desc = "[T]oggle [E]xplorer" },
			},
		},
	},
}
