return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			hijack_cursor = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			view = {
				preserve_window_proportions = true,
				width = {},
			},
			git = {
				enable = true,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = false,
					},
				},
			},
		},
		config = function(_, opts)
			local nvim_tree = require("nvim-tree")
			nvim_tree.setup(opts)

			-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#go-to-last-used-hidden-buffer-when-deleting-a-buffer
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					local api = require("nvim-tree.api")

					-- Only 1 window with nvim-tree left: we probably closed a file buffer
					if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
						-- Required to let the close event complete. An error is thrown without this.
						vim.defer_fn(function()
							-- close nvim-tree: will go to the last hidden buffer used before closing
							api.tree.toggle({ find_file = true, focus = true })
							-- re-open nivm-tree
							api.tree.toggle({ find_file = true, focus = true })
							-- nvim-tree is still the active window. Go to the previous window.
							vim.cmd("wincmd p")
						end, 0)
					end
				end,
			})
		end,
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				opts = {
					override = {
						vy = {
							icon = "󱔎",
							name = "Vyper",
						},
					},
				},
			},
		},
	},
}
