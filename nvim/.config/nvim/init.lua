-- El leader debe definirse antes de cargar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.filetypes")
require("config.lazy")
