return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha ]])
            vim.g.nicolas_colorscheme = "catppuccin"
        end
    }, {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme kanagawa]])

            vim.g.nicolas_colorscheme = "kanagawa"

            require('kanagawa').setup({
                colors = {theme = {all = {ui = {bg_gutter = "none"}}}},
                overrides = function(colors) -- add/modify highlights
                    local theme = colors.theme
                    return {
                        Pmenu = {fg = theme.ui.shade0, bg = theme.ui.bg_p1},
                        PmenuSel = {fg = "NONE", bg = theme.ui.bg_p2},
                        PmenuSbar = {bg = theme.ui.bg_m1},
                        PmenuThumb = {bg = theme.ui.bg_p2},
                        BiscuitColor = {fg = colors.palette.fujiGray}
                    }
                end
            })
        end
    }, {'rose-pine/neovim', name = 'rose-pine'}
}
