local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = { "jdtls", "lua_ls" },
  automatic_installation = true,
})

require("lspconfig").jdtls.setup {}
require("lspconfig").lua_ls.setup {}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

