return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {},
    keys = {
        { "<TAB>", ":BufferLineCycleNext<CR>", mode = "n", noremap = true, silent = true, desc = "Cycle to next buffer" },
        { "<S-TAB>", ":BufferLineCyclePrev<CR>", mode = "n", noremap = true, silent = true, desc = "Cycle to previous buffer" },
        { "<leader>cl", ":BufferLineCloseLeft<CR>", mode = "n", noremap = true, silent = true, desc = "" },
        { "<leader>cr", ":BufferLineCloseRight<CR>", mode = "n", noremap = true, silent = true, desc = "" },
        { "<leader>co", ":BufferLineCloseOthers<CR>", mode = "n", noremap = true, silent = true, desc = "" },
    }
}

