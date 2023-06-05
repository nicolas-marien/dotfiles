return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					env = { ENVIRONMENT = "test" },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
		vim.keymap.set(
			"n",
			"<leader>tf",
			"<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>",
			{ desc = "[T]rigger test for current [F]ile" }
		)
		vim.keymap.set(
			"n",
			"<leader>tt",
			"<cmd>lua require'neotest'.run.run()<cr>",
			{ desc = "[T]rigger test for current [T]est" }
		)
	end,
}
