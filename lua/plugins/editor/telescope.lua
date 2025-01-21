local separator = package.config:sub(1, 1)
return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "%.dll$",
                "%.pdb$",
                "%.cm$",
                "%.bhc$",
                "%.obj$",
                "%.meta$",
                "%.prefab$",
                "%.asmdef$",
                "%.unity$",
                "%.asset$",
                "%.expr$",
                "%.exr$",
                "%.amin$",
                "%.lighting$",
                "%.controller$",
                "%.overrideController$",
                "%.mat$",
                "%.FBX$",
                "%.jpg",
                "%.bmp",
                "Packages",
                "PackageChache",
                "Library" .. separator,
                "obj" .. separator,
                ".git" .. separator,
                ".github" .. separator,
                ".vs" .. separator,
            },
        },
        extensions = {
            workspaces = {
                keep_insert = true,
                path_hl = "String",
            },
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                -- find command (defaults to `fd`)
                find_cmd = "fd",
                preview_cmd = "chafa",
            },
        },
    },
keys = {
    { keymap.find_files, function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
    { keymap.live_grep, function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
    { keymap.find_buffers, function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
    { keymap.find_help, function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
},
}
