return {
	-- Detecta tabstop y shiftwidth segun el archivo
	"tpope/vim-sleuth",

	-- gcc comenta la linea, gc comenta la seleccion
	{ "numToStr/Comment.nvim", opts = {} },

	-- Resalta TODO:, FIXME:, NOTE: en comentarios
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
