vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Explorador (netrw)" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir de modo terminal" })

-- Ventanas
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Dividir vertical" })
vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>", { desc = "Dividir horizontal" })
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Cerrar ventana actual" })
vim.keymap.set("n", "<leader>wo", "<cmd>only<CR>", { desc = "Cerrar otras ventanas" })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Ir a ventana izquierda" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Ir a ventana abajo" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Ir a ventana arriba" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Ir a ventana derecha" })

-- Diagnosticos
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Diagnostico anterior" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Diagnostico siguiente" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar diagnostico" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lista de diagnosticos" })
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover del simbolo" })
