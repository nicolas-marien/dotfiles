return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("config.kanagawa")
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },
  { "folke/twilight.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
