local lsp = require('lsp-zero').preset({})

-- lsp.on_attach(function(client, bufnr)
--   lsp.default_keymaps({buffer = bufnr})
-- end)

lsp.preset('recommended')

lsp.ensure_installed({
	'clangd',
	'cssls',
	'eslint',
	'html',
	'tailwindcss',
	'tsserver',
})

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

