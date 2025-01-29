return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            axamlformatter = require("configs.csharp.avalonia").get_formatter_config(),
        },
        formatters_by_ft = {
            lua = { "stylua", },
            cs = { "csharpier", },
            axaml = { "axamlformatter", },
        },
    },
    keys = {
        {
            keymap.format_file,
            function()
                require("conform").format(
                    { asyn = false, lsp_fallback = true},
                    require("utils.formatter_callback").callback)
            end,
            desc = "Format by conform",
        }
    },
}
