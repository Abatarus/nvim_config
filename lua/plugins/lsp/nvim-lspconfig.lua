local attach_omnisharp = function(buffer)
    local ext = require('omnisharp_extended')
    vim.keymap.set('n', '<leader>gr', ext.telescope_lsp_references,
    { desc = "Go to references", buffer = buffer, noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gd', function() ext.telescope_lsp_definition({ jump_type = 'vsplit' }) end,
    { desc = "Go to definition", buffer = buffer, noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gD', ext.telescope_lsp_type_definition,
    { desc = "Go to type definition", buffer = buffer, noremap = true, silent = true })
    vim.keymap.set('n', '<leader>gi', ext.telescope_lsp_implementation,
    { desc = "Go to implementation", buffer = buffer, noremap = true, silent = true })
end
return {
    "neovim/nvim-lspconfig",
    after = { "mason-lspconfig", "nvim-cmp" },
    config = function()
        local lspconfig = require("lspconfig")
        local capatibilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.rust_analyzer.setup({
            capatibilities = capatibilities,
        })
        lspconfig.lua_ls.setup({
            capatibilities = capatibilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            vim.api.nvim_get_runtime_file("", true),
                        },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
        lspconfig.omnisharp.setup({
            capatibilities = capatibilities,
            cmd = {
                "dotnet",
                vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll",
            },
            enable_import_completion = true,
            organize_imports_on_format = true,
            enable_roslyn_analyzers = true,

            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
        })
        lspconfig.clangd.setup({
            capatibilities = capatibilities,
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                local buffer = ev.buf
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
                    { desc = "Go to definition", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "K", vim.lsp.buf.hover,
                    { desc = "Hover", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation,
                    { desc = "Go to implementation", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help,
                    { desc = "Signature help", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.type_definition,
                    { desc = "Go to type definition", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,
                    { desc = "Rename symbol", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
                    { desc = "", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({async = true}) end,
                    { desc = "", buffer = buffer, noremap = true, silent = true })

                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client.name == "omnisharp" then
                    attach_omnisharp(buffer)
                end
            end,
        })
    end,
}
