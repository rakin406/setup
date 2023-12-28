local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>p', builtin.git_files, {})

telescope.load_extension('yank_history')

vim.keymap.set('n', '<leader>y', function()
  telescope.extensions.yank_history.yank_history()
end)
