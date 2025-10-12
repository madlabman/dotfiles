-- python comments interfere with modeline
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*.py" },
	command = "setlocal nomodeline",
})

-- to be able to use c modeline
vim.api.nvim_create_autocmd("BufRead", {
	pattern = { "*.huff" },
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
	command = "setlocal filetype=just nolinebreak commentstring=#%s",
})

-- commentstring for solidity
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.sol" },
	callback = function()
		vim.bo.comments = "s1:/*,mb:*,ex:*/,b://,b:///"
		vim.bo.commentstring = "//%s"
	end,
})
--
-- commentstring for huff
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.huff" },
	command = "setlocal commentstring=//%s",
})

-- disable copilot on buffer enter
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = { "*" },
-- 	command = "let b:copilot_enabled=0",
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	callback = function()
		local kb = vim.fn.wordcount()["bytes"] / 1024
		if kb > 320 then
			if vim.g.loaded_illuminate == 1 then
				require("illuminate").freeze_buf()
				vim.cmd([[TSBufDisable illuminate]])
				vim.notify("illuminate disabled for the large buffer")
			end

			vim.cmd([[NoMatchParen]])
			vim.cmd([[set nowrap]])
		end
	end,
})

-- -- disable diagnostics for neotest-output-panel
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = { "neotest-output-panel" },
-- 	callback = function()
-- 		vim.diagnostic.disable()
-- 	end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = { "*" },
	command = "setlocal nonumber norelativenumber nocursorline",
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
		"codecompanion",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- blink on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "DiffDelete",
			timeout = 150,
		})
	end,
})
