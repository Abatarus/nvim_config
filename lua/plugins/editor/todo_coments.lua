return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },
    keys = {
        { keymap.trouble_todo,"<cmd>Trouble todo<CR>",  desc = "Trouble todo" },
        { keymap.find_todo,"<cmd>TodoTelescope<CR>",  desc = "Telescope todo" },
    },
}
