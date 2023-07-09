local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup({
	show_guides = true,
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Event",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Struct",
		"Field",
	},
})
