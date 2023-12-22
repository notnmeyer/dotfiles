vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close Buffer" })
