return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = vim.fn.executable("git") == 1,
		opts = {
			current_line_blame_opts = {
				delay = 200,
			},
		},
	},
}
