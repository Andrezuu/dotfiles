-- Revisar cambios externos al entrar a nvim o cambiar de ventana/buffer
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	command = "if mode() != 'c' | checktime | endif",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Resaltar el texto copiado",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
