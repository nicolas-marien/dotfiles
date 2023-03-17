return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        'kkharji/sqlite.lua', 'nvim-telescope/telescope.nvim'
        -- {'ibhagwan/fzf-lua'},
    },
    config = function()
        require('neoclip').setup({ enable_persistent_history = true })
        require('telescope').load_extension('neoclip')
    end
}
