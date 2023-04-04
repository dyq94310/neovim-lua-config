-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")
require("lspconfig").jdtls.setup({
	init_options = {
		bundles = {
			vim.fn.glob(
				"~/.local/share/nvim/mason/packages/java-test/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
			vim.fn.glob("~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar", 1),
		},
	},
	on_attach = function(client, buffer)
		on_attach(client, buffer)
		--		require("jdtls").setup_dap({ hotcodereplace = "auto" })
--	 require("jdtls.setup").add_commands()
	end,
})


require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
})
require("lspconfig").bashls.setup({})

require'lspconfig'.pylsp.setup{}


mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
mason_lspconfig.setup({
	ensure_installed = { "bashls", "jdtls", "jsonls", "lua_ls" },
	automatic_installation = true,
})
