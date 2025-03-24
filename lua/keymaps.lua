local M = {}

local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts)
end

-- navigation between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window'     })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to bottom window'   })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to top window'      })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window'    })

vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Go to left window'      })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Go to bottom window'	})
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Go to top window'		})
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Go to right window'     })

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

-- LSP Keybinds (per-buffer)
M.map_lsp_bindings = function(buffer_number)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol", buffer = buffer_number })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code action", buffer = buffer_number })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition", buffer = buffer_number })
	vim.keymap.set(
		"n",
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: Go to references", buffer = buffer_number }
	)
	vim.keymap.set(
		"n",
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: Go to implementations", buffer = buffer_number }
	)
	vim.keymap.set(
		"n",
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: Document symbols", buffer = buffer_number }
	)
	vim.keymap.set(
		"n",
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: Workspace symbols", buffer = buffer_number }
	)
	vim.keymap.set(
		"n",
		"<leader>k",
		vim.lsp.buf.signature_help,
		{ desc = "LSP: Signature help", buffer = buffer_number }
	)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help", buffer = buffer_number })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration", buffer = buffer_number })
	vim.keymap.set("n", "td", vim.lsp.buf.type_definition, { desc = "LSP: Type definition", buffer = buffer_number })
end

return M