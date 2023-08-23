local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
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
})
