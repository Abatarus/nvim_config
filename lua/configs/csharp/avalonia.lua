return {
    load_lsp_config = function()
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")
        local avalonia_lsp_bin = os.getenv("USERPROFILE") ..
            "/.vscode/extensions/avaloniateam.vscode-avalonia-0.0.32/avaloniaServer/AvaloniaLanguageServer.dll"
        --local avalonia_lsp_bin =
        --"D:\\work\\AvaloniaVSCode\\src\\AvaloniaLSP\\AvaloniaLanguageServer\\bin\\Debug\\net8.0/AvaloniaLanguageServer.dll"
        local slnparser_bin = os.getenv("USERPROFILE") ..
            "/.vscode/extensions/avaloniateam.vscode-avalonia-0.0.32/solutionParserTool/SolutionParser.dll"
        configs.avalonia = {
            default_config = {
                cmd = { "dotnet", avalonia_lsp_bin },
                filetypes = { "xaml", "axaml" },
                root_dir = function(fname)
                    return lspconfig.util.root_pattern("*.sln")(fname) or vim.fn.getcwd()
                end,
                settings = {},
            },
            on_new_config = function(_, new_root_dir)
                for _, client in pairs(vim.lsp.get_active_clients()) do
                    if client.config.root_dir == new_root_dir then
                        return
                    end
                end
                local sln_file = nil
                local sln_files = require("plenary.scandir").scan_dir({ new_root_dir },
                    { search_pattern = "%.sln$", depth = 1 })
                if sln_files then
                    sln_file = sln_files[1]
                end
                vim.fn.system("dotnet " .. slnparser_bin .. " " .. sln_file)
            end,
        }
    end
}
