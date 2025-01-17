return {
    "mfussenegger/nvim-dap",
    keys = {
        { "<F5>",       require("dap").continue,                                                                     desc = "DAP Continue" },
        { "<F10>",      require("dap").step_over,                                                                    desc = "DAP Step Over" },
        { "<F11>",      require("dap").step_into,                                                                    desc = "DAP Step Into" },
        { "<F12>",      require("dap").step_out,                                                                     desc = "DAP Step Out" },
        { "<leader>b",  function() require("dap").toggle_breakpoint() end,                                           desc = "DAP Toggle Breakpoint" },
        { "<leader>B",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,        desc = "DAP Set Conditional Breakpoint" },
        { "<leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "DAP Set Log Point" },
        { "<leader>dr", require("dap").repl.open,                                                                    desc = "DAP Open REPL" },
        { "<leader>dl", require("dap").run_last,                                                                     desc = "DAP Run Last" },
    },
    config = function()
        local dap = require("dap")
        dap.adapters.coreclr = {
            type = "executable",
            command = require("mason-registry").get_package("netcoredbg"):get_install_path() .. "/netcoredbg/netcoredbg",
            args = { "--interpreter=vscode" },
            options = { detached = false, },
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    local stat = vim.loop.fs_stat(vim.fn.getcwd() .. "/Output")
                    local path = vim.fn.getcwd() .. '/';
                    if stat and stat.type == "directory" then
                        path = path .. "Output/Debug/net6.0/"
                    end
                    return vim.fn.input('Path to dll', path, 'file')
                end,
            },
        }
    end,
}
