return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        'j-hui/fidget.nvim',

        -- Additional lua configuration, makes nvim stuff amazing
        'folke/neodev.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind.nvim',
        'rafamadriz/friendly-snippets'
    },
    config = function()
        require('neodev').setup()
        require('mason').setup()
        require('fidget').setup()
        require 'mason-lspconfig'.setup {
            ensure_installed = { 'lua_ls', 'tsserver', 'cssls', 'bashls', 'docker_compose_language_service', 'dockerls',
                'graphql', 'html', 'remark_ls', 'tailwindcss', 'terraformls', 'yamlls' }
        }
    end
}
