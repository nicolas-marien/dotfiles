return {
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local plugin = require("typescript-tools")
      plugin.setup({
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          },
        },
      })
    end,
  },
}
