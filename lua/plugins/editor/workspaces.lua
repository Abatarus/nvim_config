return {
    "natecraddock/workspaces.nvim",
    lazy = false,
    opts = {
        hooks = {
            open = { "Telescope find_files" },
        }
    },
    keys = {
        { "<leader>vw", ":Telescope workspaces<CR>", mode = "n", noremap = true, silent = true, desc = "" },
    },
}
