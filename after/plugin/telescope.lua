-- Key mappings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files,		{})
vim.keymap.set('n', '<leader>fp', builtin.git_files,		{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep,		{})
vim.keymap.set('n', '<leader>fb', builtin.buffers,			{})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,		{})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme,	{})

-- Telescope setup
require("telescope").setup({
	pickers = {
    find_files = {
      theme = "ivy",
    }
  },
})

