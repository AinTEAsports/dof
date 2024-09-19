-- NOTE: so that the require is after being called
local function oil_toggle_float()
	require("oil").toggle_float()
end

vim.api.nvim_create_user_command('OilFloat', oil_toggle_float, {})

vim.keymap.set("n", "<M-2>", oil_toggle_float, { desc = "Opens float Oil" })
vim.keymap.set("n", "<M-é>", oil_toggle_float, { desc = "Opens float Oil" })
