function watch_file(split_way)
	-- NOTE: TO CHECK IF A DIR EXISTS (can't watch something in dir oil:///path/to/something)
	-- ```lua
	-- local cwd = vim.api.nvim_get_cwd()
	-- local stat = vim.loop.fs_stat(cwd)
	-- if not stat then
	-- 	print("Directory does not exist")
	-- else
	-- 	print("Directory exists")
	-- end
	-- ```

	local prompt = "[Watch Command] enter a command to run: "
	local watch_commmand = vim.fn.input(prompt)

	if watch_commmand == "" then
	return
	end

	local curr_filename = vim.fn.expand("%:p")
	local cleared_command = string.gsub(
	watch_commmand,
	"%%$",
	" " .. curr_filename
	)
	local watch_command = string.format(
	"find %s -type f 2>/dev/null | entr -s \"clear && %s\" && exit",
	vim.fn.expand("%:p:h"),
	cleared_command
	)

	require("nvterm.terminal").close_all_terms()
	require("nvterm.terminal").send(watch_command, split_way)
end



vim.keymap.set("n", "<leader>wa", function() watch_file("vertical") end, { desc = "Vertical live command run" })
vim.keymap.set("n", "<leader>wq", function() watch_file("horizontal") end, { desc = "Horizontal live command run" })
