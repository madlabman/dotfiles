return {
	{
		"olimorris/codecompanion.nvim",
		opts = {
			adapters = {
				llama = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "llama",
						formatted_name = "llama.cpp",
						schema = {
							model = {
								default = "FOSS",
							},
						},
						env = {
							url = "http://127.0.0.1:8080",
						},
					})
				end,
			},
			strategies = {
				inline = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4",
						_ = {
							"gpt-4.1",
							"gpt-5-mini",
							"gpt-5",
							"gpt-3.5-turbo",
							"gpt-4o-mini",
							"gpt-4",
							"gpt-4o",
							"o3-mini",
							"claude-sonnet-4",
							"gemini-2.0-flash-001",
							"gemini-2.5-pro",
							"o4-mini",
						},
					},
				},
				chat = { adapter = "llama" },
			},
			prompt_library = {
				["Fix grammar"] = {
					strategy = "inline",
					description = "Fix grammar in the selected text block",
					opts = {
						index = 1,
						is_default = true,
						is_slash_cmd = true,
						modes = { "v" },
						short_name = "grammar",
						auto_submit = true,
						user_prompt = false,
						stop_context_insertion = true,
					},
					prompts = {
						{
							role = "system",
							content = [[When asked to fix grammar or improve text, follow these steps:

1. **Identify the Issues**: Carefully read the provided text and identify any grammar, spelling, punctuation, or clarity issues.
2. **Plan the Fix**: Describe the plan for improving the text, detailing each type of correction needed.
3. **Implement the Fix**: Write the corrected text in a single code block (preserving comment syntax if applicable).

Ensure the fixed text:

- Maintains the original meaning and intent.
- Uses correct grammar, spelling, and punctuation.
- Improves clarity and readability where needed.
- Preserves the original formatting structure (including comment block syntax).
- Uses consistent style and tone.

For comment blocks, maintain the appropriate comment syntax for the programming language (e.g., `//`, `#`, `/* */`, `--`) while fixing the text content within.]],
						},
						{
							role = "user",
							content = function(context)
								local code = require("codecompanion.helpers.actions").get_code(
									context.start_line,
									context.end_line
								)

								return string.format(
									[[Please fix grammar in this text from buffer %d:

```%s
%s
```
]],
									context.bufnr,
									context.filetype,
									code
								)
							end,
							opts = {
								contains_code = true,
							},
						},
					},
				},
			},
			display = {
				chat = {
					window = {
						opts = {
							number = false,
						},
					},
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"j-hui/fidget.nvim",
		},
		init = function()
			vim.cmd([[cab cc CodeCompanion]])
			vim.cmd([[cab ccc CodeCompanionChat]])

			local group = vim.api.nvim_create_augroup("codecompanion.notification", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestStarted",
				group = group,
				callback = function(request)
					local function model_name(adapter)
						local parts = {}
						table.insert(parts, adapter.formatted_name)
						if adapter.model and adapter.model ~= "" then
							table.insert(parts, "(" .. adapter.model .. ")")
						end
						return table.concat(parts, " ")
					end

					local progress = require("fidget.progress")
					CODECOMPANION_FIDGET_HANDLE = progress.handle.create({
						title = "CodeCompanion",
						message = "  LLM is crunching...",
						lsp_client = { name = model_name(request.data.adapter) },
					})
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "CodeCompanionRequestFinished",
				group = group,
				callback = function(request)
					if CODECOMPANION_FIDGET_HANDLE ~= nil then
						CODECOMPANION_FIDGET_HANDLE:finish()
					end
				end,
			})
		end,
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	-- cmd = "Copilot",
	-- 	lazy = false,
	-- },
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "BufReadPost",
	-- 	opts = {
	-- 		suggestion = {
	-- 			auto_trigger = true,
	-- 			keymap = {
	-- 				accept = "<Right>",
	-- 				next = "<M-]>",
	-- 				prev = "<M-[>",
	-- 			},
	-- 		},
	-- 		panel = { enabled = false },
	-- 		filetypes = {},
	-- 	},
	-- },
}
