-- vim.cmd.colorscheme "eldritch"
-- vim.cmd.colorscheme "cyberdream"
vim.cmd.colorscheme "mestizo"

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.showmode = false
vim.opt.wrap = false

-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

-- vim.opt.listchars = { tab = '⇥ ', space = '·', eol = '¬' }
-- vim.opt.list = true

vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.foldexpr = ""
vim.opt.foldenable = false
vim.opt.guicursor = "n-i:block,r-cr-ci-o:hor25"
vim.opt.conceallevel = 2
vim.opt.cursorline = true

vim.g.transparent_enabled = true

vim.cmd [[
	set mouse=nv  " NOTE: not in insert mode
	set signcolumn=yes
	set splitbelow splitright
]]
vim.opt.cmdheight = 0

vim.g.transparent_enabled = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.cmd [[
	augroup highlight_yank autocmd!
		au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
	augroup END
]]

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('config-highlight-yank', { clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})
