return {

	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					harpoon = true,
					illuminate = {
						enable = true,
						lsp = true,
					},
					indent_blankline = {
						enabled = false,
						scope_color = "sapphire",
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = { enabled = true },
					notify = true,
					nvimtree = true,
					neotree = true,
					symbols_outline = true,
					telescope = { enabled = true },
					treesitter = true,
					treesitter_context = true,
				},
			})

			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
