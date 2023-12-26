require('lint').linters_by_ft = {
  cpp = {'cppcheck', 'cpplint'},
  html = {'tidy'},
  lua = {'luacheck'},
  markdown = {'vale'},
  python = {'pylint'},
  sh = {'shellcheck'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})