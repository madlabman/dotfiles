local ok, lsp_signature = pcall(require, "lsp_signature")
if not ok then
	return
end

lsp_signature.setup({
	toggle_key = "<C-x>",
	handler_opts = {
		border = "single",
	},
	floating_window = false,
	hint_prefix = "🔩 ",
})
