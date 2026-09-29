return {
	"dmtrKovalenko/fff",
	tag = "v0.11.0",
	lazy = false,
	build = function(plugin)
		local result = vim.system({ "cargo", "build", "--release", "-p", "fff-nvim" }, {
			cwd = plugin.dir,
			env = { CARGO_TARGET_DIR = vim.fs.joinpath(plugin.dir, "target") },
			text = true,
		}):wait(600000)
		if result.code ~= 0 then
			error("fff source build failed: " .. (result.stderr or "") .. (result.stdout or ""))
		end
	end,
	opts = {
		lazy_sync = true,
		prompt = "> ",
		layout = {
			width = 0.95,
			height = 0.9,
			preview_position = "top",
			prompt_position = "bottom",
			border = "single",
			preview_size = 0.4,
			min_list_height = 4,
		},
		grep = {
			casing = "insensitive",
		},
	},
}
