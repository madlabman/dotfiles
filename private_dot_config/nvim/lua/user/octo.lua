local ok, octo = pcall(require, "octo")
if not ok then
	return
end

-- https://github.com/pwntester/octo.nvim/issues/466
vim.g.octo_viewer = "madlabman"

octo.setup({
	right_bubble_delimiter = "", -- bubble delimiter
	left_bubble_delimiter = "", -- bubble delimiter
})
