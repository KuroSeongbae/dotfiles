local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Movement with jkl; (includes mapping command mode to ' or "
keymap("", "\'", ":", opts)
keymap("", "\"", ":", opts)

keymap("", "j", "h", opts)
keymap("", "k", "j", opts)
keymap("", "l", "k", opts)
keymap("", ";", "l", opts)

keymap("", "J", "H", opts)
keymap("", "K", "J", opts)
keymap("", "L", "K", opts)
keymap("", ":", "L", opts)

-- Normal mode
-- -- Leader keys
-- keymap("n", "<leader>e", ":Lex 25<cr>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>x", ":Bdelete<CR>", opts)

-- -- Window navigation
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>k", opts)
keymap("n", "<C-;>", "<C-w>l", opts)

-- -- Buffer navigation
keymap("n", "<Tab>", ":bnext<cr>", opts)
keymap("n", "<S-Tab>", ":bprevious<cr>", opts)

-- Visual
-- -- indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- -- Moving text
keymap("v", "<C-k>", ":mv +1<CR>==", opts)
keymap("v", "<C-l>", ":mv -2<CR>==", opts)

-- -- Prevents yanking selected text when pasting 'over' the selected text
keymap("v", "p", '"_dP', opts)

