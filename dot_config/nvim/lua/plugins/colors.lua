return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha ]])
			vim.g.nicolas_colorscheme = "catppuccin"
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			local BG = "#17191c"
			local FADED_GRAY = "#33373a"
			require("kanagawa").setup({
				background = { light = "lotus", dark = "wave" },
				colors = {
					theme = { all = { ui = { bg_gutter = "none" } } },
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						BiscuitColor = { fg = colors.palette.fujiGray },
						DiagnosticError = { bg = colors.palette.winterRed },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

						GitSignsAdd = { fg = colors.palette.waveAqua2 },
						GitSignsAddNr = { fg = colors.palette.waveAqua2 },
						GitSignsAddLn = { fg = colors.palette.waveAqua2 },
						GitSignsChange = { fg = colors.palette.surimiOrange },
						GitSignsChangeNr = { fg = colors.palette.surimiOrange },
						GitSignsChangeLn = { fg = colors.palette.surimiOrange },
						GitSignsCurrentLineBlame = { fg = FADED_GRAY },
					}
				end,
			})

			vim.cmd([[colorscheme kanagawa-dragon]])
			vim.g.nicolas_colorscheme = "kanagawa"
		end,
	},
}
