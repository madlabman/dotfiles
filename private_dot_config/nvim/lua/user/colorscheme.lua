local colorscheme = "oxocarbon"
vim.opt.bg = "dark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
