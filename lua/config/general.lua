-- Show line number
vim.o.number = true

-- Show commands preview in a split
vim.o.inccommand = "split"

-- Highlight on search
vim.o.hlsearch = true

-- Update a buffer when it receives changes out of nvim session
vim.o.autoread = true

-- Persist undo commands
vim.o.undofile = true

-- Allow regex to work properly
vim.o.magic = true

-- Explicitly disables paste mode
vim.o.paste = false

-- Highlight current line
vim.o.cursorline = true

-- Allows ctrl-c usage
vim.o.clipboard = "unnamedplus"

-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

