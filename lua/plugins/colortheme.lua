return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- theme
    lazy = false,
    opts = {
        flavour = "mocha",
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            telescope = true,
            treesitter = true,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        }
    },
}
