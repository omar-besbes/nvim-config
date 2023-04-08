-- Vim options
-- Only write changes that differ from default configuration

-- Print the number in front of each line
vim.opt.number = true

-- Cursor
vim.opt.guicursor = 'a:ver1,i:blinkon1'

-- Tabs
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true

-- When a bracket is inserted, briefly jump to the matching
vim.opt.showmatch = true

-- Disable text wrap
vim.opt.wrap = false

-- Use an undo history file
vim.opt.undofile = true

-- Undo files directory
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Enables 24-bit RGB color in the terminal UI
vim.opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor when scrolling
vim.opt.scrolloff = 8

-- Add "@" character to characters included in file & path names
vim.opt.isfname:append("@-@")

-- If this many milliseconds nothing is typed, the swap file will be written to disk
vim.opt.updatetime = 500


-- Remaps

-- Set leader key to space
vim.g.mapleader = ','
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Misc

-- Set kanagawa theme
vim.cmd.colorscheme("kanagawa-dragon")

