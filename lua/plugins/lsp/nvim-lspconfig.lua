return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.rust_analyzer.setup({})

        lspconfig.omnisharp.setup({
            cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        })

        lspconfig.clangd.setup({})
    end,
}
