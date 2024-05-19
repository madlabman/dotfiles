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

-- recognize just files
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "[Jj]ustfile" },
	command = "setlocal filetype=just nolinebreak",
})

-- commentstring for solidity
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.sol" },
	command = "setlocal commentstring=//%s",
})

-- disable copilot on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*" },
	command = "let b:copilot_enabled=0",
})
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"checkhealth",
		"neotest-output",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
