return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"pmizio/typescript-tools.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("user.lspconfig")
		end,
	},
}
