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

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.5" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("lukas-reineke/indent-blankline.nvim")
	use("Eandrju/cellular-automaton.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("LudoPinelli/comment-box.nvim")
	use("IndianBoy42/tree-sitter-just")
	use("mfussenegger/nvim-treehopper")
	use("nvim-treesitter/playground")
	use("LinArcX/telescope-env.nvim")
	use("nvim-lualine/lualine.nvim")
	use("Glench/Vim-Jinja2-Syntax")
	use("chrisgrieser/nvim-spider")
	use("lewis6991/gitsigns.nvim")
	use("Darazaki/indent-o-matic")
	use("mechatroner/rainbow_csv")
	use("mfussenegger/nvim-lint")
	use("RRethy/vim-illuminate")
	use("windwp/nvim-autopairs")
	use("Pocco81/true-zen.nvim")
	use("numToStr/Comment.nvim")
	use("stevearc/conform.nvim")
	use("stevearc/aerial.nvim")
	use("folke/zen-mode.nvim")
	use("wellle/targets.vim")
	use("mhinz/vim-startify")
	use("github/copilot.vim")
	use("ruanyl/vim-gh-line")
	use("folke/trouble.nvim")
	use("direnv/direnv.vim")
	use("ggandor/leap.nvim")
	use("j-hui/fidget.nvim")
	use("mbbill/undotree")
	use("danymat/neogen")

	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	})

	-- neotest
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"llllvvuu/neotest-foundry",
			"nvim-neotest/neotest-python",
			"TheSnakeWitcher/hardhat.nvim",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-foundry"),
					require("neotest-hardhat"),
					require("neotest-python"),
				},
				-- watch = {
				-- 	enabled = false,
				-- },
			})

			vim.keymap.set("n", "<leader>ta", function()
				require("neotest").run.attach()
			end)

			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>to", function()
				neotest.output_panel.open()
			end)

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end)
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
			})
		end,
	})

	-- LSP
	use("pmizio/typescript-tools.nvim")
	-- use("ray-x/lsp_signature.nvim")
	use("neovim/nvim-lspconfig")

	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-calc")
	use("ray-x/cmp-treesitter")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.0.0",
		requires = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	})

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
			"fennel", -- for themes
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
