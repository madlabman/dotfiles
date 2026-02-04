return {
	{ "direnv/direnv.vim" },
	{ "wellle/targets.vim" },
	{ "wuwe1/vim-huff" },
	{ "ruanyl/vim-gh-line" },
	{
		"mechatroner/rainbow_csv",
		enabled = false,
		config = function()
			local oxocarbon = require("oxocarbon").oxocarbon
			local colorpairs = {
				{ "red", oxocarbon.base04 },
				{ "blue", oxocarbon.base08 },
				{ "yellow", oxocarbon.base09 },
				{ "cyan", oxocarbon.base10 },
				{ "magenta", oxocarbon.base13 },
				{ "red", oxocarbon.base15 },
				{ "green", oxocarbon.peach },
				{ "blue", oxocarbon.base03 },
				{ "yellow", oxocarbon.base06 },
				{ "cyan", oxocarbon.base08 },
				{ "magenta", oxocarbon.base09 },
			}
			vim.g.rcsv_colorpairs = colorpairs
			--
			-- local id = vim.api.nvim_create_augroup("rcsv", { clear = true })
			-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			-- 	group = id,
			-- 	pattern = "*.csv",
			-- 	callback = function()
			-- 		vim.api.nvim_set_hl(0, "@number.csv", {})
			-- 		vim.api.nvim_set_hl(0, "@string.csv", {})
			-- 		vim.api.nvim_set_hl(0, "@constant.csv", {})
			-- 		vim.api.nvim_set_hl(0, "@header", { bold = true })
			-- 	end,
			-- })
		end,
	},
	{ "LudoPinelli/comment-box.nvim", opts = { doc_width = 120, box_width = 100 } },
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function()
			-- " Style 3
			-- " +------------------------+----------+
			-- " |                        |          |
			-- " |                        |          |
			-- " |                        | undotree |
			-- " |                        |          |
			-- " |                        |          |
			-- " |                        +----------+
			-- " |                        |          |
			-- " |                        |   diff   |
			-- " |                        |          |
			-- " +------------------------+----------+
			vim.g.undotree_WindowLayout = 3
			-- let undotree window get focus after being opened
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	{ "Glench/Vim-Jinja2-Syntax" },
	{ "mfussenegger/nvim-treehopper" },
	{ "folke/snacks.nvim" },
}
