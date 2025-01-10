vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = false
vim.opt.smartindent = false

vim.opt.fileformat = "unix" -- lf

vim.opt.splitright = true
vim.opt.splitbelow = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- theme
    { "Wansmer/langmapper.nvim", name="langmapper", priority = 1}, -- normal mode in ru keymap
}
local opts = {}

require("lazy").setup(plugins, opts)
require("catppuccin").setup()
require("langmapper").setup()
vim.cmd.colorscheme "catppuccin"
