return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    lazy = false,
    after = "catppuccin",
    priority = 500,
    opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
        end
    end,
    keys = {
        { "<TAB>", ":BufferLineCycleNext<CR>", mode = "n", noremap = true, silent = true, desc = "Cycle to next buffer" },
        { "<S-TAB>", ":BufferLineCyclePrev<CR>", mode = "n", noremap = true, silent = true, desc = "Cycle to previous buffer" },
        { "<leader>co", ":BufferLineCloseOthers<CR>", mode = "n", noremap = true, silent = true, desc = "" },
        { "<leader>cc", ":bd<CR> | :bn<CR>", mode = "n", noremap = true, silent = true, desc = "" },
    }
}

