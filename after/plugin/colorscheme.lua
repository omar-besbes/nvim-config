require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		cmp = true,
		fidget = true,
		gitsigns = true,
		mason = true,
      nvimtree = true,
		treesitter = true,
		telescope = { enabled = true },
   }
})

-- Set catppuccin theme
vim.cmd.colorscheme("catppuccin")
