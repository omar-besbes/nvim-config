require('lualine').setup({
	options = {
		component_separators = '|',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = {
			-- TODO: find a better way to write this
			'%{&ft == "toggleterm" ? "terminal (".b:toggle_number.")" : expand("%:t")}',
			'branch'
		},
		lualine_c = {
			'diff'
		},
		lualine_x = {
			{ 'diagnostics', sources = { 'nvim_lsp' } }
		},
		lualine_y = {
			'filetype',
			'progress'
		},
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	},
	tabline = {},
	extensions = {},
})

