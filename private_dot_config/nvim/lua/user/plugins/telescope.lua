return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		opts = {
			defaults = {
				-- horizontal space costs more
				layout_strategy = "vertical",
				borderchars = {
					"─",
					"│",
					"─",
					"│",
					"┌",
					"┐",
					"┘",
					"└",
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<del>"] = "delete_buffer",
						},
					},
				},
			},
		},
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"stevearc/aerial.nvim",
				"folke/trouble.nvim",
			},
		},
		config = function(_, opts)
			local open_with_trouble = require("trouble.sources.telescope").open

			opts["defaults"]["mappings"] = {
				i = { ["<c-t>"] = open_with_trouble },
				n = { ["<c-t>"] = open_with_trouble },
			}

			local telescope = require("telescope")
			telescope.setup(opts)

			telescope.load_extension("aerial")

			vim.api.nvim_create_user_command("BLines", function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end, {})
		end,
	},
}
