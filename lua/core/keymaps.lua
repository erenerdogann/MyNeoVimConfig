-- Set space as your leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- For conciseness

-- General Keymaps
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better window navigation (for when we use splits or multiple panels)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Fast saving and quitting
keymap.set("n", "<leader>w", ":w", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q", { desc = "Quit file" })
keymap.set("n", "<leader>wq", ":wq", { desc = "Save and quit file" })

