return {
    'windwp/nvim-spectre',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require 'spectre'.setup {}

        vim.keymap.set('n', '<leader>Sw', "<cmd>lua require('spectre').open_visual({select_word=true})", { desc = '[S]earch [W]ord using spectre' })
    end
}
