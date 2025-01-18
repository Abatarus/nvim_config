return {
    "mfussenegger/nvim-dap",
    keys = {
        { keymap.debug_continue, require("dap").continue,                                                                     desc = "DAP Continue" },
        { keymap.debug_step_over, require("dap").step_over,                                                                    desc = "DAP Step Over" },
        { keymap.debug_step_into, require("dap").step_into,                                                                    desc = "DAP Step Into" },
        { keymap.debug_step_out, require("dap").step_out,                                                                     desc = "DAP Step Out" },
        { keymap.debug_toggle_breakpoint, require("dap").toggle_breakpoint,                                           desc = "DAP Toggle Breakpoint" },
        { keymap.debug_set_condotional_breakpoint, function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,        desc = "DAP Set Conditional Breakpoint" },
        { keymap.debug_set_log_point, function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "DAP Set Log Point" },
        { keymap.debug_repl, require("dap").repl.open,                                                                    desc = "DAP Open REPL" },
        { keymap.debug_run_last, require("dap").run_last,                                                                     desc = "DAP Run Last" },
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
