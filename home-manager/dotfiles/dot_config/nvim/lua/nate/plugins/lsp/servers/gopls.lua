return {
  require("lspconfig")["gopls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
}
