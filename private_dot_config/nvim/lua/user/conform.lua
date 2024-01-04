local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- TODO: prettier should have installed solidity plugin and conform.nvim fails if it doesn't. There is should be
		-- a way to check it in `condition` field or something like that. Currently I define the formatter explicitly
		-- using .vimrc.local file and direnv plugin for vim.
		solidity = { { "prettier", "forgefmt" } },
		go = { "gofmt", "goimports" },
		python = { "isort", "black" },
		javascript = { { "eslint_d", "prettier" } },
		typescript = { { "eslint_d", "prettier" } },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 1000,
	},
	formatters = {
		forgefmt = {
			command = "forge",
			args = { "fmt", "--raw", "-" },
			stdin = true,
		},
	},
})
