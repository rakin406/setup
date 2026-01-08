require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>tt", require("base46").toggle_transparency, { desc = "Toggle transparency" })
