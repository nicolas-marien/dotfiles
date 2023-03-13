return {
    'vuki656/package-info.nvim',
    config = function ()
        require'package-info'.setup{}
        vim.keymap.set("n", "<leader>no", "<cmd>lua require('package-info').show()<cr>", { desc = "[N]pm [O]utdated" })
    end
}
