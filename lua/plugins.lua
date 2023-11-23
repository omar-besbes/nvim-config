-- Only required if you have packer configured as `opt`

local bootstrap = require("plugin-manager")

return require('packer').startup(function(use)
	-- Packer can manage itself
	use ('wbthomason/packer.nvim')

	-- color theme
	use { 'catppuccin/nvim', as = 'catppuccin' }

	-- fuzzy finder
	use ({
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Get treesitter for syntax highlights
	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- Get undotree
	use ('mbbill/undotree')

	-- Get nvim-tree file explorer
	use ('nvim-tree/nvim-tree.lua')
	use ('nvim-tree/nvim-web-devicons')

	-- Get git wrapper
	use ({
		'NeogitOrg/neogit',
		requires = {
			{'nvim-lua/plenary.nvim'},         -- Required
			{'nvim-telescope/telescope.nvim'}, -- Optional
			{'sindrets/diffview.nvim'},        -- Optional
			{'ibhagwan/fzf-lua'},              -- Optional
		},
		config = true
	})

	use ({
		'lewis6991/gitsigns.nvim',
		tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	-- Get LSP
	use ({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required

			-- Manage LSP servers from neovim
			{'williamboman/mason.nvim'},				-- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Nvim lua api signature help, docs and autocomplete 
			{'folke/neodev.nvim'},						-- Optional

			-- Progress spinner
			{'j-hui/fidget.nvim', tag = "legacy"}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},						-- Required
			{'hrsh7th/cmp-nvim-lsp'},					-- Required
			{'L3MON4D3/LuaSnip'},						-- Required
			-- Adds a number of user-friendly snippets
			{'rafamadriz/friendly-snippets'},		-- Optional
		}
	})

	-- Get custom status line
	use ({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})

	-- Lua
	use ({
		'folke/trouble.nvim',
		requires = 'nvim-tree/nvim-web-devicons',
	})

	-- Key bindings autocomplete
	use ('folke/which-key.nvim')

	-- Terminal sessions
	use ({ 'akinsho/toggleterm.nvim', tag = '*' })

	if bootstrap then
		require('packer').sync()
	end

end)

