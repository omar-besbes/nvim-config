local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- Configure language servers locally for neovim using mason
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
		keymaps = {
			toggle_package_expand = '<Tab>',
			toggle_help = '?',
		}
	}
})
mason_lspconfig.setup({
	ensure_installed = {
		'bashls',
		'clangd',
		'cssls',
		'dockerls',
		'eslint',
		'html',
		'jsonls',
		'lua_ls',
		'marksman',
		'rust_analyzer',
		'tailwindcss',
		'tsserver',
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_options = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_options)
		end,
	}
})

-- Customizing the autocompletion menu
local neodev = require("neodev")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

neodev.setup()
cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- `Ctrl + Space` to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	})
})

