return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
        require("lspsaga").setup({
            lightbulb = {
                enable = false
            }
        })
        vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>", {desc = "Toggle [O]utline"})
        vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", {desc = "[C]ode [A]ction"})
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {desc = "[R]e[N]ame"})
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

    end,
    dependencies = { {"nvim-tree/nvim-web-devicons"} }
}
