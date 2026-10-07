return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			vim.api.nvim_create_autocmd("User", {
				pattern = "TSUpdate",
				callback = function()
					-- Keep the grammar used by the local Solidity queries.
					require("nvim-treesitter.parsers").solidity = {
						install_info = {
							url = "https://github.com/madlabman/tree-sitter-solidity",
							revision = "62a4b7f2537002cb035757b624a252579dd9d960",
						},
					}
				end,
			})

			vim.treesitter.language.register("gotmpl", { "gohtmltmpl", "gotexttmpl" })
			vim.treesitter.language.register("json", "jsonc")
			vim.treesitter.language.register("bash", "env")
			vim.api.nvim_create_user_command("TSInstallConfigured", function()
				treesitter.install({
					"bash",
					"c",
					"comment",
					"fennel",
					"gitignore",
					"go",
					"gotmpl",
					"html",
					"javascript",
					"jsdoc",
					"json",
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
					"xml",
					"yaml",
				})
			end, {})
			-- Skip installed parsers absent from the registry, such as geas.
			vim.api.nvim_create_user_command("TSUpdate", function(args)
				local available = {}
				for _, lang in ipairs(treesitter.get_available()) do
					available[lang] = true
				end
				local requested = #args.fargs > 0 and args.fargs or treesitter.get_installed()
				local supported = vim.tbl_filter(function(lang)
					return available[lang] == true
				end, requested)
				if #supported > 0 then
					treesitter.update(supported, { summary = true })
				end
			end, { nargs = "*", force = true })

			local group = vim.api.nvim_create_augroup("user_treesitter", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(event)
					local buf = event.buf
					local is_fff_preview = vim.api.nvim_buf_get_name(buf):match("fffile preview$") ~= nil
					if vim.bo[buf].buftype ~= "" and not is_fff_preview then
						return
					end
					local lines = vim.api.nvim_buf_line_count(buf)
					if lines > 50000 or vim.api.nvim_buf_get_offset(buf, lines) > 1024 * 1024 then
						return
					end
					local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
					if lang and vim.treesitter.language.add(lang) then
						vim.treesitter.start(buf)
					end
				end,
			})

			vim.keymap.set("n", "<M-w>", function()
				vim.treesitter.select("parent")
			end)
			vim.keymap.set("x", "<M-Up>", function()
				vim.treesitter.select("parent")
			end)
			vim.keymap.set("x", "<M-Down>", function()
				vim.treesitter.select("child")
			end)
		end,
	},
}
