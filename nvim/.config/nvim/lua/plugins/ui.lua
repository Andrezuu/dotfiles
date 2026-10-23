return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			terminal_colors = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		dependencies = { "lewis6991/gitsigns.nvim" },
		config = function()
			require("scrollbar").setup({
				show = true,
				show_in_active_only = false,
				hide_if_all_visible = true,
				handle = {
					text = " ",
					blend = 30, -- Transparencia estilo VS Code
					highlight = "CursorColumn",
				},
				marks = {
					GitAdd = { text = "▎", priority = 7, highlight = "GitSignsAdd" },
					GitChange = { text = "▎", priority = 7, highlight = "GitSignsChange" },
					GitDelete = { text = " ", priority = 7, highlight = "GitSignsDelete" },
					Error = { text = { "-", "=" }, priority = 9, highlight = "DiagnosticVirtualTextError" },
					Warn = { text = { "-", "=" }, priority = 8, highlight = "DiagnosticVirtualTextWarn" },
					Info = { text = { "-", "=" }, priority = 4, highlight = "DiagnosticVirtualTextInfo" },
					Hint = { text = { "-", "=" }, priority = 5, highlight = "DiagnosticVirtualTextHint" },
				},
			})
			require("scrollbar.handlers.gitsigns").setup()
			require("scrollbar.handlers.diagnostic").setup()
		end,
	},
}
