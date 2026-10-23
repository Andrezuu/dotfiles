-- Rama `main` de nvim-treesitter (reescritura): ya no existe el modulo `configs`,
-- el resaltado se activa con vim.treesitter.start() desde un autocmd.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"c",
				"css",
				"diff",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"php",
				"query",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
				callback = function(event)
					pcall(vim.treesitter.start, event.buf)
				end,
			})
		end,
	},
}
