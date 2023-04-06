return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- NOTE: see https://github.com/Strazil001/Nvim/blob/main/after/plugin/lualine.lua for the helper functions
		local modes = {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
			separator = { left = "", right = "" },
		}

		local function getLspName()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return "  " .. client.name
				end
			end
			return "  " .. msg
		end

		local dia = {
			"diagnostics",
			separator = { left = "", right = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = "", right = "" },
		}

		local vim_icons = {
			function()
				return " "
			end,
			separator = { left = "", right = "" },
		}

		local space = {
			function()
				return " "
			end,
		}

		local filename = {
			"filename",
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			separator = { left = "", right = "" },
		}

		local fileformat = {
			"fileformat",
			separator = { left = "", right = "" },
		}

		local encoding = {
			"encoding",
			separator = { left = "", right = "" },
		}

		local branch = {
			"branch",
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			separator = { left = "", right = "" },
		}
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = vim.g.nicolas_colorscheme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
			},

			sections = {
				lualine_a = {
					--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
					modes,
					vim_icons,
					--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
				},
				lualine_b = {
					space,
					dia,
				},
				lualine_c = {

					filename,
					filetype,
					space,
					branch,
					diff,
				},
				lualine_x = {
					space,
				},
				lualine_y = {
					encoding,
					fileformat,
					space,
				},
				lualine_z = {
					lsp,
				},
			},
		})
	end,
}
