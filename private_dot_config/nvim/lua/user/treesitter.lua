local ok, _ = pcall(require, "nvim-treesitter")
if not ok then
	return
end

local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not ok then
	return
end

local parser_config = parsers.get_parser_configs()
parser_config.vyper = {
	install_info = {
		url = "https://github.com/madlabman/tree-sitter-vyper", -- local path or git repo
		files = {
			"src/parser.c",
			"src/scanner.cc",
		},
		-- optional entries:
		branch = "master", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "vyper", -- if filetype does not match the parser name
}
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}
parser_config.solidity = {
	install_info = {
		url = "https://github.com/madlabman/tree-sitter-solidity",
		files = { "src/parser.c" },
		branch = "master",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
	filetype = "solidity",
}

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup({
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "yaml" },
		disable = function(lang, bufnr)
			local lines = vim.api.nvim_buf_line_count(bufnr)
			if lines > 50000 then
				return true
			end
			if lines == 1 and vim.fn.wordcount().chars > 100000 then
				return true
			end

			return false
		end,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-w>",
			node_incremental = "<M-Up>",
			node_decremental = "<M-Down>",
		},
	},
})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 8, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
