-- Vim options
-- Only write changes that differ from default configuration

-- General
vim.opt.clipboard = 'unnamedplus'									-- Sync clipboard between OS and Neovim
vim.o.completeopt = 'menuone,noselect'								-- Set completeopt to have a better completion experience
vim.opt.showmatch = true												-- When a bracket is inserted, briefly jump to the matching
vim.opt.termguicolors = true											-- Enables 24-bit RGB color in the terminal UI
vim.opt.isfname:append("@-@")											-- Add "@" character to characters included in file & path names
vim.opt.updatetime = 500												-- If this many milliseconds nothing is typed, the swap file will be written to disk
vim.g.mapleader = ','													-- Set leader key to hyphen

-- Cursor
vim.opt.guicursor = 'a:ver1,i:blinkon1'
vim.opt.cursorline = true												-- Highlight current line

-- Indentation
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.smartindent = true												-- Do smart autoindenting when starting a new line

-- Scrolling
vim.opt.scrolloff = 8													-- Minimal number of screen lines to keep above and below the cursor when scrolling

-- Lines
vim.opt.wrap = false														-- Disable text wrap
vim.opt.number = true													-- Print the number in front of each line
vim.opt.relativenumber = true											-- Show the line number relative to the line with the cursor in front of each line

-- Undo
vim.opt.undofile = true													-- Use an undo history file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"		-- Undo files directroy

