return {
	"phha/zenburn.nvim",
	"https://github.com/sainnhe/everforest",
	"savq/melange-nvim",
	"EdenEast/nightfox.nvim",
	"ellisonleao/gruvbox.nvim",
	"ajmwagar/vim-deus",
	"tomasr/molokai",
	"NLKNguyen/papercolor-theme",
	"liuchengxu/space-vim-dark",
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').setup {
				safe_labels = {}, -- label the first match as well. It is confusing when the first match is not labelled.
			}
			-- require('leap').add_default_mappings()
			vim.keymap.set('n', 'f', '<Plug>(leap-forward-to)', { desc = "Leap forward" })
			vim.keymap.set('n', 'F', '<Plug>(leap-backward-to)', { desc = "Leap backward" })


			vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
		end
	},
	{
		'vim-test/vim-test',
		config = function()
			vim.g['test#strategy'] = 'neovim'
			vim.g['test#neovim#start_normal'] = 1
		end
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require 'treesitter-context'.setup {
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			}
		end
	},
	-- {
	-- 	-- show function parameter completion from LSP (not working yet)
	-- 	'hrsh7th/cmp-nvim-lsp-signature-help',
	-- 	config = function()
	-- 		require 'cmp'.setup {
	-- 			sources = {
	-- 				{ name = 'nvim_lsp_signature_help' }
	-- 			}
	-- 		}
	-- 	end
	-- },
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require 'lsp_signature'.setup(opts) end
	},
	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = '~/Dropbox/vimwiki',
					syntax = 'default',
					ext = '.wiki',
				},
			}
		end,

	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			-- Optional: enable for markdown explicitly
			vim.g.copilot_filetypes = {
				markdown = true,
			}

			-- Optional: remap <Tab> to accept Copilot suggestions
			vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
			-- alternative keybinding for accepting suggestions
			vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
				expr = true,
				silent = true,
			})
		end,
	},
	-- {
	-- 	'github/copilot.vim',
	--
	-- },
	{
		'https://github.com/virchau13/tree-sitter-astro',
	},
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	dependencies = {
	-- 		{ "github/copilot.vim" },  -- or zbirenbaum/copilot.lua
	-- 		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	-- 	},
	-- 	build = "make tiktoken",           -- Only on MacOS or Linux
	-- 	opts = {
	-- 		-- See Configuration section for options
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },

	{
		'stevearc/quicker.nvim',
		event = "FileType qf",
		config = function()
			require("quicker").setup({
				edit = { enabled = true, autosave = "unmodified" }, -- Enable editing and autosave
				keys = {
					{
						">",
						function()
							require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
						end,
						desc = "Expand quickfix context",
					},
					{
						"<",
						function()
							require("quicker").collapse()
						end,
						desc = "Collapse quickfix context",
					},
				},

			})
		end,
	},
	{
		"kiyoon/treesitter-indent-object.nvim",
		keys = {
			{
				"ai",
				function() require 'treesitter_indent_object.textobj'.select_indent_outer() end,
				mode = { "x", "o" },
				desc = "Select context-aware indent (outer)",
			},
			{
				"aI",
				function() require 'treesitter_indent_object.textobj'.select_indent_outer(true) end,
				mode = { "x", "o" },
				desc = "Select context-aware indent (outer, line-wise)",
			},
			{
				"ii",
				function() require 'treesitter_indent_object.textobj'.select_indent_inner() end,
				mode = { "x", "o" },
				desc = "Select context-aware indent (inner, partial range)",
			},
			{
				"iI",
				function() require 'treesitter_indent_object.textobj'.select_indent_inner(true, 'V') end,
				mode = { "x", "o" },
				desc = "Select context-aware indent (inner, entire range) in line-wise visual mode",
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8", -- Use v2
		event = "BufReadPost",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup {
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			}
		end,
	},

}
