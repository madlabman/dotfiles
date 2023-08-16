-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not vim.loop.fs_stat(install_path) then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-tree/nvim-web-devicons")
	use("nvim-tree/nvim-tree.lua")

	use({"nvim-telescope/telescope.nvim", tag = "0.1.1"})
	use("lukas-reineke/indent-blankline.nvim")
	use("Eandrju/cellular-automaton.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("mfussenegger/nvim-treehopper")
	use("nvim-treesitter/playground")
	use("LinArcX/telescope-env.nvim")
	use("nvim-lualine/lualine.nvim")
	use("Glench/Vim-Jinja2-Syntax")
	use("chrisgrieser/nvim-spider")
	use("lewis6991/gitsigns.nvim")
	use("Darazaki/indent-o-matic")
	use("mechatroner/rainbow_csv")
	use("RRethy/vim-illuminate")
	use("windwp/nvim-autopairs")
	use("Pocco81/true-zen.nvim")
	use("numToStr/Comment.nvim")
	use("stevearc/aerial.nvim")
	use("SmiteshP/nvim-navic")
	use("folke/zen-mode.nvim")
	use("wellle/targets.vim")
	use("mhinz/vim-startify")
	-- use("github/copilot.vim")
	use("ruanyl/vim-gh-line")
	use("folke/trouble.nvim")
	use("direnv/direnv.vim")
	use("vim-test/vim-test")
	use("ggandor/leap.nvim")
	use("mbbill/undotree")
	-- use("fatih/vim-go")

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	})

	-- LSP
	use("ray-x/lsp_signature.nvim")
	use("neovim/nvim-lspconfig")

	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")

	-- Colorschemes
	use({ "projekt0n/github-nvim-theme", tag = "v1.0.0" })
	use("nyoom-engineering/oxocarbon.nvim")
	use("folke/tokyonight.nvim")
	use("sainnhe/everforest")
	use("sainnhe/sonokai")

	use({
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
		ft = {
			"xml",
			"css",
			"scss",
			"sass",
			"html",
			"fnl", -- for themes
			"lua",
		},
	})

	-- dev
	use("rktjmp/hotpot.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
