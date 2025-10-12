return {
	{
		"andythigpen/nvim-coverage",
		cmd = { "Coverage" },
		opts = {
			auto_reload = true,
			commands = true,
			lang = {
				solidity = {
					coverage_file = "lcov.info",
					coverage_command = "just coverage-lcov",
				},
			},
		},
	},
}
