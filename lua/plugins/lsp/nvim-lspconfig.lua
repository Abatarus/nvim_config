return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.rust_analyzer.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.omnisharp.setup({
            cmd = { vim.fn.stdpath "data" .. "/mason/bin/OmniSharp.cmd" },
            enable_import_completion = true,
            organize_imports_on_format = true,
            enable_roslyn_analyzers = true,
            root_dir = function ()
                return vim.loop.cwd() -- current working directory
            end,
        })
        lspconfig.clangd.setup({})
    end,
}
