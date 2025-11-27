-- Luacheck configuration for Neovim config

-- Allow vim global
globals = {
    "vim",
}

-- Read globals from busted (for testing if needed in future)
std = "max"

-- Exclude certain directories
exclude_files = {
    ".git/",
    "lazy-lock.json",
}
