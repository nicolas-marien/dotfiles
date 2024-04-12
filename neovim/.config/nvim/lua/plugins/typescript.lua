return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    code_lens = "all",
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
    },
  },
}
