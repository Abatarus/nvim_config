return {
    "nvim-telescope/telescope-media-files.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("media_files")
    end,
}
