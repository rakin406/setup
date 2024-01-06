vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete and paste without losing yank register
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "Q", "<Nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ch", "<cmd>!chmod +x %<CR>", { silent = true })

-- Plugin shortcuts
-- I didn't put them in separate modules because they are one lines.
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>mt", vim.cmd.MarkdownPreviewToggle)
vim.keymap.set("n", "<leader>dg", vim.cmd.Dox)
vim.keymap.set("n", "<leader>x", function() require("trouble").toggle() end)
