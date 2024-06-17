return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return string.match(name, ".git")
        end,
      },
    })

    vim.keymap.set("n", "-", function()
      require("oil").open_float()
    end, { remap = true })
  end,
}
