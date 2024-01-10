vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>p", function() vim.cmd.Git("push") end)

-- rebase always
vim.keymap.set("n", "<leader>P", function() vim.cmd.Git({ "pull", "--rebase" }) end)

-- NOTE: It allows me to easily set the branch i am pushing and any tracking
-- needed if i did not set the branch up correctly
vim.keymap.set("n", "<leader>t", ":Git push -u origin ")
