return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,
    opts = {
        filesistem = {
            folow_current_file = true,
            hijack_netrw = true,
        },
    },
    keys = {
        { "<leader>vt", ":Neotree<CR>", mode = "n", noremap = true, silent = true, desc = "" },
    },
}
