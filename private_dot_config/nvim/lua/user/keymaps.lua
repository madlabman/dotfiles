local keymap = vim.keymap.set -- shorten
local opts = { silent = true } -- silent keymap option

-- map leader to , some day to space
vim.g.mapleader = ","

-- fast saving
keymap("n", "<leader>w", ":w!<CR>", opts)
-- disable highlights of search
keymap("", "<leader><CR>", ":noh<CR>", opts)
-- center search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- smart way to move between windows
keymap("n", "<C-j>", "<C-W>j", opts)
keymap("n", "<C-k>", "<C-W>k", opts)
keymap("n", "<C-h>", "<C-W>h", opts)
keymap("n", "<C-l>", "<C-W>l", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- close the current buffer
keymap("n", "<leader>bd", ":bd!<cr>:bprevious<cr>", opts)
-- navigate buffers
keymap("n", "<leader>l", ":bnext<cr>", opts)
keymap("n", "<leader>h", ":bprevious<cr>", opts)

-- copy to system clipboard
keymap("v", "Y", '"+y', opts)

-- paste over currently selected text without yanking it
keymap("v", "p", '"_dP', opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- plugins below
keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", opts)

keymap("n", "<leader>xx", ":TroubleToggle<CR>", opts)

keymap("n", "<leader>gu", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns preview_hunk<CR>", opts)

keymap("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		vim.cmd([[Gitsigns next_hunk]])
	end)
	return "<Ignore>"
end, { expr = true })

keymap("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		vim.cmd([[Gitsigns prev_hunk]])
	end)
	return "<Ignore>"
end, { expr = true })

keymap("n", "<F7>", ":AerialToggle!<CR>", opts)

keymap("n", "<leader>t", ":TestNearest<CR>", opts)

keymap("n", "<space>u", vim.cmd.UndotreeToggle, opts)

keymap({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
keymap({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
keymap({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
keymap({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

keymap("n", "gnn", "<cmd>lua require('tsht').nodes()<CR>", opts)

keymap("n", "<leader>k", function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

local ok, telescope = pcall(require, "telescope")
if ok then
	local builtin = require("telescope.builtin")

	keymap("n", "<leader>o", function()
		builtin.buffers({ sort_lastused = true })
	end, opts)
	keymap("n", "<c-p>", function()
		builtin.find_files()
	end, opts)
	keymap("n", "<c-f>", function()
		builtin.live_grep({
			additional_args = { "--ignore-case" },
		})
	end, opts)
	keymap("n", "<c-e>", function()
		telescope.extensions.env.env()
	end, opts)
	keymap("n", "<F2>", function()
		builtin.resume()
	end, opts)
	keymap("n", "<F1>", function()
		telescope.extensions.aerial.aerial()
	end, opts)
end

vim.cmd([[imap <silent><script><expr> <Right> copilot#Accept("\<CR>")]])
vim.g.copilot_no_tab_map = true

keymap("n", "<leader>zf", ":TZFocus<CR>", opts)

keymap("n", "<leader>f", function()
	vim.lsp.buf.format({ bufnr = 0 })
end, opts)

keymap("n", "gx", [[:execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR><CR>]], opts)
