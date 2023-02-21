local previewers = require("telescope.previewers")

local largeFilesIgnoringPreviewer = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then return end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

require("telescope").setup {
	defaults = {
		buffer_previewer_maker = largeFilesIgnoringPreviewer,
		wrap_results = true,
		sorting_strategy = "ascending",
		file_ignore_patterns = { ".git/" }
	},
	pickers = {
		oldfiles = { initial_mode = "normal", },
		find_files = { hidden = true, },
		git_files = { show_untracked = true }
	}
}
local module = {}

local live_grep_in_glob = function(glob_pattern)
	require('telescope.builtin').live_grep({
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob=" .. (glob_pattern or ""),
		}
	})
end
module.live_grep_in_glob = function()
	vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end
return module
