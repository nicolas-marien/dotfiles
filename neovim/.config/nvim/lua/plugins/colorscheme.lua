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
      transparent_background = true,
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        neotest = true,
        notify = true,
        which_key = true,
        native_lsp = {
          inlay_hints = {
            background = false,
          },
        },
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
