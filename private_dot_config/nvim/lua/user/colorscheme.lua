local colorscheme = "oxocarbon"

vim.g.sonokai_style = "shusia"
vim.g.sonokai_better_performance = 0
vim.g.sonokai_enable_italic = 0
vim.g.sonokai_disable_italic_comment = 0

vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 0
vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_diagnostic_text_highlight = 0
vim.g.everforest_diagnostic_line_highlight = 0

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
