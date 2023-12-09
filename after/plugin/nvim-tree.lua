-- Key maps

local function open_nvim_tree_on_startup(data)
	local api = require("nvim-tree.api")

	-- buffer is a real file on the disk
	local is_real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local is_no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if is_real_file or is_no_name then
		-- open the tree, find the file but don't focus it
		api.tree.toggle({ focus = false, find_file = true, })
	end

	-- buffer is a directory
	local is_directory = vim.fn.isdirectory(data.file) == 1

	if is_directory then
		-- change to the directory
		vim.cmd.cd(data.file)

		-- open the tree
		api.tree.open()
	end

end

vim.keymap.set({ 'n', 't' }, '<leader>fs', vim.cmd.NvimTreeFocus, { desc = 'Focus file explorer' })
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree_on_startup })

-- Nvim-tree setup

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1-- Disable netrw

local function on_attach(bufnr)
	local api = require "nvim-tree.api"

   local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function on_enter(...)
		local current_node = api.tree.get_node_under_cursor()

		api.node.open.drop()
		if current_node.type == "directory" then
			api.tree.change_root_to_node(...)
		end
	end

   -- default mappings
   api.config.mappings.default_on_attach(bufnr)

	-- remove not needed or confusing keymaps
	vim.keymap.del('n', '<C-]>',					{ buffer = bufnr })
	vim.keymap.del('n', '<C-e>',					{ buffer = bufnr })
	vim.keymap.del('n', 'P',						{ buffer = bufnr })
	vim.keymap.del('n', 'g?',						{ buffer = bufnr })
	vim.keymap.del('n', 'a',						{ buffer = bufnr })
	vim.keymap.del('n', '<C-k>',					{ buffer = bufnr })

	-- custom mappings

	-- navigation
	vim.keymap.set('n', '<Left>',					api.node.navigate.parent_close,			opts('Close Directory'))
	vim.keymap.set('n', 'h',						api.node.navigate.parent_close,			opts('Close Directory'))
	vim.keymap.set('n', 'J',						api.node.navigate.sibling.last,			opts('Last Sibling'))
	vim.keymap.set('n', 'K',						api.node.navigate.sibling.first,			opts('First Sibling'))
	-- opening & previewing files
	vim.keymap.set('n', '<Right>',				api.node.open.preview,						opts('Open Preview'))
	vim.keymap.set('n', 'l',						api.node.open.preview,						opts('Open Preview'))
	vim.keymap.set('n', '<CR>',					on_enter,										opts('CD or Open'))
	-- creating files & folders
	vim.keymap.set('n', 'n',						api.fs.create,									opts('Create'))
	vim.keymap.set('n', '<C-n>',					api.fs.create,									opts('Create'))
	-- misc
   vim.keymap.set('n', '?',						api.tree.toggle_help,						opts('Help'))
	vim.keymap.set('n', 'i',						api.node.show_info_popup,					opts('Info'))
 end

require("nvim-tree").setup({
	-- Completely disable netrw (recommended).
	disable_netrw = true,
	-- Keeps cursor in on the first letter of the filename when moving in the tree.
	hijack_cursor = true,
	sync_root_with_cwd = true,
	sort_by = "case_sensitive",
	renderer = {
		-- Compact folders that only contain a single folder into one node.
		group_empty = true,
		special_files = {
			"Cargo.toml", "Makefile", "README.md", "readme.md", ".gitignore", "LICENSE",
		},
		highlight_git = true,
		highlight_opened_files = "all",
		icons = {
			web_devicons = {
				folder = {
					-- Enable icons on folders
					enable = true
				}
			},
			-- Place where the modified icon will be rendered
			git_placement = "after",
		},
	},
	filters = {
		dotfiles = true,
	},
	on_attach = on_attach,
})

