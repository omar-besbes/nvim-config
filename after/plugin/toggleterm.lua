vim.keymap.set('n', '<leader>t',		vim.cmd.ToggleTerm,													{ desc = 'Toggle floating terminal' })
vim.keymap.set('n', '<leader>tt',	function() vim.cmd.ToggleTerm('direction=vertical') end, { desc = 'Toggle vertical terminal' })

require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	insert_mapping = false,
	start_in_insert = true,
	direction = "float",
	close_on_exit = false,
	float_opts = {
		border = "rounded",
		height = 15,
		width = 100,
	}
})
