-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "[A]dd to Harpoon" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<C-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-t>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<C-s>", function()
				harpoon:list():select(4)
			end)
			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"Aietes/esp32.nvim",
		name = "esp32.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		opts = {
			build_dir = "build.clang",
		},
		config = function(_, opts)
			require("esp32").setup(opts)
		end,
		keys = {
			{
				"<leader>RM",
				function()
					require("esp32").pick("monitor")
				end,
				desc = "ESP32: Pick & Monitor",
			},
			{
				"<leader>Rm",
				function()
					require("esp32").command("monitor")
				end,
				desc = "ESP32: Monitor",
			},
			{
				"<leader>RF",
				function()
					require("esp32").pick("flash")
				end,
				desc = "ESP32: Pick & Flash",
			},
			{
				"<leader>Rf",
				function()
					require("esp32").command("flash")
				end,
				desc = "ESP32: Flash",
			},
			{
				"<leader>Rc",
				function()
					require("esp32").command("menuconfig")
				end,
				desc = "ESP32: Configure",
			},
			{
				"<leader>RC",
				function()
					require("esp32").command("clean")
				end,
				desc = "ESP32: Clean",
			},
			{ "<leader>Rr", ":ESPReconfigure<CR>", desc = "ESP32: Reconfigure project" },
			{ "<leader>Ri", ":ESPInfo<CR>", desc = "ESP32: Project Info" },
		},
	},
}
