return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.lua_format,
                null_ls.builtins.formatting.prettierd.with({
                    condition = function(utils)
                        return utils.has_file({ ".prettierrc*" })
                    end,
                }),
            },
            on_attach = function(client)
                if client.server_capabilities.documentFormattingProvider then
                    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 4000 })")
                end
            end
        })
    end
}
