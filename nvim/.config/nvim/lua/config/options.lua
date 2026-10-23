vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,100"
vim.opt.scrolloff = 10

-- Indentacion
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Busqueda: ignora mayusculas salvo que uses alguna en el patron
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 750

-- Detectar cambios externos en los archivos
vim.opt.autoread = true

vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Se agenda despues de UiEnter porque puede alargar el arranque
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
