return {
    "echasnovski/mini.surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    lazy = false,
    opts = {
        mappings = {
            add = keymap.surrounding_add, -- Add surrounding in Normal and Visual modes
            delete = keymap.surrounding_delete, -- Delete surrounding
            find = keymap.surrounding_find, -- Find surrounding (to the right)
            find_left = keymap.surrounding_find_left, -- Find surrounding (to the left)
            highlight = keymap.surrounding_highlight, -- Highlight surrounding
            replace = keymap.surrounding_replace, -- Replace surrounding
            update_n_lines = keymap.surrounding_update_n_lines, -- Update `n_lines`
        },
    },
}
