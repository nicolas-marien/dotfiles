return {
    'code-biscuits/nvim-biscuits',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require 'nvim-biscuits'.setup {
            cursor_line_only = true,
            default_config = {
                max_length = 12,
                min_distance = 5,
                prefix_string = " "
            }
        }
    end
}
