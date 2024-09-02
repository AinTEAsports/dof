local vim = vim

-- require("mason").setup()

local lspconfig = require('lspconfig')

local inlayhints_config = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = true,
}


local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client)
	-- print("ATTACHED")
	-- cmp.on_attach(client)
end


local lsp_list = {
	nim = { "nim_langserver" },
	py = { "ruff", "jedi_language_server" },
	lua = { "lua_ls" },
	ml = { "ocamllsp" },
	mli = { "ocamllsp" },
	gleam = { "gleam" },
	css = { "cssls" },
	sh = { "bashls" },
	c = { "clangd" },
	cpp = { "clangd" },
}


local function setup_lsp(lsp_name)
	lspconfig[lsp_name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- NOTE: Lazy loading LSPs
for extension, lsps in pairs(lsp_list) do
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile" }, {
		pattern = { "*." .. extension },
		callback = function()
			for _, lspname in pairs(lsps) do
				setup_lsp(lspname)
			end
		end
	})
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<C-h>', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<A-d><space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<A-d><space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<A-d><space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<A-d><A-!>', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<A-d>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<A-d>gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<A-d><space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

local signs = { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
