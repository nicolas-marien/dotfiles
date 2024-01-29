return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    local plugin = require("ufo")

    plugin.setup({})
    vim.keymap.set("n", "zR", plugin.openAllFolds)
    vim.keymap.set("n", "zM", plugin.closeAllFolds)
  end,
}
