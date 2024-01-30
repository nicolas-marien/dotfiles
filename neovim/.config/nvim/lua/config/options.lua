-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local signs = {
  { name = "DiagnosticSignError", text = "󰚌" },
  { name = "DiagnosticSignWarn", text = "󰢚" },
  { name = "DiagnosticSignHint", text = "󰄛" },
  { name = "DiagnosticSignInfo", text = "󰩃" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.opt.laststatus = 3
