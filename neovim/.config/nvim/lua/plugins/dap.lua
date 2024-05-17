return {
  "mxsdev/nvim-dap-vscode-js",
  dependencies = {
    "mfussenegger/nvim-dap",
    {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },
  config = function()
    require("dap-vscode-js").setup({
      debugger_path = os.getenv("HOME") .. "/.local/share/nvim/lazy/vscode-js-debug",
    })

    for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "!**/node_modules/**",
          },
          sourceMaps = true,
        },
        {
          type = "node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          resolveSourceMapLocations = {
            "${workspaceFolder}/dist/**/*.js",
            "!**/node_modules/**",
          },
          sourceMaps = true,
        },
      }
    end
  end,
}
