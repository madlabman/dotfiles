return {
	{
		"mhinz/vim-startify",
		config = function()
			vim.g.startify_change_to_dir = 0
			vim.g.startify_change_to_vcs_root = 1
			vim.g.startify_session_persistence = 1
			-- vim.g.startify_session_autoload = 1  -- Session.vim is loaded automatically
		end,
	},
}
