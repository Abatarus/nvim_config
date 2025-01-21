return {
    "echasnovski/mini.surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    lazy = false,
    opts = {
        mappings = {
            add = "gza", -- Add surrounding in Normal and Visual modes
            delete = "gzd", -- Delete surrounding
            find = "gzf", -- Find surrounding (to the right)
            find_left = "gzF", -- Find surrounding (to the left)
            highlight = "gzh", -- Highlight surrounding
            replace = "gzr", -- Replace surrounding
            update_n_lines = "gzn", -- Update `n_lines`
        },
    },
}
