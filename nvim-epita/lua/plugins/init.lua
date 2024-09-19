-- require("plugins.fterm_config")
-- require("plugins.intro_config")
-- require("plugins.lspkind_config")
-- require("plugins.mini-starter_config")
-- require("plugins.neoscroll_config")
-- require("plugins.telescope_config")
-- require("plugins.treesj_config")

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	pattern = { "*" },
	callback = function()
		require("plugins.cmp_config")
	end
})

-- require("plugins.lsp_config")


-- require("plugins.lualine_config")
-- require("plugins.mason_config")

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile", "BufRead", "UIEnter", "WinEnter", "TabEnter", "VimEnter" }, {
-- 	pattern = { "*.norg" },
-- 	callback = function()
-- 		require("plugins.neorg_config")
-- 	end
-- })

-- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
-- 	pattern = { "oil://*" },
-- 	callback = function()
--         require("plugins.oil_config")
--     end
-- })

-- require("plugins.treesitter_config")
