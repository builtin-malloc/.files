vim.g.mapleader = " "

local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>fer", ":luafile $MYVIMRC<CR>", opts)
map("n", "<leader>fed", ":e ~/Repos/Dotfiles/nvim/init.lua<CR>", opts)

map("n", "<leader>kd", function() vim.lsp.buf.format { async = true } end, opts)

local telescope = require("telescope.builtin")
map("n", "<leader>ft", ":Neotree<CR>", opts)
map("n", "<leader>ff", telescope.find_files, opts)
map("n", "<leader>b", telescope.buffers, opts)
map("n", "C-x b", telescope.buffers, opts)
