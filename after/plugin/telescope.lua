-- Key mappings
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files,		{ desc = 'Find files in directory'			})
vim.keymap.set('n', '<leader>fp', require('telescope.builtin').git_files,		{ desc = 'Find files in git repository'	})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep,		{ desc = 'Search text in directory'			})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,			{ desc = 'Find in buffers'						})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags,		{ desc = 'Find help tags'						})
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').colorscheme,	{ desc = 'Change colorscheme'					})

-- Telescope setup
require('telescope').setup({
	pickers = {
    find_files = {
      theme = 'ivy',
    }
  },
})

