return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┆",
			},
			scope = {
				enabled = false,
			},
			exclude = {
				buftypes = { "terminal", "nofile" },
				filetypes = {
					"help",
					"packer",
					"startify",
					"NvimTree",
				},
			},
		},
	},
}
