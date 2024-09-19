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
		"RRethy/nvim-align",
		lazy = true,
		cmd = "Align"
	},

	-- NOTE: END OF USEFUL PLUGINS




	-- NOTE: START OF CRITICAL PLUGINS
	{ "onsails/lspkind.nvim", },
	{ 'hrsh7th/nvim-cmp',        lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-nvim-lsp',    lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-buffer',      lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-path',        lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/vim-vsnip',       lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/vim-vsnip-integ', lazy = true, event = "InsertEnter", },
	{ 'hrsh7th/cmp-cmdline',     lazy = true, event = "CmdlineEnter", },

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


	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		event = "UIEnter",
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
		-- lazy = true,
		-- cmd = { "Oil", "OilFloat" },
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
		lazy = true,
		ft = require("plugins.treesitter_config.required_parsers"),
		build = "<cmd>TSUpdate",
		config = function()
			require("plugins.treesitter_config")
		end
	},

	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = { "Mason", "MasonLog", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
		config = function()
			require("plugins.mason_config")
		end
	},

	{
		"folke/todo-comments.nvim",
		event = "UIEnter",
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
