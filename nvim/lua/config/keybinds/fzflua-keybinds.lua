vim.keymap.set("n", "<A-g>e", function()
	local curr_path = vim.fn.expand("%:p:h"):gsub(
		string.format("%%%s", os.getenv("HOME")),
		"~"
	)

	local function on_submit(path)
		-- local osp = "oil://"

		-- print(path.sub(1, string.len(osp)))
		-- if path.sub(path, 1, string.len(osp)) == osp then
		-- 	local checked_path = path:sub(7, string.len(path))
		-- 	print( string.format("CHECKED PATH: %s", checked_path) )

		-- 	vim.cmd( string.format("FzfLua files cwd=%s", checked_path) )
		-- else
		-- 	print("NOOOOOOOO ELSE")
		vim.cmd(string.format("FzfLua files cwd=%s", path))
		-- end
	end

	local Input = require("nui.input")

	local popup_options = {
		border = {
			style = "rounded",
			text = {
				top = "[Path]",
				top_align = "center"
			},
		},

		highlight = "Normal:Normal",

		position = {
			row = vim.o.lines * 0.4,
			col = vim.o.co / 2 - string.len(curr_path) / 2,
		},

		size = {
			-- width = string.len(curr_path) + 2,
			width = math.max(unpack({ string.len(curr_path) + 2, 8 })),
			height = 1,
		},
	}



	-- local function clear_oil(path, osp) do
	-- 	-- if path.sub(path, 1, string.len(osp)) == osp then return path:sub(7, string.len(path))
	-- 	-- else return path end
	-- 	print("yo")
	-- end

	-- local curr_checked_path = clear_oil(curr_path, "oil://")

	local osp = "oil://"
	local curr_checked_path = (curr_path.sub(curr_path, 1, string.len(osp)) == osp) and
		curr_path:sub(7, string.len(curr_path)) or curr_path

	-- local input = Input(popup_options, {
	-- 	-- default_value = curr_path:gsub(home_path, "~"),
	-- 	default_value = curr_checked_path,
	-- 	on_submit = on_submit,
	-- 	prompt = "",
	-- })

	-- input:mount()
	on_submit(curr_checked_path)
end, { desc = "FzfLua find files in current directory" })


vim.keymap.set("n", "<A-g>f", "<cmd>FzfLua blines<CR>", { desc = "FzfLua line fuzzy find" })
vim.keymap.set("n", "<A-g>", "<cmd>FzfLua buffers<CR>", { desc = "FzfLua buffer fuzzy find" })
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua oldfiles<CR>", { desc = "FzfLua history files fuzzy find" })
-- vim.keymap.set("n", "<A-0>", ":FzfLua lsp_workspace_symbols<CR>")
-- vim.keymap.set("n", "gd", ":FzfLua lsp_definitions<CR>")
-- vim.keymap.set("n", "<leader><A-g><A-d>", ":FzfLua lsp_references<CR>")

-- vim.keymap.set("n", "<leader>fs", function()
-- 	local fzf_lua_command = string.format(":FzfLua files cwd=%s", vim.loop.cwd())
-- 	vim.cmd(fzf_lua_command)
-- end)

vim.keymap.set("n", "<A-g>z", function()
	local curr_path = vim.fn.expand("%:p:h"):gsub(
		string.format("%%%s", os.getenv("HOME")),
		"~"
	)

	local function on_submit(path)
		-- local osp = "oil://"

		-- print(path.sub(1, string.len(osp)))
		-- if path.sub(path, 1, string.len(osp)) == osp then
		-- 	local checked_path = path:sub(7, string.len(path))
		-- 	print( string.format("CHECKED PATH: %s", checked_path) )

		-- 	vim.cmd( string.format("FzfLua files cwd=%s", checked_path) )
		-- else
		-- 	print("NOOOOOOOO ELSE")
		vim.cmd(string.format("FzfLua files cwd=%s", path))
		-- end
	end

	local Input = require("nui.input")

	local popup_options = {
		border = {
			style = "rounded",
			text = {
				top = "[Path]",
				top_align = "center"
			},
		},

		highlight = "Normal:Normal",

		position = {
			row = vim.o.lines * 0.4,
			col = vim.o.co / 2 - string.len(curr_path) / 2,
		},

		size = {
			-- width = string.len(curr_path) + 2,
			width = math.max(unpack({ string.len(curr_path) + 2, 8 })),
			height = 1,
		},
	}



	-- local function clear_oil(path, osp) do
	-- 	-- if path.sub(path, 1, string.len(osp)) == osp then return path:sub(7, string.len(path))
	-- 	-- else return path end
	-- 	print("yo")
	-- end

	-- local curr_checked_path = clear_oil(curr_path, "oil://")

	local osp = "oil://"
	local curr_checked_path = (curr_path.sub(curr_path, 1, string.len(osp)) == osp) and
		curr_path:sub(7, string.len(curr_path)) or curr_path

	local input = Input(popup_options, {
		-- default_value = curr_path:gsub(home_path, "~"),
		default_value = curr_checked_path,
		on_submit = on_submit,
		prompt = "",
	})

	input:mount()
end, { desc = "FzfLua input file fuzzy find" })

	-- vim.keymap.set("n", "<leader>ff", ":FzfLua lgrep_curbuf<CR>")
