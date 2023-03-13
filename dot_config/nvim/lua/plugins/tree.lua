return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        "node_modules",
                        ".git",
                        ".husky"
                    }
                }
            }
        })
    end,
    keys = {
        {
            "\\", "<cmd>Neotree toggle reveal<cr>", { desc = "[T]oggle [E]xplorer" }
        }
    }
}
