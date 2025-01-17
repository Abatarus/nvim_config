-- Registers
vim.keymap.set("v", "<leader>P", '"*p', { desc = "Paste from system buffer" })
vim.keymap.set("v", "<leader>Y", '"*y', { desc = "Copy to system buffer" })
vim.keymap.set("v", "<leader>p", '"Ap', { desc = "Paste from local buffer" })
vim.keymap.set("v", "<leader>y", '"Ay', { desc = "Copy to local buffer" })

-- Neo-tree

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")
