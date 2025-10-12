return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
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
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			local python_exe = nil

			if vim.fn.executable("python") == 1 then
				python_exe = "python"
			end
			if vim.fn.executable("ipython") == 1 then
				python_exe = "ipython"
			end
			if vim.fn.executable("bpython") == 1 then
				python_exe = "bpython"
			end

			if python_exe ~= nil then
				local Terminal = require("toggleterm.terminal").Terminal
				local repl = Terminal:new({
					cmd = python_exe,
					dir = "git_dir",
				})

				vim.keymap.set("n", "<leader>p", function()
					repl:toggle()
				end, { desc = "Python" })
			end
		end,
	},
}
