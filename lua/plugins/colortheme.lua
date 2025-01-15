return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- theme
    lazy = false,
    config = function()
        require("catppuccin").setup()
        vim.cmd[[colorscheme catppuccin]]
    end,
}
