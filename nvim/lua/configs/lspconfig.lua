require("mason-lspconfig").setup()

local servers = require("mason-lspconfig").get_installed_servers()

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
  vim.lsp.enable(server)
end
