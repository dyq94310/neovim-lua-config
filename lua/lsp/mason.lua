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
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- nvim-dap
	vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", opt)
	vim.keymap.set("n", "<F6>", ":lua require'dap'.step_over()<CR>", opt)
	vim.keymap.set("n", "<F7>", ":lua require'dap'.step_into()<CR>", opt)
	vim.keymap.set("n", "<F8>", ":lua require'dap'.step_out()<CR>", opt)
	vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opt)
	vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
	vim.keymap.set(
		"n",
		"<leader>dp",
		":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
		opt
	)
	vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opt)
	vim.keymap.set("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opt)
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
