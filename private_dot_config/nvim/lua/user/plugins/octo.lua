return {
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		cmd = "Octo",
		event = { { event = "BufReadCmd", pattern = "octo://*" } },
		config = function(_, opts)
			-- https://github.com/pwntester/octo.nvim/issues/466
			vim.g.octo_viewer = "madlabman"
			vim.g.maplocalleader = ","
			require("octo").setup(opts)
		end,
		opts = {
			right_bubble_delimiter = "", -- bubble delimiter
			left_bubble_delimiter = "", -- bubble delimiter
			reviews = {
				auto_show_threads = false, -- automatically show comment threads on cursor move
				focus = "right", -- focus right buffer on diff open
			},
		},
	},
}
