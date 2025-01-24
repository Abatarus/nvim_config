return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            axamlformatter = {
                inherit = false,
                command = vim.fn.stdpath("data") .. "/mason/bin/xmlformat.cmd",
                args = {
                    "--indent", tostring(vim.opt.tabstop:get()),
                    "--indent-char", " ",
                    "--preserve-attributes",
                },
                stdin = true,
                timeout = 5000,
            },
        },
        formatters_by_ft = {
            lua = { "stylua", },
            cs = { "csharpier", },
            axaml = { "axamlformatter", },
        },
    },
}
