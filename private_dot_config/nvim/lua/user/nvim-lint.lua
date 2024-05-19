local ok, lint = pcall(require, "lint")
if not ok then
	return
end

lint.linters_by_ft = {
	yaml = {
		"actionlint",
		"yamllint",
	},
	dockerfile = {
		"hadolint",
	},
	typescript = {
		"eslint_d",
	},
	javascript = {
		"eslint_d",
	},
	json = {
		"jsonlint",
	},
	python = {
		"ruff",
		-- "mypy",
	},
	solidity = {
		"solhint",
	},
}

-- https://github.com/syphar/dotfiles/blob/a60a9b6337499ab9b48398374ddda49331b3ecd6/.config/nvim/lua/dc/plugins/lint.lua#L32
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "TextChanged" }, {
	callback = function()
		local ctx = { filename = vim.api.nvim_buf_get_name(0) }
		ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")

		if not lint.linters_by_ft[vim.bo.filetype] then
			return
		end

		local linters = vim.tbl_filter(function(name)
			local linter = lint.linters[name]

			assert(linter)
			assert(type(linter) == "table")

			return not (linter.condition and not linter.condition(ctx))
		end, lint.linters_by_ft[vim.bo.filetype])

		if #linters > 0 then
			lint.try_lint(linters)
		end
	end,
})

-- TODO: steal methods from null-ls
local function find_nearest_directory(directory)
	local filename = vim.fn.fnameescape(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p"))
	local relative_path = vim.fn.finddir(directory, filename .. ";")

	if relative_path == "" then
		return nil
	end

	return vim.fn.fnamemodify(relative_path, ":p")
end

lint.linters.actionlint.condition = function(ctx)
	return ctx.filename:find(".github")
end

lint.linters.solhint.condition = function(ctx)
	return not ctx.filename:find(".t.sol$")
end

lint.linters.eslint_d.condition = function(ctx)
	local root = find_nearest_directory(".git")
	if not root then
		return false
	end

	if vim.loop.fs_stat(root .. ".eslintrc.js") then
		return true
	end
end
