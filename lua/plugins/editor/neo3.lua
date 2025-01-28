return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,
    opts = {
        filesystem = {
            close_if_last_window = false,
            folow_current_file = true,
            hijack_netrw = true,
            bind_to_cwd = true,
            cwd_target = {
                allow_outside_cwd = false,
            },
            filtered_items = {
                hide_gitignored = true,
                hide_by_name = {
                    "obj",
                },
                hide_by_pattern = {
                    "*.meta",
                },
            },
            window = {
                mappings = {
                    ["R"] = "easy",
                },
            },
        },
        commands = {
            ["easy"] = function(state)
                local node = state.tree:get_node()
                local path = node == "directory" and node.path or vim.fs.dirname(node.path)
                require("easy-dotnet").create_new_item(path, function()
                    require("neo-tree.sources.manager").refresh(state.name)
                end)
            end,
        },
    },
    keys = {
        { keymap.view_tree, ":Neotree toggle<CR>", mode = "n", noremap = true, silent = true, desc = "View tree" },
    },
}
