return {
    setup = function()
        vim.opt.number = true
        vim.opt.mouse = "a"

        vim.opt.expandtab = true
        vim.opt.tabstop = 4
        vim.opt.softtabstop = 4
        vim.opt.shiftwidth = 4

        vim.opt.autoindent = false
        vim.opt.smartindent = true

        vim.opt.fileformat = "unix" -- lf

        vim.opt.splitright = true
        vim.opt.splitbelow = true
    end
}
