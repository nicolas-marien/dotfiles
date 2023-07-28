return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 20,
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>lz",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
				lazygit:toggle()
			end,
			{ desc = "[L]azygit", noremap = true, silent = true },
		},
	},
}
