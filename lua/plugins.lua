-- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
	-- Packer can manage itself
	use ('wbthomason/packer.nvim')

	-- color theme
	use ('rebelot/kanagawa.nvim')

	-- fuzzy finder
	use ({
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Get treesitter
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Get undotree
	use ('mbbill/undotree')

	-- Get nvim-tree file explorer
	use ('nvim-tree/nvim-tree.lua')
	use ('nvim-tree/nvim-web-devicons')

	-- Get git wrapper
	use ('tpope/vim-fugitive')
	use ({
		'lewis6991/gitsigns.nvim',
		tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	-- Get LSP
	use ({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Progress spinner
			{'j-hui/fidget.nvim', tag = "legacy"},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	})

	-- Get custom status line
	use ({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})

	-- Lua
	use ({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

end)

