local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "oxfmt" },
    html = { "oxfmt" },
    json = { "oxfmt" },
    java = { "clang-format" },
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    python = { "black" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
