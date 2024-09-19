local _ = require("plugins.lualine_config.colors")

return {
	options = {
		theme = minimalist_theme,
		component_separators = '  ',
		normal = { c = { fg = colors.fg, bg = colors.bg } },
		inactive = { c = { fg = colors.fg, bg = colors.bg } },
		-- section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			-- { 'mode' },
			{
				function()
					local mode_str, _ = custom_mode()
					return mode_str
				end,
				color = function()
					local _, color = custom_mode()
					return { fg = color, gui = "" }
				end
			},

			-- {
			-- 	require("noice").api.status.mode.get,
			-- 	cond = require("noice").api.status.mode.has,
			-- 	color = { fg = "#ff9e64" },
			-- },
		},

		-- lualine_b = { 'filename',  'branch', 'diagnostics' },
		lualine_b = {
			{
				'filename',
				color = { fg = "#c6a0f6", gui = "bold" },
			},

			'location',
			-- spacefunc,
		},
		-- lualine_b = { charlogo, 'filename', 'branch', 'diagnostics' },
		-- lualine_b = { 'filename', custom_filetype },

		-- lualine_c = { 'fileformat' },
		lualine_c = {
			spacefunc,
		},

		lualine_x = {
			-- {
			-- 	require("noice").api.status.command.get,
			-- 	cond = require("noice").api.status.command.has,
			-- 	color = { fg = "#ff9e64" },
			-- },

			-- { function() return require("screenkey").get_keys() end },
			-- { function() return require("keys").current_keys(true) end },
			{ is_recording_macro },
			-- { spacefunc },
		},

		-- lualine_y = { 'filetype', get_current_lsp, 'progress' },
		-- lualine_y = { { require("recorder").recordingStatus }, { 'filetype' }, { get_current_lsp } },
		-- lualine_y = { { spacefunc }, { 'filetype' }, { get_current_lsp } },
		lualine_y = {
			{ function() return require("keys").current_keys(true) end },
			-- {
			-- 	function()
			-- 		local keys = require("screenkey").get_keys()
			--
			-- 		if keys == "" then return " "
			-- 		else return keys end
			-- 	end
			-- },

			{ spacefunc },

			{
				'diff',
				-- Is it me or the symbol for modified us really weird
				-- symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
				symbols = { added = '+:', modified = '~:', removed = '-:' },
				diff_color = {
					added = { fg = "#3DED97" },
					modified = { fg = "#F8F805" },
					removed = { fg = "#FF0000" },
				},
				-- cond = conditions.hide_in_width,
			},

			{
				'diagnostics',
				-- symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
				symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
				diagnostics_color = {
					-- color_error = { fg = "#F34E5F" },
					color_error = { fg = "#FF0000" },
					color_warn = { fg = "#FFE780" },
					color_info = { fg = "#6AE4FC" },
					color_hint = { fg = "#3DED97" },
				},
			},

			{ get_current_lsp },
			{ 'filetype' },
		},


		lualine_z = {
			-- { 'location', separator = { right = ' ' }, left_padding = 2 },
			-- { 'location' },
		},
	},

	inactive_sections = {
		-- lualine_a = { 'filename', },
		lualine_a = {},

		lualine_b = {},
		-- lualine_b = { 'diagnostics' },

		lualine_c = {},


		lualine_x = {},

		-- lualine_y = { get_current_lsp },
		lualine_y = {},

		lualine_z = {},
	},
	tabline = {},
	extensions = {},

	symbols = {
		modified = ' ●',      -- Text to show when the buffer is modified
		alternate_file = '#', -- Text to show to identify the alternate file
		directory =  '',     -- Text to show when the buffer is a directory
	},
}
