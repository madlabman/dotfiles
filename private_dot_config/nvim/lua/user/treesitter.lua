local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_ok then
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

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "yaml" },
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "<M-Up>",
			node_decremental = "<M-Down>",
		},
	},
})
