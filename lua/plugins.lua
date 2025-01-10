return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- theme
    { "Wansmer/langmapper.nvim", name="langmapper", priority = 1}, -- normal mode in ru keymap
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"}
}
