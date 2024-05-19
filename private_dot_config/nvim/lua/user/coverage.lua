local ok, coverage = pcall(require, "coverage")
if not ok then
	return
end

coverage.setup({
	auto_reload = true,
	commands = true,
	lang = {
		solidity = {
			coverage_file = "lcov.info",
			coverage_command = "just coverage-lcov",
		},
	},
})
