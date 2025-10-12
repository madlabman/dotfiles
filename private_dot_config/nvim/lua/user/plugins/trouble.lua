return {
	{
		"folke/trouble.nvim",
		opts = {
			auto_refresh = false,
		},
		modes = {
			-- The LSP base mode for:
			-- * lsp_definitions, lsp_references, lsp_implementations
			-- * lsp_type_definitions, lsp_declarations, lsp_command
			lsp_base = {
				params = {
					include_current = true,
				},
			},
		},
	},
}
