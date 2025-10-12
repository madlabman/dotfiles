return {
	{
		"j-hui/fidget.nvim",
		opts = function()
			vim.notify = require("fidget.notification").notify
			return {
				progress = {
					display = {
						done_icon = "",
					},
				},
			}
		end,
	},
}
