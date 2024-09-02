vim.keymap.set("n", "<leader>T", function()
	for _, bufferId in ipairs(vim.api.nvim_list_bufs()) do
		print(
			string.format("%d => %s || ", bufferId, vim.api.nvim_buf_get_name(bufferId))
		)
	end
end, { desc = "" })
