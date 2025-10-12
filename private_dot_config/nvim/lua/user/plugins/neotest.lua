return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"llllvvuu/neotest-foundry",
		"nvim-neotest/neotest-jest",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-foundry")({
					-- foundryCommand = "forge test --decode-internal"
					foundryCommand = "forge test --isolate"
				}),
				require("neotest-python"),
				require("neotest-jest"),
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
}
