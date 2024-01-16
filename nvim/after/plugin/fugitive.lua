vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>p", function() vim.cmd.Git("push") end)

-- Rebase always
vim.keymap.set("n", "<leader>P", function() vim.cmd.Git("pull --rebase") end)

-- This allows me to easily set the branch I am pushing and any tracking needed
-- if I did not set the branch up correctly.
vim.keymap.set("n", "<leader>t", ":Git push -u origin ")
