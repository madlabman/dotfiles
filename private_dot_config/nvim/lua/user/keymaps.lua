local keymap = vim.keymap.set -- shorten
local opts = { silent = true } -- silent keymap option

-- map leader to , some day to space
vim.g.mapleader = ","

-- fast saving
keymap("n", "<leader>w", ":w!<CR>", opts)
-- disable highlights of search
keymap("", "<leader><CR>", ":noh<CR>", opts)

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
keymap("n", "<leader>bd", ":bd<cr>:tabclose<cr>gT", opts)
-- navigate buffers
keymap("n", "<leader>l", ":bnext<cr>", opts)
keymap("n", "<leader>h", ":bprevious<cr>", opts)

-- copy to system clipboard
keymap("v", "Y", '"+y', opts)

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
keymap("n", "<leader>gw", ":Gitsigns toggle_current_line_blame<CR>", opts)
keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)


keymap("n", "<F7>", ":AerialToggle!<CR>", opts)

keymap("n", "<space>u", ":UndotreeToggle<CR>", opts)

local ok, tbuiltins = pcall(require, "telescope.builtin")
if ok then
	keymap("n", "<leader>o", function() tbuiltins.buffers({ sort_lastused = true }) end, opts)
	keymap("n", "<c-p>", function() tbuiltins.find_files() end, opts)
	keymap("n", "<c-f>", function() tbuiltins.live_grep() end, opts)
	keymap("n", "<F2>", function() tbuiltins.resume() end, opts)
	keymap("n", "<F1>", function() tbuiltins.treesitter() end, opts)
end

vim.cmd([[imap <silent><script><expr> <Right> copilot#Accept("\<CR>")]])
vim.g.copilot_no_tab_map = true

keymap("n", "<leader>f", function()
	vim.lsp.buf.format({ bufnr = 0 })
end, opts)
