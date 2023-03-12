local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		-- recommended = false,
		jump_to_mark = "",
	},
}

local status_ok, coq = pcall(require, "coq")
if not status_ok then
	return
end

local servers = {
	"clangd",
	"lua_ls",
	"tsserver",
	"pyright",
	"solidity",
	"solidity_ls",
	-- "solc",
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gf", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
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

	-- if "solc" == server then
	-- 	local util = require("lspconfig.util")
	-- 	lsp_opts.settings = {
	-- 		root_dir = util.root_pattern(".git"),
	-- 	}
	-- end

	lspconfig[server].setup(coq.lsp_ensure_capabilities(lsp_opts))
end
