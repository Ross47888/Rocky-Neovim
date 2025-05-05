vim.g.mapleader = " "
vim.keymap.set("n", "<leader>vn", vim.cmd.Ex)

vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

-- Centering Commands
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "nzz")

-- Remap the movement keys to be sensible
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Leader + x 
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

-- Delete paste not to registry
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system registry
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostic Remaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

local function goDefinition()
    vim.cmd("mark R")
    vim.lsp.buf.definition()
end

-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gd", goDefinition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
