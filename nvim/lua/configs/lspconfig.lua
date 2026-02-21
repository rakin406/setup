-- Auto setup any LSP installed in Mason
require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler
    require("lspconfig")[server_name].setup {}
  end,
}
