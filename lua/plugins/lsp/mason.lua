return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "omnisharp",
                "clangd",
            },
        },
    },
}
