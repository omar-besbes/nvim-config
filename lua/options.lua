-- Vim options
-- Only write changes that differ from default configuration

-- General
vim.opt.clipboard = "unnamed,unnamedplus" -- Sync clipboard between OS and Neovim
vim.o.completeopt = "menu,menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching
vim.opt.termguicolors = true -- Enables 24-bit RGB color in the terminal UI
vim.opt.isfname:append("@-@") -- Add "@" character to characters included in file & path names
vim.opt.updatetime = 500 -- If this many milliseconds nothing is typed, the swap file will be written to disk

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Cursor
vim.opt.cursorline = true -- Highlight current line
vim.opt.guicursor = { -- Cursor (see :h guicursor)
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

-- Indentation
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.smartindent = true -- Do smart autoindenting when starting a new line
vim.opt.breakindent = true -- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.expandtab = true

-- Scrolling
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor when scrolling

-- Lines
vim.opt.wrap = false -- Disable text wrap
vim.opt.number = true -- Print the number in front of each line
vim.opt.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line
vim.opt.nu = true
vim.opt.rnu = true

-- Place a column line
vim.opt.colorcolumn = "80"

-- Undo
vim.opt.undofile = true -- Use an undo history file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Undo files directroy

-- Allow mouse only in normal and terminal modes
vim.o.mouse = "nc"

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
