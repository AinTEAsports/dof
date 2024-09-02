-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local plugins = {
	-- NOTE: START OF USELESS PLUGINS
	{
		"AndrewRadev/typewriter.vim",
		lazy = true,
		cmd = { "TypewriterToggle", "TypewriterEnable", "TypewriterDisable" },
	},

	-- {
	-- 	"tamton-aquib/flirt.nvim",
	-- 	event = "UIEnter",
	-- 	config = true,
	-- },

	{
		"seandewar/killersheep.nvim",
		lazy = true,
		cmd = "KillKillKill",
		opts = {
			gore = true,           -- Enables/disables blood and gore.
			keymaps = {
				move_left = "h",     -- Keymap to move cannon to the left.
				move_right = "l",    -- Keymap to move cannon to the right.
				shoot = "<Space>",   -- Keymap to shoot the cannon.
			},
		},
	},

	{
		"NStefan002/donut.nvim",
		version = "*",
		lazy = true,
		cmd = "Donut",
		config = function()
			require("donut").setup({
				timeout = 0, -- set to 0 to disable (can still be triggered manually with :Donut command)
				sync_donuts = true,
			})
		end
	},


	{
		"NStefan002/screenkey.nvim",
		lazy = true,
		cmd = "Screenkey",
		config = function()
			vim.cmd [[ hi NormalFloat guibg=none ]]
			require("screenkey").setup({
				win_opts = {
					relative = "editor",
					anchor = "SE",
					width = 50,
					height = 3,
					border = "rounded",
				},
			})
		end
	},

	-- NOTE: END OF USELESS PLUGINS --



	-- NOTE: START OF USEFUL PLUGINS
	{
		'Wansmer/treesj',
		lazy = true,
		cmd = "TSJToggle",
		config = function()
			require("treesj").setup({})
		end
	},

	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim'
		}
	},

	{
		'ellisonleao/glow.nvim',
		lazy = true,
		cmd = "Glow",
		ft = "markdown"
	},


	{
		"niuiic/track.nvim",
		dependencies = {
			"niuiic/core.nvim",
			"nvim-telescope/telescope.nvim"
		},
		lazy = true,
		cmd = {
			"ToggleMark",
			"RemoveAllMarks",
			"JumpToNextMark",
			"JumpToPrevMark",
			"EditMark",
			"SearchMarks"
		},
		config = true,
	},

	{
		"RRethy/nvim-align",
		lazy = true,
		cmd = "Align"
	},

	-- NOTE: END OF USEFUL PLUGINS




	-- NOTE: START OF CRITICAL PLUGINS
	{
		'alaviss/nim.nvim',
		lazy = true,
		ft = "nim"
	},

	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{ "onsails/lspkind.nvim", event = "VeryLazy" },

	{ 'hrsh7th/nvim-cmp',        lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-nvim-lsp',    lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-buffer',      lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-path',        lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/vim-vsnip',       lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/vim-vsnip-integ', lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-cmdline',     lazy = true, event = "CmdlineEnter", },

	{
		"RRethy/nvim-align",
		lazy = true,
		cmd = "Align"
	},

	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("codeium").setup({ })
		end
	},

	{
		"folke/lazydev.nvim",
		lazy = true,
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv"} }
			}
		}
	},

	{
		"NvChad/nvterm",
		event = "VeryLazy",
		config = function ()
			require("nvterm").setup({
				terminals = {
					shell = vim.o.shell,
					list = {},
					type_opts = {
						float = {
							relative = 'editor',
							row = 0.3,
							col = 0.25,
							width = 0.5,
							height = 0.4,
							border = "single",
						},
						horizontal = { location = "rightbelow", split_ratio = .3, },
						vertical = { location = "rightbelow", split_ratio = .5 },
					}
				},
				behavior = {
					autoclose_on_quit = {
						enabled = false,
						confirm = true,
					},
					close_on_exit = true,
					auto_insert = true,
				},
			})
		end,
	},


	{
		"google/executor.nvim",
		lazy = true,
		cmd = { "ExecutorRun", "ExecutorReset", "ExecutorOneOff", "ExecutorHideDetail", "ExecutorSetCommand", "ExecutorShowDetail", "ExecutorShowPresets", "ExecutorSwapToPopup", "ExecutorSwapToSplit", "ExecutorToggleDetail" },
		config = function()
			require("executor").setup({})
		end,
	},

	{
		"michaelb/sniprun",
		branch = "master",
		lazy = true,
		ft = { "norg", "md" },
		cmd = { "SnipRun", "SnipInfo", "SnipClose", "SnipReset" },

		build = "sh install.sh",
		-- do 'sh install.sh 1' if you want to force compile locally
		-- (instead of fetching a binary from the github release). Requires Rust >= 1.65

		config = function()
			require("sniprun").setup({
				display = {
					"Classic",                    --# display results in the command-line  area
					"VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)

					-- "VirtualText",             --# display results as virtual text
					-- "TempFloatingWindow",      --# display results in a floating window
					-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
					-- "Terminal",                --# display results in a vertical split
					-- "TerminalWithCode",        --# display results and code history in a vertical split
					-- "NvimNotify",              --# display with the nvim-notify plugin
					-- "Api"                      --# return output to a programming interface
				},

				live_display = { "VirtualTextOk" }, --# display mode used in live_mode
				live_mode_toggle = "enable",

				display_options = {
					terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
					terminal_line_number = false, --# whether show line number in terminal window
					terminal_signcolumn = false,  --# whether show signcolumn in terminal window
					terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
					terminal_width = 45,          --# change the terminal display option width (if vertical)
					terminal_height = 20,         --# change the terminal display option height (if horizontal)
					notification_timeout = 5      --# timeout for nvim_notify output
				},
			})
		end,
	},

	{
		"RRethy/nvim-align",
		lazy = true,
		cmd = "Align"
	},





	{
		"3rd/image.nvim",
		lazy = true,
		ft = { "markdown", "norg" },
		config = function()
			-- default config
			require("image").setup({
				backend = "kitty",
				kitty_method = "normal",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
						resolve_image_path = function(document_path, image_path, fallback)
							-- document_path is the path to the file that contains the image
							-- image_path is the potentially relative path to the image. for
							-- markdown it's `![](this text)`

							-- you can call the fallback function to get the default behavior
							return fallback(document_path, image_path)
						end,
					},
					neorg = {
						enabled = true,
						clear_in_insert_mode = false,
						download_remote_images = true,
						only_render_image_at_cursor = false,
						filetypes = { "norg" },
					},
					html = {
						enabled = false,
					},
					css = {
						enabled = false,
					},
				},
				max_width = nil,
				max_height = nil,
				max_width_window_percentage = nil,
				max_height_window_percentage = 50,
				window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
				editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
				tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
			})
		end
	},


	{
		"OXY2DEV/markview.nvim",
		lazy = true,      -- Recommended
		ft = "markdown", -- If you decide to lazy-load anyway

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",

			"nvim-tree/nvim-web-devicons"
		}
	},

	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
		opts = {
			-- https://symbl.cc/en/search/?q=vertical
			signs = {
				add = {
					text = '+'
					-- text = '❙'
				},
				change = {
					text = '~'
					-- text = '❙'
				},
				delete = {
					text = '_',
					-- text = '❙'
				},
				topdelete = {
					text = '‾',
					-- text = '❙',
				},
				changedelete = {
					text = '~',
					-- text = '❙',
				},
			},
		},
	},


	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
	},

	{
		'ibhagwan/fzf-lua',
		lazy = true,
		cmd = "FzfLua"
	},

	{
		'stevearc/oil.nvim',
		lazy = true,
		cmd = { "Oil", "OilFloat" },
		-- Optional dependencies
		dependencies = {
			{
				"echasnovski/mini.icons",
				opts = {},
				lazy = true,
				cmd = { "Oil", "OilFloat" }
			},
			{
				"mimikun/oil-image-preview.nvim",
				lazy = true,
				cmd = { "Oil", "OilFloat" }
			},
		},
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("plugins.oil_config")
		end
	},

	{
		"David-Kunz/gen.nvim",
		lazy = true,
		cmd = "Gen",
		opts = {
			model = "deepseek-coder:6.7b",
			display_mode = "split";
			show_prompt = true,
			no_auto_close = true
		}
	},

	{
		"vhyrro/luarocks.nvim",
		lazy = true,
		ft = "norg",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		version = "*", -- Pin Neorg to the latest stable release
		lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		ft = "norg",
		config = function()
			require("plugins.neorg_config")
		end
	},

{
		"LunarVim/bigfile.nvim",
		event = "VeryLazy",
		config = function()
			-- local ibl = {
			-- 	name = "ibl", -- name
			--
			-- 	opts = {
			-- 		defer = false, -- set to true if `disable` should be called on `BufReadPost` and not `BufReadPre`
			-- 	},
			--
			-- 	disable = function()
			-- 		vim.cmd "IBLDisable"
			-- 	end,
			-- }


			require("bigfile").setup {
				filesize = 5, -- size of the file in MiB, the plugin round file sizes to the closest MiB
				pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
				features = { -- features to disable
					-- "tabnine",
					-- ibl,
					"indent_blankline",
					"illuminate",
					"lsp",
					"treesitter",
					"syntax",
					"matchparen",
					"vimopts",
					"filetype",
				},
			}
		end
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = true
	},

	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("plugins.lualine_config")
		end
	},

	{
		'f-person/git-blame.nvim',
		-- lazy = true,
		-- cmd = "GitBlame",
		event = "VeryLazy",
		config = true
	},

	{
		'folke/trouble.nvim',
		lazy = true,
		cmd = "Trouble",
		config = true
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = "<cmd>TSUpdate",
		config = function()
			-- local configs = require("nvim-treesitter.configs")
			--
			-- configs.setup({
			-- 	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
			-- 	sync_install = false,
			-- 	highlight = { enable = true },
			-- 	indent = { enable = true },  
			-- })

			require("plugins.treesitter_config")
		end
	},

	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = { "Mason" },
		config = function()
			require("plugins.mason_config")
		end
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {
			keywords = {
				FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
				TODO = { icon = "󱝏 ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "⏲ ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "HINT" } },
				TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			}
		}
	},


	-- NOTE: beginning of colorschemes
	{
		"eldritch-theme/eldritch.nvim",
		lazy = true,
	},

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},


	{
		"scottmckendry/cyberdream.nvim",
		lazy = true,
		opts = {
			-- Recommended - see "Configuring" below for more config options
			transparent = true,
			italic_comments = true,
			hide_fillchars = true,
			borderless_telescope = true,
			terminal_colors = true,
		}
	},

	{
		"Anfigeno/mestizo.nvim",
		lazy = false,
	},
	-- NOTE: end of colorschemes


	{
		"xiyaowong/transparent.nvim",
		priority = 1000,
	},

	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		lazy = true,
		cmd = "UndotreeToggle",
		config = true,
	},

	{
		'smoka7/hop.nvim',
		version = "*",
		lazy = true,
		cmd = {
			"HopWord", "HopWordBC", "HopWordAC", "HopWordCurrentLine",
			"HopWordCurrentLineBC", "HopWordCurrentLineAC", "HopWordMW", "HopPattern",
			"HopPatternBC", "HopPatternAC", "HopPatternCurrentLine", "HopPatternCurrentLineBC",
			"HopPatternCurrentLineAC", "HopPatternMW", "HopChar1", "HopChar1BC",
			"HopChar1AC", "HopChar1CurrentLine", "HopChar1CurrentLineBC", "HopChar1CurrentLineAC",
			"HopChar1MW", "HopChar2", "HopChar2BC", "HopChar2AC",
			"HopChar2CurrentLine", "HopChar2CurrentLineBC", "HopChar2CurrentLineAC", "HopChar2MW",
			"HopLine", "HopLineBC", "HopLineAC", "HopLineCurrentLine",
			"HopLineCurrentLineBC", "HopLineCurrentLineAC", "HopLineMW", "HopLineStart",
			"HopLineStartBC", "HopLineStartAC", "HopLineStartCurrentLine", "HopLineStartCurrentLineBC",
			"HopLineStartCurrentLineAC", "HopLineStartMW", "HopVertical", "HopVerticalBC",
			"HopVerticalAC", "HopVerticalMW", "HopAnywhere", "HopAnywhereBC",
			"HopAnywhereAC", "HopAnywhereCurrentLine", "HopAnywhereCurrentLineBC", "HopAnywhereCurrentLineAC",
			"HopAnywhereMW", "HopPasteChar1", "HopPasteChar1BC", "HopPasteChar1AC",
			"HopPasteChar1CurrentLine", "HopPasteChar1CurrentLineBC", "HopPasteChar1CurrentLineAC", "HopYankChar1",
			"HopYankChar1BC", "HopYankChar1AC", "HopYankChar1CurrentLine", "HopYankChar1CurrentLineBC",
			"HopYankChar1CurrentLineAC",
		},
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		}
	}
	-- NOTE: END OF CRITICAL PLUGINS
}


-- Setup lazy.nvim
require("lazy").setup(plugins, {
  -- spec = {
  --   -- import your plugins
  --   { import = "plugins" },
  -- },
  --
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
