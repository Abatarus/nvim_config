return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    after = { "mason-lspconfig", "nvim-cmp" },
    config = function()
        local capatibilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        require("configs.csharp.avalonia").load_lsp_config()
        lspconfig.avalonia.setup({
            capatibilities = capatibilities,
        })
        lspconfig.rust_analyzer.setup({
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
                vim.keymap.set("n", keymap.go_to_definition, vim.lsp.buf.definition,
                    { desc = "Go to definition", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.lsp_hover, vim.lsp.buf.hover,
                    { desc = "Hover", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.go_to_implementation, vim.lsp.buf.implementation,
                    { desc = "Go to implementation", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.lsp_signature_help, vim.lsp.buf.signature_help,
                    { desc = "Signature help", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.go_to_type_definition, vim.lsp.buf.type_definition,
                    { desc = "Go to type definition", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.lsp_rename, vim.lsp.buf.rename,
                    { desc = "Rename symbol", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set({ "n", "v" }, keymap.lsp_code_action, vim.lsp.buf.code_action,
                    { desc = "Lsp code action", buffer = buffer, noremap = true, silent = true })
                vim.keymap.set("n", keymap.lsp_format_files, function() vim.lsp.buf.format({ async = true }) end,
                    { desc = "Lsp format file", buffer = buffer, noremap = true, silent = true })

                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client.name == "omnisharp" then
                    require("configs.csharp.omnisharp").on_attach(buffer)
                end
            end,
        })
    end,
}
