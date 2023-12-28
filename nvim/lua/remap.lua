vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Lexplore)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>an", vim.cmd.A)
vim.keymap.set("n", "<leader>dg", vim.cmd.Dox)
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
