-- DIAGNOSTICS REHIGHLIGHTS
-- vim.cmd [[ hi DiagnosticVirtualTextError guibg=none ]]
-- vim.cmd [[ hi DiagnosticVirtualTextWarn guibg=none ]]
-- vim.cmd [[ hi DiagnosticVirtualTextInfo guibg=none ]]
-- vim.cmd [[ hi DiagnosticVirtualTextHint guibg=none ]]

vim.cmd [[
	hi NotifyInfoBorder guibg=none guifg=#9da5b3
	hi NotifyBackground guibg=none guifg=none
]]

vim.cmd [[ highlight LineNr guibg=none guifg=#6272a4 ]]
vim.cmd [[ highlight EndOfBuffer guibg=none guifg=none ]]
vim.cmd [[ highlight WinSeparator guibg=none guifg=white ]]

vim.cmd [[ highlight NoiceMini guibg=#000000 ]]
vim.cmd [[ highlight FloatTitle guibg=none ]]

vim.cmd [[
	hi clear CursorLine CursorLineNr
	highlight CursorLine term=none gui=none guibg=none
	hi CursorLineNr cterm=bold gui=bold guifg=#f8f8f2 guibg=none
]]

vim.cmd [[ highlight CmpItemKind guibg=none ]]
vim.cmd [[ highlight CmpItemAbbr guibg=none ]]
vim.cmd [[ highlight CmpItemAbbrMatch guibg=none ]]

vim.cmd [[ highlight NoiceMini guibg=#000000 ]]

vim.cmd [[ highlight barbecue_fileicon_Lua guibg=none ]]
vim.cmd [[ highlight barbecue_fileicon_Nim guibg=none ]]
vim.cmd [[ highlight barbecue_normal guibg=none ]]
vim.cmd [[ highlight barbecue_context guibg=none ]]
vim.cmd [[ highlight barbecue_basename guibg=none ]]
vim.cmd [[ highlight barbecue_dirname guibg=none ]]

--- GitSigns ---
vim.cmd [[
	hi GitSignsAdd guibg=none guifg=#3ded97
	hi GitSignsChange guibg=none guifg=yellow
	hi GitSignsDelete guibg=none guifg=red
]]
----------------

vim.cmd [[
	hi NormalFloat guibg=none
	hi FloatBorder guibg=none guifg=none
	hi FzfLuaPreviewBorder guibg=none
]]

vim.cmd [[
	hi NoiceCmdlinePopupBorder guibg=none guifg=#8EEDA1
	hi NoiceCmdlineIcon guibg=none guifg=#8EEDA1
	hi NoiceCmdlinePopupTitle guibg=none guifg=#8EEDA1
]]

vim.cmd [[
	hi Substitute cterm=bold,strikethrough gui=bold,strikethrough guifg=white guibg=orange
]]

vim.cmd [[
	hi def IlluminatedWordText gui=underline
	hi def IlluminatedWordRead gui=underline
	hi def IlluminatedWordWrite gui=underline
]]

-- Eldritch theme
vim.cmd [[
	hi MiniStarterItem guibg=none
	hi NoiceCmdline guibg=none
	hi NoiceCmdlinePopupBorderFilter guibg=none
	hi NoiceCmdlineIconFilter guibg=none
	hi SignColumnSB guibg=none
	hi NormalSB guibg=none
	hi debugPC guibg=none
	hi TroubleNormal guibg=none
	hi NvimTreeWinSeparator guibg=none
	hi NvimTreeNormalNC guibg=none
	hi NeoTreeNormal guibg=none
	hi NeoTreeNormalNC guibg=none
	hi WhichKeyFloat guibg=none
	hi LspFloatWinNormal guibg=none
	hi BufferCurrent guibg=none
	hi BufferCurrentERROR guibg=none
	hi BufferCurrentHINT guibg=none
	hi BufferCurrentINFO guibg=none
	hi BufferCurrentWARN guibg=none
	hi BufferCurrentIndex guibg=none
	hi BufferCurrentMod guibg=none
	hi BufferCurrentSign guibg=none
	hi BufferCurrentTarget guibg=none
	hi CmpDocumentationBorder guibg=none
	hi LspInfoBorder guibg=none
	hi NormalNC guibg=none
	hi FoldColumn guibg=none

	hi StatusLine guibg=none
	hi StatusLineNC guibg=none
]]

