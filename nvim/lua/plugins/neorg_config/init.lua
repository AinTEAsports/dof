require("neorg").setup({
    load = {
        ["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "varied"
			}
		},
		["core.esupports.hop"] = {},
		["core.esupports.indent"] = {
			config = {
				format_on_enter = true,
				format_on_escape = true,
			}
		},

		["core.dirman"] = {
			config = {
				workspaces = { classes = "~/epita/spe/classes" },
				index = "index.norg"
			}
		},

		-- ["core.completion"] = {
		-- 	config = {
		-- 		engine = "nvim-cmp"
		-- 	}
		-- },

		["core.integrations.treesitter"] = {},
		["core.looking-glass"] = {},
		["core.ui.calendar"] = {},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
			}
		},

		["core.export"] = {},
		["core.export.markdown"] = {},
    }
})
