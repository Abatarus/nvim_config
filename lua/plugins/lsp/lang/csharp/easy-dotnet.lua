return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
    after = "nvim-lspconfig",
    opts = {
        test_runner = {
            icons = {
                passed = "",
                skipped = "",
                failed = "",
                success = "",
                reload = "",
                test = "",
                sln = "󰘐",
                project = "󰘐",
                dir = "",
                package = "",
            },
        },
    },
}
