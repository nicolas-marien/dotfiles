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
