-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Get kanagawa theme
	use 'rebelot/kanagawa.nvim'

	-- Get a fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Get treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Get undotree
	use 'mbbill/undotree'

	-- Get netrw customizations
	use 'prichrd/netrw.nvim'
	use 'nvim-tree/nvim-web-devicons'

end)

