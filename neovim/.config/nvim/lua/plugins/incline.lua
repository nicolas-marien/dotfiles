return {
  "b0o/incline.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local plugin = require("incline")
    local get_icon_color = require("nvim-web-devicons").get_icon_color
    local get_buf_option = vim.api.nvim_buf_get_option

    plugin.setup({
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        local modified = get_buf_option(props.buf, "modified") and "⦁" or ""
        local filetype_icon, color = get_icon_color(filename)
        return {
          { filetype_icon, guifg = color },
          { " " },
          { filename },
          { " " },
          { modified, guifg = "grey" },
        }
      end,
    })
  end,
}
