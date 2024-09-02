local vim = vim
local _ = require("plugins.lualine_config.colors")

function spacefunc()
	return " "
end

function get_current_lsp()
	-- local default_msg = "No LSP"
	local default_msg = ""
	local lsp_nerd_icon = "󱂀 "

	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()

	if next(clients) == nil then
		return default_msg
	end

	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return string.format("%s%s", lsp_nerd_icon, client.name)
		end
	end

	return string.format("󱂀 %s", default_msg)
end



function is_recording_macro()
	local default_msg = " "
	local reg = vim.fn.reg_recording()

	if reg == "" then return default_msg
	else return "  Recording macro to [" .. reg .. "]"
	end
end



local custom_filetype = require("lualine.components.filetype"):extend()
local highlight = require("lualine.highlight")
local default_status_colors = { saved = '#228B22', modified = '#C70039' }



function custom_filetype:init(options)
	custom_filetype.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
		{bg = default_status_colors.saved}, 'filename_status_saved', self.options),
		modified = highlight.create_component_highlight_group(
		{bg = default_status_colors.modified}, 'filename_status_modified', self.options),
	}
	if self.options.color == nil then self.options.color = '' end
end



function custom_filetype:update_status()
	local data = custom_filetype.super.update_status(self)
	data = highlight.component_format_highlight(vim.bo.modified
	and self.status_colors.modified
	or self.status_colors.saved) .. data

	return string.sub(data, 1, 1)
end


function custom_mode()
	local modes = {
		n  = 'NORMAL',
		no = 'OPERATOR-PENDING',
		niI= 'INSERT (before character)',
		i  = 'INSERT',
		nt = 'TERMINAL',
		v  = 'VISUAL',
		V  = 'LINE VISUAL',
		s  = 'SELECT',
		S  = 'SURROUND SELECT',
		ic = 'COMMAND-LINE EDITING',
		RP = 'REPLACING BLOCK WITH REGISTER',
		c  = 'COMMAND',
		t  = 'TERMINAL'
	}

	local colors = {
		n   = '#cad3f5',
		no  = '#ffffff',
		niI = '#b7bdf8',
		i   = '#b7bdf8',
		-- niI = '#F79E42',
		-- i   = '#F79E42',
		nt  = '#a6da95',
		v   = '#8aadf4',
		V   = '#91d7e3',
		s   = '#ff0000',
		S   = '#ff0000',
		ic  = '#cad3f5',
		RP  = '#f5a97f',
		c   = '#a6da95',
		t   = '#a6da95',
	}

	local mode = vim.fn.mode()
	local result = modes[mode]
	local color = colors[mode]

	if result == nil then result = "UNKNOWN"
	elseif result == "INSERT" then result = "-- " .. result .. " --"
	-- else result = " " .. result
	end

	return result, color
end
