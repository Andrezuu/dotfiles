return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Formatear buffer",
			},
		},
		opts = {
			notify_on_error = false,
			-- Al guardar solo corren los formatters de abajo; el formateo por LSP
			-- (ts_ls, intelephense) queda manual con <leader>f para no reformatear
			-- proyectos ajenos sin querer.
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "never",
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}
