return {
	"stevearc/aerial.nvim",
	name = "aerial",
	opts = {
		show_guides = true,
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Event",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
			"Field",
		},
	},
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
}
