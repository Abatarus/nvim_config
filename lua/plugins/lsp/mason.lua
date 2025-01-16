return {
    {
        "williamboman/mason.nvim",
        name = "mason",
        lazy = false,
        priority = 2,
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        name = "mason-lspconfig",
        after = "mason",
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
