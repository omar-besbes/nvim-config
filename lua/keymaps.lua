local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts)
end

-- navigation between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window'		})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to bottom window'	})
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to top window'		})
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window'  })

vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Go to left window'		})
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Go to bottom window'	})
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Go to top window'		})
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Go to right window'	})

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Map Oil to <leader>e
nnoremap("<leader>fs", function()
	require("oil").toggle_float()
end)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

