return {
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                current_line_blame = true,
                signs = {
                    add = { text = '·' },
                    change = { text = '·' },
                    delete = { text = '·' },
                    topdelete = { text = '·' },
                    changedelete = { text = '·' },
                },
            }
        end
    },
    {
        'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'
    }

}
