return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      local plugin = require("kanagawa")

      plugin.setup({
        overrides = function(colors)
          local theme_colors = colors.theme
          return {
            InclineNormal = {
              fg = theme_colors.ui.fg,
              bg = theme_colors.ui.bg_gutter,
              italic = true,
            },
          }
        end,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        neotest = true,
        notify = true,
        which_key = true,
      },
    },
  },
  { "folke/twilight.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
