return {
	{
		"Theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon: marcar archivo" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon: menu" })
			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():prev()
			end, { desc = "Harpoon: anterior" })
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():next()
			end, { desc = "Harpoon: siguiente" })
		end,
	},
}
