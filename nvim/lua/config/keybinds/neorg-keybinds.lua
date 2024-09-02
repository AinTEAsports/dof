vim.keymap.set("n", "<A-n><A-c>", "<Plug>(neorg.looking-glass.magnify-code-block)", { desc = "Neorg magnifying code block" })
vim.keymap.set("n", "<A-n><A-e>", "<Plug>(neorg.core.export)", { desc = "Neorg export" })

vim.keymap.set("n", "<A-n><A-r><A-r>", "<cmd>SnipRun<CR>", { desc = "Neorg code snip run" })
vim.keymap.set("n", "<A-n><A-r><A-e>", function()
	if vim.bo.filetype ~= "norg" then
		return
	end

	vim.cmd [[ set cmdheight=1 ]]

	local prompt = "[WARNING] YOU SHOULD NOT USE THIS WITH BASH/SHELL/ZSH OR ANYTHING ELSE THAT MODIFIES THE SYSTEM STATE\nLive this piece of code ? (Y)es, [N]o: "

	-- io.write(prompt)
	-- local res = vim.fn.getcharstr()
	local res = vim.fn.input(prompt)

	local lower = string.lower(res)

	if lower == "y" or lower == "o" then
		vim.cmd [[ SnipLive ]]
	end

	vim.cmd [[ set cmdheight=0 ]]
end, { desc = "Neorg code snip live run" })
