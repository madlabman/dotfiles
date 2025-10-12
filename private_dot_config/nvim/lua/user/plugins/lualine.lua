return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				-- theme = "everforest",
				section_separators = { "", "" },
				component_separators = { "", "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 }, { "navic", color_correction = nil } },
				lualine_x = {
					{
						"searchcount",
						maxcount = 99999,
						timeout = 500,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "aerial", "nvim-tree", "quickfix" },
		},
	},
}
