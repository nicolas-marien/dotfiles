return {
	'romgrk/barbar.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require'bufferline'.setup{
			icon_pinned = ''
		}
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
		map('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
		map('n', '<leader>bp', '<Cmd>BufferPin<CR>', opts)
		-- Close buffer
		map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
		map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
	end
}
