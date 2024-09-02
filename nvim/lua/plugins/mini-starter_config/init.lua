local vim = vim
local lazy = require("lazy")
local starter = require("mini.starter")
local ascii_headers = require("plugins.mini-starter_config.ascii_headers")

local ascii_header = ascii_headers.pikachu_header
-- local welcome_message = "Startup time: " .. lazy.stats().startuptime .. "ms"
local welcome_message = ""

local function get_header()
	-- return "Startup time: " .. lazy.stats().startuptime .. "ms" .. ascii_header
	return
		-- "\n\n\n\n"
		"\n"
		.. ascii_headers.tostring(ascii_header)
		-- .. "\n"
		-- .. welcome_message
		-- .. "\n"
end


local function items_get_maxlength(table)
	local result = -1

	for _, v in ipairs(table) do
		if type(v) == "table" then
			local name = v.name

			if name ~= nil then
				if result < string.len(name) then
					result = string.len(name)
				end
			end
		end
	end

	-- print("[DEBUG] MAXLENGTH = " .. result)
	return result
end


local recent_files_count = 0
local items = {
	starter.sections.recent_files(recent_files_count, false),

	{ name = "Config 󱧼 ", action = "e $HOME/.config/nvim", section = "Quick Goto" },
	{ name = "Personal Projects  ", action = "e $HOME/personal-projects", section = "Quick Goto" },

	{ name = "History  ", action = "FzfLua oldfiles", section = "Fuzzy Find" },
	{ name = "Colorschemes 󰏘 ", action = "FzfLua colorschemes", section = "Fuzzy Find" },

	{ name = "New File  ", action = "enew", section = "Other" },
	{ name = "Profile  ", action = "Lazy profile", section = "Other" },
	{ name = "Mason LSP 󰏖 ", action = 'Mason', section = "Other" },
	{ name = "Update Plugins 󰚰 ", action = 'Lazy sync', section = "Other" },
}


local function get_footer()
	local leading_newlines = "\n"
	local footers = {
		'Ok mais est-ce que ton code il est stable par la loi interne ?',
		'EST-CE QUE C\'EST MOI QUI EST À L\'ENVERS OU EST-CE QUE C\'EST L\'AFIT QUI EST À L\'ENVERS ?',
		'One day or day one',
		'Toujours la faute des arabes hein',
		'Emacs is a good operating system, too bad it didn\'t ship with a good editor',
		'Dites-moi c\'est donc vrai, la plume est plus forte que l\'épée',
		'Afit.zip est ton ami',
		'∀ x ∈ ℝ, x = 3 ⇒  ℝ = π²/6',
	}

	return leading_newlines .. footers[ math.random(#footers) ]
end


local content_hooks = {
	starter.gen_hook.padding(
		vim.o.co*0.5 - (items_get_maxlength(items) + recent_files_count),
		-- #items
		0
	),
}


local opts = {
	-- Whether to open starter buffer on VimEnter. Not opened if Neovim was
	-- started with intent to show something else.
	autoopen = true,

	-- Whether to evaluate action of single active item
	evaluate_single = false,

	-- Items to be displayed. Should be an array with the following elements:
	-- - Item: table with <action>, <name>, and <section> keys.
	-- - Function: should return one of these three categories.
	-- - Array: elements of these three types (i.e. item, array, function).
	-- If `nil` (default), default items will be used (see |mini.starter|).
	items = items,

	-- Header to be displayed before items. Converted to single string via
	-- `tostring` (use `\n` to display several lines). If function, it is
	-- evaluated first. If `nil` (default), polite greeting will be used.
	header = get_header,

	-- Footer to be displayed after items. Converted to single string via
	-- `tostring` (use `\n` to display several lines). If function, it is
	-- evaluated first. If `nil` (default), default usage help will be shown.
	footer = get_footer,

	-- Array  of functions to be applied consecutively to initial content.
	-- Each function should take and return content for 'Starter' buffer (see
	-- |mini.starter| and |MiniStarter.content| for more details).
	content_hooks = content_hooks,

	-- Characters to update query. Each character will have special buffer
	-- mapping overriding your global ones. Be careful to not add `:` as it
	-- allows you to go into command mode.
	query_updaters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-.',

	-- Whether to disable showing non-error feedback
	silent = false,
}


starter.setup(opts)
-- vim.cmd [[ intro ]]
