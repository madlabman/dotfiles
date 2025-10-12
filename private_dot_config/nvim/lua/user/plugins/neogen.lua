return {
	{
		"danymat/neogen",
		version = "*",
		config = function()
			local extractors = require("neogen.utilities.extractors")
			local nodes_utils = require("neogen.utilities.nodes")
			local i = require("neogen.types.template").item
			local neogen = require("neogen")

			neogen.setup({
				enabled = true,
				languages = {
					solidity = {
						parent = {
							func = {
								"function_definition",
							},
						},
						data = {
							func = {
								["function_definition"] = {
									["0"] = {
										extract = function(node)
											local tree = {
												{
													retrieve = "all",
													node_type = "parameter",
													subtree = {
														{
															retrieve = "all",
															node_type = "identifier",
															extract = true,
															as = i.Parameter,
														},
													},
												},
												{
													retrieve = "first",
													node_type = "return_type_definition",
													subtree = {
														{
															retrieve = "all",
															recursive = true,
															node_type = "identifier",
															extract = true,
															as = i.Return,
														},
													},
												},
											}
											local nodes = nodes_utils:matching_nodes_from(node, tree)
											local res = extractors:extract_from_matched(nodes)
											return res
										end,
									},
								},
							},
						},
						template = {
							annotation_convention = "natspec",
							use_default_comment = false,
							natspec = {
								{ nil, "/// @notice FIXME: it shouldn't be empty", { type = { "func" } } },
								{ nil, "/// @dev FIXME: it shouldn't be empty", { type = { "func" } } },
								{ i.Parameter, "/// @param %s $1", { type = { "func" } } },
								{ i.Return, "/// @return %s $1", { type = { "func" } } },
							},
						},
					},
				},
			})
		end,
	},
}
