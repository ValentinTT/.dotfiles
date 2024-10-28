vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save file with Leader key
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Quit Neovim with Leader key
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit nvim" })

-- Open file explorer with Leader key
vim.api.nvim_set_keymap("n", "<Leader>e", ":Ex<CR>", { noremap = true, silent = true, desc = "Open file" })

-- Open NeoTree
vim.api.nvim_set_keymap(
	"n",
	"<Leader>n",
	"<cmd>Neotree toggle<CR>",
	{ noremap = true, silent = true, desc = "Open sidebar" }
)

-- Repeat previous command
vim.api.nvim_set_keymap("n", "<Leader>.", ":<C-f>", { noremap = true, silent = true, desc = "Repeat command" })

-- Close all buffers except for the one I'm in
vim.api.nvim_set_keymap(
	"n",
	"<leader>bo",
	":%bdelete|edit#|bdelete#<CR>",
	{ noremap = true, silent = true, desc = "Delete all buffers except the current one" }
)

vim.keymap.set("n", "<leader>dd", [["_dd]], { desc = "Delete line without yanking" })
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "Delete selection without yanking" })

-- Move line up
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Move line down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- Zoom current windows
vim.keymap.set("n", "<leader>z", function()
	if vim.t.zoomed then
		vim.cmd("wincmd =") -- Restore all windows to equal size
		vim.t.zoomed = false
	else
		vim.cmd("resize | vertical resize") -- Maximize the current window
		vim.t.zoomed = true
	end
end, { desc = "Toggle zoom" })

-- Move between buffers
vim.keymap.set("n", "<leader>bl", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bh", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
