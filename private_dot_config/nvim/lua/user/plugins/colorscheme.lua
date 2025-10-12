return {
	{
		"nikolvs/vim-sunbather",
		lazy = true,
	},
	{
		"owickstrom/vim-colors-paramount",
		lazy = true,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
	},
	{
		"sainnhe/everforest",
		lazy = true,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 0
			-- vim.g.everforest_disable_italic_comment = 1
			vim.g.everforest_diagnostic_text_highlight = 0
			vim.g.everforest_diagnostic_line_highlight = 0
		end,
	},
	{
		"sainnhe/sonokai",
		lazy = true,
		config = function()
			vim.g.sonokai_style = "shusia"
			vim.g.sonokai_better_performance = 0
			-- vim.g.sonokai_enable_italic = 0
			vim.g.sonokai_disable_italic_comment = 0
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = true,
		dependencies = {
			"rktjmp/hotpot.nvim",
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = {
					dragon = {},
					lotus = {},
					wave = {},
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "dragon", -- Load "wave" theme
			background = { -- map the value of 'background' option to a theme
				dark = "dragon", -- try "dragon" !
				light = "lotus",
			},
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			ft = {
				"xml",
				"css",
				"scss",
				"sass",
				"html",
				"fennel", -- for themes
				"lua",
			},
		},
	},
}
