return {
	{
		"RRethy/vim-illuminate",
		enabled = true,
		opts = {
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 200,
			filetypes_denylist = {
				"DressingSelect",
				"NvimTree",
				"Outline",
				"TelescopePrompt",
				"Trouble",
				"alpha",
				"dirvish",
				"fugitive",
				"help",
				"json",
				"jsonc",
				"lir",
				"neogitstatus",
				"packer",
				"spectre_panel",
				"toggleterm",
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			providers_regex_syntax_denylist = {},
			providers_regex_syntax_allowlist = {},
			under_cursor = true,
			large_file_cutoff = 10000,
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			-- @see https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"]()
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()

					vim.keymap.set("n", "<leader>h", function()
						require("illuminate").toggle_freeze_buf()
					end, { buffer = buffer })

					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
	},
}
