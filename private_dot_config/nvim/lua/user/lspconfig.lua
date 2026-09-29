-- local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not has_cmp then
-- 	return
-- end
--
-- local default_capabilities = cmp_nvim_lsp.default_capabilities()
local default_capabilities = require("blink.cmp").get_lsp_capabilities()

-- https://github.com/Ackee-Blockchain/wake
vim.lsp.config("wake", {
	cmd = { "eth_wake_lsp" },
	filetypes = { "solidity" },
	root_markers = { "foundry.toml", "wake.toml" },
	settings = {
		wake = {
			configuration = {
				use_toml_if_present = true,
				toml_path = "wake.toml",
			},
			lsp = {
				compilation_delay = 15, -- NOTE: it doesn't work I think
				find_references = {
					include_declarations = true,
				},
				code_lens = {
					enable = false,
				},
				detectors = {
					only = {},
				},
			},
		},
	},
})

local servers = {
	"gopls",
	"jdtls",
	"clangd",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"typos_lsp",
	"taplo",
	"terraformls",
	"wake",
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", function()
		-- local has_trouble, trouble = pcall(require, "trouble")
		-- if has_trouble then
		-- 	trouble.open("lsp_definitions")
		-- else
		vim.lsp.buf.definition()
		-- end
	end, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", function()
		local has_trouble, trouble = pcall(require, "trouble")
		if has_trouble then
			trouble.open("lsp_implementations")
		else
			vim.lsp.buf.implementation()
		end
	end, bufopts)
	vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gt", function()
		local has_trouble, trouble = pcall(require, "trouble")
		if has_trouble then
			trouble.open("lsp_type_definitions")
		else
			vim.lsp.buf.type_definition()
		end
	end, bufopts)
	vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", function()
		local has_trouble, trouble = pcall(require, "trouble")
		if has_trouble then
			trouble.open("lsp_references")
		else
			vim.lsp.buf.references()
		end
	end, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	if client.name ~= "clangd" then
		-- In clang it's useful to have conditional defines properly highlighted,
		-- for the rest disable semantic_tokens for now
		client.server_capabilities.semanticTokensProvider = nil
	end

	-- disable formatting for servers (handled by conform.nvim)
	client.server_capabilities.documentFormattingProvider = nil
	client.server_capabilities.documentRangeFormattingProvider = nil
end

for _, server in pairs(servers) do
	local lsp_opts = {
		on_attach = on_attach,
	}

	if "lua_ls" == server then
		lsp_opts.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
				telemetry = {
					enable = false,
				},
			},
		}
	end

	vim.lsp.config(server, {
		capabilities = default_capabilities,
		on_attach = lsp_opts.on_attach,
		settings = lsp_opts.settings,
	})
	vim.lsp.enable(server)
end

require("typescript-tools").setup({
	capabilities = default_capabilities,
	on_attach = on_attach,
})

vim.diagnostic.config({
	virtual_text = { current_line = true },
})
