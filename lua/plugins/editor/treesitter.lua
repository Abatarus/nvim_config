return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
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
            "json",
            "sql",
        },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- Регистрируем парсер 'xml' для файлов с типом 'axaml'
      vim.treesitter.language.register("xml", "axaml")
    end,
}
