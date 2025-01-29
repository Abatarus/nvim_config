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
    {
        "jay-babu/mason-nvim-dap.nvim",
        name = "mason-dap",
        after = "mason",
        opts = {
            ensure_installed = {
                "coreclr",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        name = "mason-tools",
        opts = {
            ensure_installed = {
                "csharpier",
                "stylua",
            }
        },
    },
}
