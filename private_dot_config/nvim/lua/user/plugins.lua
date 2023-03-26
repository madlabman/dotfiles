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

	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-telescope/telescope.nvim")
	use("nvim-lualine/lualine.nvim")
	use("Glench/Vim-Jinja2-Syntax")
	use("lewis6991/gitsigns.nvim")
	use("Darazaki/indent-o-matic")
	use("mechatroner/rainbow_csv")
	use("RRethy/vim-illuminate")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("stevearc/aerial.nvim")
	use("github/copilot.vim")
	use("ruanyl/vim-gh-line")
	use("folke/trouble.nvim")
	use("direnv/direnv.vim")
	use("ggandor/leap.nvim")
	use("mbbill/undotree")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")
	-- use({ "ms-jpq/coq_nvim", branch = "coq" })
	-- use({ "ms-jpq/coq.thirdparty", branch = "3p" })
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")

	-- Colorschemes
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	use("nyoom-engineering/oxocarbon.nvim")
	use("sainnhe/everforest")
	use("sainnhe/sonokai")

	use({
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	})

	-- dev
	use("rktjmp/hotpot.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
