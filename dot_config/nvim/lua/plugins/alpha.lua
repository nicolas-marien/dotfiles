return {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup({
			theme = 'hyper',
			config = {
				shortcut = {
					{
						desc = ' Search files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Browse files',
						group = 'Label',
						action = 'Telescope file_browser',
						key = 's',
					},
				},
				week_header = {
					enable = true,
				},
				footer = { "🐾 🐾" },
			}
		})
	end,
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
