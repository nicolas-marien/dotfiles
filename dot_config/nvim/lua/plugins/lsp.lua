return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"b0o/schemastore.nvim",
		},
		config = function()
			require("neodev").setup({ library = { plugins = { "neotest" }, types = true } })
			require("mason").setup()
			require("fidget").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
					"bashls",
					"dockerls",
					"graphql",
					"html",
					"tailwindcss",
					"terraformls",
					"yamlls",
					"jsonls",
					"eslint",
				},
			})
		end,
	},
	{

		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.codespell,
					-- null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.diagnostics.shellcheck,
					-- null_ls.builtins.diagnostics.tsc,
					null_ls.builtins.diagnostics.luacheck,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.beautysh,
					require("typescript.extensions.null-ls.code-actions"),
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

					vim.diagnostic.config({
						signs = {
							active = signs,
						},
						underline = true,
						update_in_insert = false,
						virtual_text = {
							spacing = 4,
							source = "if_many",
							prefix = "●",
							-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
							-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
							-- prefix = "icons",
						},
						severity_sort = true,
					})
				end,
			})
		end,
	},
	{ "dnlhc/glance.nvim", opts = {} },
	{ "VidocqH/lsp-lens.nvim", opts = {} },
	{
		"kosayoda/nvim-lightbulb",
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
		},
		opts = { autocmd = { enabled = true } },
		enabled = false,
	},
	{
		"jose-elias-alvarez/typescript.nvim",
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = {},
	},
}
