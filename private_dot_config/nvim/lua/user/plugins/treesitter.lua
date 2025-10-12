return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufEnter" },
		-- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		lazy = true,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"comment",
				-- "dockerfile",
				"fennel",
				"gitignore",
				"go",
				"gotmpl",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"just",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"solidity",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
				"vyper",
				"xml",
				"yaml",
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = function(lang, bufnr)
					local lines = vim.api.nvim_buf_line_count(bufnr)
					if lines > 50000 then
						return true
					end
					if lines == 1 and vim.fn.wordcount().chars > 100000 then
						return true
					end
					if vim.fn.wordcount().bytes / 1024 > 320 then
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
		},
		config = function(_, opts)
			local parsers = require("nvim-treesitter.parsers")

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

			local configs = require("nvim-treesitter.configs")
			configs.setup(opts)
		end,
	},
}
