return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules", "package.json", "package-lock.json" },
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- Dentro de un picker: <C-/> (insert) o ? (normal) muestra sus atajos
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Buscar archivos" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Buscar archivos de git" })
			vim.keymap.set("n", "<leader>p.", builtin.oldfiles, { desc = "Archivos recientes" })
			vim.keymap.set("n", "<leader>pr", builtin.resume, { desc = "Reanudar ultima busqueda" })
			vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Diagnosticos" })
			vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Atajos de teclado" })
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "Ayuda de nvim" })

			-- Greps
			vim.keymap.set("n", "<leader>pws", function()
				builtin.grep_string({ search = vim.fn.expand("<cword>") })
			end, { desc = "Grep palabra bajo el cursor" })
			vim.keymap.set("n", "<leader>pWs", function()
				builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
			end, { desc = "Grep WORD bajo el cursor" })
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Grep (pregunta el texto)" })
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
			end, { desc = "Grep en archivos abiertos" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Buscar en el buffer actual" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Archivos de config de nvim" })
		end,
	},
}
