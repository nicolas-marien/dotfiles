return {
  {
    "pmizio/typescript-tools.nvim",
    -- enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local plugin = require("typescript-tools")
      plugin.setup({
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = false,
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          },
        },
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     -- set default server config to use nvim-vtsls one, which would allow use to use the plugin
  --     require("lspconfig.configs").vtsls = require("vtsls").lspconfig
  --
  --     -- ---@type lspconfig.options.vtsls
  --     opts.servers.vtsls = {
  --       -- you can view all keys here: https://github.com/yioneko/nvim-vtsls#commands
  --       -- this keymaps will only appear at the lsp filetype (TypeScript, JavaScript). So they won't interfere with your other keymaps
  --       keys = {
  --         {
  --           "<leader>co",
  --           function()
  --             require("vtsls").commands.organize_imports(0)
  --           end,
  --           desc = "Organize Imports",
  --         },
  --         {
  --           "<leader>cM",
  --           function()
  --             require("vtsls").commands.add_missing_imports(0)
  --           end,
  --           desc = "Add missing imports",
  --         },
  --         {
  --           "<leader>cD",
  --           function()
  --             require("vtsls").commands.fix_all(0)
  --           end,
  --           desc = "Fix all diagnostics",
  --         },
  --         {
  --           "<leader>cLL",
  --           function()
  --             require("vtsls").commands.open_tsserver_log()
  --           end,
  --           desc = "Open Vtsls Log",
  --         },
  --         {
  --           "<leader>cR",
  --           function()
  --             require("vtsls").commands.rename_file(0)
  --           end,
  --           desc = "Rename File",
  --         },
  --         {
  --           "<leader>cu",
  --           function()
  --             require("vtsls").commands.file_references(0)
  --           end,
  --           desc = "Show File Uses(References)",
  --         },
  --         {
  --           "<leader>ctc",
  --           function()
  --             require("vtsls").commands.goto_project_config(0)
  --           end,
  --           desc = "Open Project Config",
  --         },
  --       },
  --       settings = {
  --         vtsls = {
  --           autoUseWorkspaceTsdk = true,
  --         },
  --         javascript = {
  --           format = {
  --             indentSize = vim.o.shiftwidth,
  --             convertTabsToSpaces = vim.o.expandtab,
  --             tabSize = vim.o.tabstop,
  --           },
  --           -- enables inline hints
  --           inlayHints = {
  --             parameterNames = { enabled = "literals" },
  --             parameterTypes = { enabled = true },
  --             variableTypes = { enabled = false },
  --             propertyDeclarationTypes = { enabled = true },
  --             functionLikeReturnTypes = { enabled = false },
  --             enumMemberValues = { enabled = true },
  --           },
  --           -- otherwise it would ask every time if you want to update imports, which is a bit annoying
  --           updateImportsOnFileMove = {
  --             enabled = "always",
  --           },
  --           -- cool feature, but increases ram usage
  --           -- referencesCodeLens = {
  --           --   enabled = true,
  --           --   showOnAllFunctions = true,
  --           -- },
  --         },
  --         typescript = {
  --           format = {
  --             indentSize = vim.o.shiftwidth,
  --             convertTabsToSpaces = vim.o.expandtab,
  --             tabSize = vim.o.tabstop,
  --           },
  --           updateImportsOnFileMove = {
  --             enabled = "always",
  --           },
  --           inlayHints = {
  --             parameterNames = { enabled = "literals" },
  --             parameterTypes = { enabled = true },
  --             variableTypes = { enabled = false },
  --             propertyDeclarationTypes = { enabled = true },
  --             functionLikeReturnTypes = { enabled = false },
  --             enumMemberValues = { enabled = true },
  --           },
  --           -- enables project wide error reporting similar to vscode
  --           tsserver = {
  --             experimental = {
  --               enableProjectDiagnostics = true,
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     {
  --       "yioneko/nvim-vtsls",
  --       handlers = {},
  --     },
  --   },
  -- },
}
