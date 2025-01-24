return {
    "mfussenegger/nvim-dap",
    keys = {
        { keymap.debug_continue, require("dap").continue, desc = "DAP Continue" },
        { keymap.debug_step_over, require("dap").step_over, desc = "DAP Step Over" },
        { keymap.debug_step_into, require("dap").step_into, desc = "DAP Step Into" },
        { keymap.debug_step_out, require("dap").step_out, desc = "DAP Step Out" },
        { keymap.debug_toggle_breakpoint, require("dap").toggle_breakpoint, desc = "DAP Toggle Breakpoint" },
        { keymap.debug_set_condotional_breakpoint,
            function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
            desc = "DAP Set Conditional Breakpoint" },
        { keymap.debug_set_log_point,
            function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
            desc = "DAP Set Log Point" },
        { keymap.debug_repl, require("dap").repl.open, desc = "DAP Open REPL" },
        { keymap.debug_run_last, require("dap").run_last, desc = "DAP Run Last" },
    },
    config = function()
        local dap = require("dap")
        dap.adapters.coreclr = require("configs.csharp.debug").adapter_config
        dap.configurations.cs = { require("configs.csharp.debug").config }
        dap.configurations.csproj =  { require("configs.csharp.debug").config }
        dap.configurations.axaml = { require("configs.csharp.debug").config }
    end,
}
