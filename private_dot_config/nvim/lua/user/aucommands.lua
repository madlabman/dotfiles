-- python comments interfere with modeline
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.py" },
	command = "setlocal nomodeline",
})

-- recognize vyper files
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.vy" },
	command = "set filetype=vyper",
})

-- commentstring for solidity
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.sol" },
	command = "setlocal commentstring=//%s",
})
