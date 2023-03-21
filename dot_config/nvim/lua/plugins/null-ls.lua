return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.diagnostics.tsc,
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.beautysh,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(filterClient)
									return filterClient.name == "null-ls"
								end,
							})
						end,
					})
				end
				local signs = {
					{ name = "DiagnosticSignError", text = "" },
					{ name = "DiagnosticSignWarn", text = "" },
					{ name = "DiagnosticSignHint", text = "" },
					{ name = "DiagnosticSignInfo", text = "" },
				}

				for _, sign in ipairs(signs) do
					vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
				end
				local config = {
					virtual_text = true,
					-- enables lsp_lines but we want to start disabled
					virtual_lines = false,
					-- show signs
					signs = {
						active = signs,
					},
					update_in_insert = true,
					underline = true,
					severity_sort = true,
					float = {
						focus = false,
						focusable = false,
						style = "minimal",
						border = "rounded",
						source = "always",
						header = "",
						prefix = "",
					},
				}

				vim.diagnostic.config(config)
			end,
		})
	end,
}
