local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.mypy,

		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	-- on_attach = function(client, bufnr)
	-- 	if client.supports_method("textDocument/formatting") then
	-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			group = augroup,
	-- 			buffer = bufnr,
	-- 			callback = function()
	-- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	-- 				-- vim.lsp.buf.formatting_sync()
	-- 				vim.lsp.buf.format({ bufnr = bufnr })
	-- 			end,
	-- 		})
	-- 	end
	-- end,
})

vim.api.nvim_create_user_command("NullLsLintToggle", function(opts)
	null_ls.toggle({
		method = null_ls.methods.DIAGNOSTICS,
		name = opts.args,
	})
end, {
	nargs = "?",
	complete = function(ArgLead)
		local sources = null_ls.get_sources()
		local vars = {}
		for _, v in pairs(sources) do
			if v.name:match("^" .. ArgLead) then
				table.insert(vars, v.name)
			end
		end

		return vars
	end,
})
