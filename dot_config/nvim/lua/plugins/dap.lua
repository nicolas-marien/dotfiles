return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "folke/neodev.nvim" },
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {},
		config = function()
			local dap = require("dap")
			dap.adapters.node = {
				type = "executable",
				command = "node-debug2-adapter",
				args = {},
			}
		end,
	},
	{
		"ldelossa/nvim-dap-projects",
		config = function()
			require("nvim-dap-projects").search_project_config()
		end,
	},
}
