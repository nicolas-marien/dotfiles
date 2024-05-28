return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keymaps = {
    {
      "n",
      "<leader>fo",
      function()
        require("oil").open_float()
      end,
      { remap = true },
    },
  },
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    })
  end,
}
