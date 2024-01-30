return {
  "nvim-neotest/neotest",
  dependencies = {
    "haydenmeade/neotest-jest",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          env = { ENVIRONMENT = "test" },
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,

          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
