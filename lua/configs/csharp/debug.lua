return {
    adapter_config = {
        type = "executable",
        command = require("mason-registry").get_package("netcoredbg"):get_install_path() .. "/netcoredbg/netcoredbg",
        args = { "--interpreter=vscode" },
        options = { detached = false, },

    },
    config = {
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
