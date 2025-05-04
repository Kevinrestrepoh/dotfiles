require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<Tab>", "<Tab>", { desc = "Insert tab", noremap = true, silent = true })

-- vim tmux navigator
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>")
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>")
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>")
