-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.guifont = "Iosevka 11" -- Font for GUI
vim.opt.cmdheight = 0
vim.opt.title = true
vim.opt.titlestring = "nvim @ " .. string.gsub(vim.fn.getcwd(), os.getenv("HOME"), "~")
vim.opt.wildignore = { "*.o", "*~", "*.pyc", "__pycache__", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- when searching try to be smart about cases
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
-- vim.opt.lazyredraw = true -- don't redraw while executing macros (good performance config)
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showmatch = true -- show matching brackets when text indicator is over them
vim.opt.mat = 2 -- how many tenths of a second to blink when matching brackets
vim.opt.number = true -- print the line number in front of each line
vim.opt.syntax = "ON" -- enable syntax highlight
vim.opt.listchars = [[tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»]]
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.cursorline = true -- highlight current line
vim.opt.writebackup = false -- don't make a backup before overwriting a file
vim.opt.backup = false -- we use VCS anyway
vim.opt.swapfile = false -- only in-memory view
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.colorcolumn = "120" -- line length guide
vim.opt.signcolumn = "yes" -- always show the signcolumn
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- 1 tab == 4 spaces
vim.opt.linebreak = true -- wrap lines at textwidth
-- vim.opt.showbreak = "󱞤" -- symbol to prepend wrapped lines with
vim.opt.showbreak = "󱞵" -- symbol to prepend wrapped lines with
vim.opt.wrap = true -- wrap lines
vim.opt.textwidth = 120 -- symbols to wrap text at
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.undofile = true
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

-- python comments interfere with modeline
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.py" },
	command = "setlocal nomodeline",
})
