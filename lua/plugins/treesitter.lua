return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "lua",
            "c_sharp",
            "markdown",
            "markdown_inline",
            "xml",
            "rust",
            "c",
            "cpp",
            "toml",
            "json"
        },
    }
}
