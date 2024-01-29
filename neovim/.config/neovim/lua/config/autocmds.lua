-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[autocmd BufNewFile,BufRead .aliases set filetype=bash]])
vim.cmd([[autocmd BufNewFile,BufRead .zshrc set filetype=bash]])
