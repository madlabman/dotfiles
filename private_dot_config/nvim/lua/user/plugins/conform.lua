return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- TODO: prettier should have installed solidity plugin and conform.nvim fails if it doesn't. There is should be
				-- a way to check it in `condition` field or something like that. Currently I define the formatter explicitly
				-- using .vimrc.local file and direnv plugin for vim.
				solidity = { "forgefmt", "prettier" },
				go = { "gofmt", "goimports" },
				python = { "ruff_organize_imports", "ruff_format" },
				javascript = { "eslint_d", "prettier" },
				typescript = { "eslint_d", "prettier" },
				cpp = { "clang-format" },
				json = { "prettier" },
				toml = { "taplo" },
				["_"] = { "trim_whitespace" },
			},
			-- format_on_save = {
			-- 	-- I recommend these options. See :help conform.format for details.
			-- 	lsp_fallback = true,
			-- 	timeout_ms = 1000,
			-- 	async = true,
			-- },
			format_after_save = nil,
			format_on_save = nil,
			formatters = {
				forgefmt = {
					command = "forge",
					args = { "fmt", "--raw", "-" },
					stdin = true,
				},
			},
		},
	},
}
