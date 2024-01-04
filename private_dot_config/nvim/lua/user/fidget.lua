local ok, fidget = pcall(require, "fidget")
if not ok then
	return
end

-- @see https://github.com/j-hui/fidget.nvim#options
fidget.setup({
	progress = {
		display = {
			done_icon = "",
		},
	},
})

vim.notify = require("fidget.notification").notify
