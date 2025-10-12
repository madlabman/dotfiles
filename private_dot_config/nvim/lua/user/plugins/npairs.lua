return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add pair on that treesitter node
				javascript = { "string" },
			},
			-- map_bs = false,
			-- map_cr = false,
		},
	},
}
