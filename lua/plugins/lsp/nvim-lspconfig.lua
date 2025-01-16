return {
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig",
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
            cmd = { vim.fn.stdpath "data" .. "/mason/bin/OmniSharp.cmd" },
            enable_import_completion = true,
            organize_imports_on_format = true,
            enable_roslyn_analyzers = true,
            root_dir = function ()
                return vim.loop.cwd() -- current working directory
            end,
        })
        lspconfig.clangd.setup({
            capatibilities = capatibilities,
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- TODO
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
                vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>lf", 
                function()
                    vim.lsp.buf.format({async = true})
                end,
                opts)
            end,
        })
    end,
}
