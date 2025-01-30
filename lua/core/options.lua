vim.g.mapleader= " "
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.mousefocus = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 8

vim.opt.autoindent = false
vim.opt.smartindent = true

vim.opt_global.fileformat = "unix" -- lf

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.opt.spell = true
vim.opt.spelllang = "en,ru";
vim.cmd[[let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spel']]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.timeoutlen = 1000

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none"})
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none"})
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
    },
})
