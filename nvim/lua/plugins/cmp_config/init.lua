local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			-- vim_item.kind = symbol_map[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				look = "[Dict]",
				buffer = "[Buffer]",
				codeium = "[Codeium]",
			})[entry.source.name]

			return vim_item
		end
	},

	name = "lazydev",
	group_index = 0,

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	sources = cmp.config.sources({
			{ name = "path" }, -- for path completion
			{ name = "codeium" },
			{ name = "nvim_lsp" },
			{ name = 'buffer' },
			-- { name = "vsnip" }, -- For vsnip users.
		}
	)
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources(
		{
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		},
		{
			{ name = 'buffer' },
		}
	)
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion", },
		{ name = "buffer" }
	}
})


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
		{ name = "codeium" }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})



local symbol_map = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "󱨚",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
	Codeium = "󰚩"
}

lspkind.presets.default = symbol_map
-- lspkind.init({
-- 	with_text = true,
-- 	preset = 'codicons',
-- 	symbol_map = symbol_map
-- })


-- setup() is also available as an alias
lspkind.init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = symbol_map,
})
