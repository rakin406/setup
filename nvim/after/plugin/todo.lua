vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>xt", vim.cmd.TodoTrouble)
vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope)
