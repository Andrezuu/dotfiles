return {
	-- Tipos de la API de nvim para editar Lua
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} }, -- spinner de estado del LSP
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					local builtin = require("telescope.builtin")

					map("gd", builtin.lsp_definitions, "Ir a definicion")
					map("gr", builtin.lsp_references, "Ir a referencias")
					map("gI", builtin.lsp_implementations, "Ir a implementacion")
					map("gD", vim.lsp.buf.declaration, "Ir a declaracion")
					map("<leader>D", builtin.lsp_type_definitions, "Definicion del tipo")
					map("<leader>ds", builtin.lsp_document_symbols, "Simbolos del documento")
					-- <leader>ws es dividir horizontal, por eso este va en dw
					map("<leader>dw", builtin.lsp_dynamic_workspace_symbols, "Simbolos del workspace")
					map("<leader>rn", vim.lsp.buf.rename, "Renombrar")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Alternar inlay hints")
					end
				end,
			})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "\u{ea87}",
						[vim.diagnostic.severity.WARN] = "\u{ea6c}",
						[vim.diagnostic.severity.INFO] = "\u{ea74}",
						[vim.diagnostic.severity.HINT] = "\u{ea61}",
					},
				},
			})

			-- Capacidades extra para que el autocompletado (cmp) funcione con todos los servers
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- Para agregar un lenguaje: agrega el server aqui (nombre de lspconfig).
			-- Mason lo instala y mason-lspconfig lo activa solo.
			local servers = {
				lua_ls = {
					settings = { Lua = { completion = { callSnippet = "Replace" } } },
				},
				ts_ls = {},
				intelephense = {},
				-- Postgres. Por defecto solo arranca si el proyecto tiene
				-- postgres-language-server.jsonc; asi funciona en cualquier .sql
				postgres_lsp = { workspace_required = false },
			}
			for name, config in pairs(servers) do
				vim.lsp.config(name, config)
			end

			require("mason").setup()
			require("mason-tool-installer").setup({ ensure_installed = { "stylua" } })
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_enable = { exclude = { "stylua" } }, -- stylua es solo formatter
			})
		end,
	},
}
