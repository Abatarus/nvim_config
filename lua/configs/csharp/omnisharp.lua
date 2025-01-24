return {
    on_attach = function(buffer)
        local ext = require('omnisharp_extended')
        vim.keymap.set('n', keymap.go_to_references, ext.telescope_lsp_references,
            { desc = "Go to references", buffer = buffer, noremap = true, silent = true })
        vim.keymap.set('n', keymap.go_to_definition,
            function() ext.telescope_lsp_definition({ jump_type = 'vsplit' }) end,
            { desc = "Go to definition", buffer = buffer, noremap = true, silent = true })
        vim.keymap.set('n', keymap.go_to_type_definition, ext.telescope_lsp_type_definition,
            { desc = "Go to type definition", buffer = buffer, noremap = true, silent = true })
        vim.keymap.set('n', keymap.go_to_implementation, ext.telescope_lsp_implementation,
            { desc = "Go to implementation", buffer = buffer, noremap = true, silent = true })
    end,
}
