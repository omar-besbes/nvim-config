vim.keymap.set('n', '<leader>fs', vim.cmd.NvimTreeToggle)

local function open_nvim_tree(data)
	-- buffer is a real file on the disk
	local is_real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if is_real_file or is_no_name then
		-- open the tree, find the file but don't focus it
		require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
	end

	-- buffer is a directory
	local is_directory = vim.fn.isdirectory(data.file) == 1

	if is_directory then
		-- change to the directory
		vim.cmd.cd(data.file)

		-- open the tree
		require("nvim-tree.api").tree.open()
	end

end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("nvim-tree").setup({
	-- Completely disable netrw
	disable_netrw = true,
	hijack_cursor = true,
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

