local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<del>"] = "delete_buffer",
				},
			},
		},
	},
})

telescope.load_extension("aerial")
telescope.load_extension("env")
