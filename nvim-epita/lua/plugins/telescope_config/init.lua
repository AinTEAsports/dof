local telescope = require("telescope")

-- require("telescope").setup({})
-- require("telescope").load_extension("ui-select")

-- -- local path_actions = require('telescope_insert_path')

-- -- require('telescope').setup {
-- --   defaults = {
-- --     mappings = {
-- --       n = {
-- --         ["pi"] = path_actions.insert_relpath_i_insert,
-- --         ["pI"] = path_actions.insert_relpath_I_insert,
-- --         ["pa"] = path_actions.insert_relpath_a_insert,
-- --         ["pA"] = path_actions.insert_relpath_A_insert,
-- --         ["po"] = path_actions.insert_relpath_o_insert,
-- --         ["pO"] = path_actions.insert_relpath_O_insert,
-- --         ["Pi"] = path_actions.insert_abspath_i_insert,
-- --         ["PI"] = path_actions.insert_abspath_I_insert,
-- --         ["Pa"] = path_actions.insert_abspath_a_insert,
-- --         ["PA"] = path_actions.insert_abspath_A_insert,
-- --         ["Po"] = path_actions.insert_abspath_o_insert,
-- --         ["PO"] = path_actions.insert_abspath_O_insert,
-- --         ["<leader>pi"] = path_actions.insert_relpath_i_visual,
-- --         ["<leader>pI"] = path_actions.insert_relpath_I_visual,
-- --         ["<leader>pa"] = path_actions.insert_relpath_a_visual,
-- --         ["<leader>pA"] = path_actions.insert_relpath_A_visual,
-- --         ["<leader>po"] = path_actions.insert_relpath_o_visual,
-- --         ["<leader>pO"] = path_actions.insert_relpath_O_visual,
-- --         ["<leader>Pi"] = path_actions.insert_abspath_i_visual,
-- --         ["<leader>PI"] = path_actions.insert_abspath_I_visual,
-- --         ["<leader>Pa"] = path_actions.insert_abspath_a_visual,
-- --         ["<leader>PA"] = path_actions.insert_abspath_A_visual,
-- --         ["<leader>Po"] = path_actions.insert_abspath_o_visual,
-- --         ["<leader>PO"] = path_actions.insert_abspath_O_visual,
-- --         -- Additionally, there's normal mode mappings for the same actions:
-- --         -- ["<leader><leader>pi"] = path_actions.insert_relpath_i_normal,
-- --         -- ...
-- --       }
-- --     }
-- --   }
-- -- }


-- -- CURRENT_THEME = vim.cmd("colorscheme")
-- -- print( string.format("COLORSCHEME IS %s", CURRENT_THEME) )

-- -- require("telescope").setup({
-- -- 	pickers = {
-- -- 		colorscheme = {
-- -- 			enable_preview = true,

-- -- 			on_cancel = function()
-- -- 				vim.cmd( string.format("colorscheme %s", CURRENT_THEME) )
-- -- 				print("ON CANCEL")
-- -- 			end,

-- -- 			on_hover = function (colorscheme)
-- -- 				vim.cmd( string.format("colorscheme %s", colorscheme) )
-- -- 				print("ON HOVER")
-- -- 			end,

-- -- 			on_change = function (colorscheme)
-- -- 				vim.cmd( string.format("colorscheme %s", colorscheme) )
-- -- 				print("ON CHANGE")
-- -- 			end
-- -- 		}
-- -- 	}
-- -- })


-- local present, telescope = pcall(require, "telescope")

-- if not present then
--   return
-- end

-- vim.g.theme_switcher_loaded = true

-- -- require("base46").load_highlight "telescope"

-- local options = {
--   defaults = {
--     vimgrep_arguments = {
--       "rg",
--       "-L",
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--       "--smart-case",
--     },
--     prompt_prefix = "   ",
--     selection_caret = "  ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "ascending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         prompt_position = "top",
--         preview_width = 0.55,
--         results_width = 0.8,
--       },
--       vertical = {
--         mirror = false,
--       },
--       width = 0.87,
--       height = 0.80,
--       preview_cutoff = 120,
--     },
--     file_sorter = require("telescope.sorters").get_fuzzy_file,
--     file_ignore_patterns = { "node_modules" },
--     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--     path_display = { "truncate" },
--     winblend = 0,
--     border = {},
--     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--     color_devicons = true,
--     set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--     mappings = {
--       n = { ["q"] = require("telescope.actions").close },
--     },
--   },

--   extensions_list = { "themes", "terms" },
-- }

-- -- check for any override
-- -- options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
-- telescope.setup(options)

-- -- load extensions
-- pcall(function()
--   for _, ext in ipairs(options.extensions_list) do
--     telescope.load_extension(ext)
--   end
-- end)



local options = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=always",
			"--glob",
			"--no-heading",
			"--with-filename",
			"--files-with-matches",
			"--line-number",
			"--column",
			"--smart-case",
		},

		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate", "filename_first" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},

	extensions_list = { "themes", "terms" },
}

telescope.setup(options)
telescope.load_extension("noice")
