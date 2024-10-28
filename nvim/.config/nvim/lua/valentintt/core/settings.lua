-- Show line numbers
vim.opt.number = true
-- Set relative numbers
vim.wo.relativenumber = true

-- tabs positioning
vim.opt.splitbelow = true
vim.opt.splitright = true

-- wrap behavior on motion
vim.opt.wrap = false

-- Set tab width
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of columns occupied by a tab
vim.opt.softtabstop = 4 -- See multiple spaces as tabstops
vim.opt.shiftwidth = 4 -- Width for auto-indents

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Speed up scrolling
vim.opt.ttyfast = true
vim.opt.scrolloff = 999

-- Disable compatibility to old-time vi
vim.opt.compatible = false

-- Show matching brackets
-- vim.opt.showmatch = true

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Highlight search results
vim.opt.hlsearch = false

-- Visual block change behavior
vim.opt.virtualedit = "block"
-- Split screen in "replace" command
vim.opt.inccommand = "split"
-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.termguicolors = true

