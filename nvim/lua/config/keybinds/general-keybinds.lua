vim.keymap.set("n", "=A", "gg=G<C-o>", { desc = "Reindent the whole file" })
vim.keymap.set("n", "<leader><C-x>", "<cmd>e <cfile><CR>", { desc = "Edit the file under the cursor even if non existent" })
-- vim.keymap.set("n", "?", "@@")
-- vim.keymap.set("n", "<leader><C-h>", function()
-- 	vim.lsp.inlay_hints.enable(not vim.lsp.inlay_hints.is_enabled())
-- end)

vim.keymap.set("n", "<A-c><A-p>", 'i{<CR>}<Esc>O<Esc>"+p==_d3f/I"<Esc>A"<Esc>"A,<Esc>jA,<Esc>k$', { desc = "Add a plugin from a github url copied into clipboard" })

-- vim.keymap.set("n", "<leader>cd", "", {
-- 	function()
-- 		return "\"+y" .. vim.v.count .. "j" .. "gc" .. vim.v.count .. "j"
-- 	end,
-- 	expr = true
-- })

vim.keymap.set("n", "<leader>!", "o<Esc>V<cmd>%!echo %:p<CR>0\"+y$ddk<cmd>lua print(vim.fn.expand(\"%:p\"))<CR>", { desc = "Prints and copies the current file absolute path in the system clipboard"})

-- vim.keymap.set("n", "<Tab>", ">>")
-- vim.keymap.set("n", "<S-Tab>", "<<")
-- vim.keymap.set("v", "<Tab>", ">")
-- vim.keymap.set("v", "<S-Tab>", "<")
--
-- vim.keymap.set("n", "<C-Tab>", "gt")
-- vim.keymap.set("n", "<C-S-Tab>", "gT")


-- vim.keymap.set("n", "<leader><C-p>", function()
-- 	local logfile = "/tmp/vim-profile.log"
--
-- 	vim.cmd(string.format("profile start %s", logfile))
-- 	vim.cmd [[ profile file * ]]
-- 	vim.cmd [[ profile func * ]]
--
-- 	print(string.format("Start profiling in \"%s\"", logfile))
-- end)


-- vim.keymap.set("n", "<C-S-o>", function()
-- 	local curr_name = vim.fn.expand("<cword>")
-- 	print(curr_name)
-- end)

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Back to normal mode in a terminal" })

-- vim.keymap.set("n", "<C-h>", "TmuxNavigateLeft<CR>")
-- vim.keymap.set("n", "<C-l>", "TmuxNavigateRight<CR>")
-- vim.keymap.set("n", "<C-k>", "TmuxNavigateUp<CR>")
-- vim.keymap.set("n", "<C-j>", "TmuxNavigateDown<CR>")

vim.keymap.set("n", "<leader>O", function()
	-- https://search.brave.com/search?q=lua+switch+statement&source=desktop

	local filename = vim.fn.expand("%:p")
	local run_command = ""

	-- if filename:sub(-string.len(".ml")) == ".ml" then
	-- 	-- fterm_command = string.format("utop -init %s", filename)
	-- 	fterm_command = string.format("ocaml -init %s", filename)
	-- elseif filename:sub(-string.len(".py")) == ".py" then
	-- 	fterm_command = string.format("bpython -i %s", filename)
	-- elseif filename:sub(-string.len(".nim")) == ".nim" then
	-- 	fterm_command = string.format("~/.custom-commands/nimshell.sh %s", filename)
	-- elseif filename:sub(-string.len(".lua")) == ".lua" then
	-- 	fterm_command = string.format("lua -i %s", filename)
	-- elseif filename:sub(-string.len(".ex")) == ".ex" then
	-- 	fterm_command = string.format("iex -r %s", filename)
	-- elseif filename:sub(-string.len(".exs")) == ".exs" then
	-- 	fterm_command = string.format("iex -r %s", filename)
	-- else return
	-- end


	if vim.endswith(filename, ".ml") then
		run_command = string.format("utop -init %s", filename)
		-- run_command = string.format("ocaml -init %s", filename)
	elseif vim.endswith(filename, ".py") then
		run_command = string.format("bpython -i %s", filename)
	elseif vim.endswith(filename, ".nim") then
		-- run_command = string.format("~/.custom-commands/nimshell.sh %s", filename)
		run_command = string.format("inim --srcFile=%s", filename)
	elseif vim.endswith(filename, ".lua") then
		run_command = string.format("lua -i %s", filename)
	elseif vim.endswith(filename, ".ex") then
		run_command = string.format("iex -r %s", filename)
	elseif vim.endswith(filename, ".exs") then
		run_command = string.format("iex -r %s", filename)
	else
		return
	end

	-- require("FTerm").scratch({ cmd = fterm_command })
	require("nvterm.terminal").send(run_command, "float")
end, { desc = "REPL run of current file (depending on the language)" })

-- Add a bracket to the end of the line (because of sandwich.nvim, if I have a bracket set on next line on a different indentation level,
-- it considers it as the closing bracket, not letting me put the bracket where I want it)
-- vim.keymap.set("n", "<leader><C-b>", "A]<Esc>i}<Esc>$x==")
-- vim.keymap.set("i", "<C-b>", "<Esc>A]<Esc>i}<Esc>$x==A", { desc = "Adds a closing curly brace to the end of line" })

-- vim.keymap.set("n", "<leader><C-p>", "A]<Esc>i)<Esc>$x==")

-- TODO: MODIFY THIS (check line 53)

-- vim.keymap.set("n", "<leader><C-p>", "a)<Esc>")
-- vim.keymap.set("i", "<C-p>", "<Esc>A]<Esc>i)<Esc>$x==A", { desc = "Adds a closing square bracket to the end of the line"})

-- vim.keymap.set("n", "<leader>L", ":lua ")

vim.keymap.set("n", "<leader>x", function()
	-- TODO: check if file exists, if not do `:w`

	local full_filename = vim.fn.expand("%:p")

	-- vim.cmd("w")
	vim.cmd(string.format("!chmod +x %s", full_filename))
	print(string.format("'%s' is now executable", full_filename))
end, { desc = "'chmod +x's the current file"})

-- vim.keymap.set("n", "<leader>w", ":e ")

-- vim.keymap.set("n", "<A-c><A-c>", "<cmd>e ~/.config/nvim<CR>", { desc = "Take me to my config" })
vim.keymap.set("n", "<A-c><A-c>", "<cmd>Oil ~/.config/nvim<CR>", { desc = "Take me to my config" })
-- vim.keymap.set("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR> :lua print(\"reloaded 'init.lua' successfully\")<CR>")

-- vim.keymap.set("n", "<leader>r", function()
-- 	vim.cmd("so ~/.config/nvim/lua/plugins/lualine_config/bubbles_lualine.lua")
-- 	vim.cmd("so ~/.config/nvim/lua/plugins/oil_config/init.lua")
-- 	-- print("sourced")
-- end)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-k>", "gk")
vim.keymap.set("n", "<C-j>", "gj")

vim.keymap.set("n", "<leader>a", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>z", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader><leader>q", "<cmd>bdelete<CR>")

-- vim.keymap.set("n", "<leader>,", ":vertical split<CR>:lua require'oil'.open_float()<CR>")
-- vim.keymap.set("n", "<leader>;", ":horizontal split<CR>:lua require'oil'.open_float()<CR>")

vim.keymap.set("n", "<leader>,", "<cmd>vertical split<CR><cmd>Oil<CR>")
vim.keymap.set("n", "<leader>;", "<cmd>horizontal split<CR><cmd>Oil<CR>")

-- vim.keymap.set("n", "<leader>,", ":vertical split<CR>:Files<CR>")
-- vim.keymap.set("n", "<leader>;", ":horizontal split<CR>:Files<CR>")

vim.keymap.set("n", "<leader>?", "<cmd>vertical split<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>horizontal split<CR>")

vim.keymap.set("n", "<leader>jp", "<cmd>%!jq<CR>")
vim.keymap.set("n", "<leader>jm", "<cmd>%!jq -c<CR>")

vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>d", '"+D')
vim.keymap.set("v", "<leader>d", '"+D')

vim.keymap.set("n", "H", "J")
vim.keymap.set("n", "K", "<cmd>m .-2<CR>==")
vim.keymap.set("n", "J", "<cmd>m .+1<CR>==")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>horizontal resize +1<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>horizontal resize -1<CR>")

vim.keymap.set("i", "<C-l>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("i", "<C-h>", "<cmd>vertical resize -1<CR>")
vim.keymap.set("i", "<C-k>", "<cmd>horizontal resize +1<CR>")
vim.keymap.set("i", "<C-j>", "<cmd>horizontal resize -1<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>I", "0i")



--- TERMINAL SPLITS ---
-- vim.keymap.set("n", "<leader>A", ":vertical split<bar> :terminal<CR>")
-- vim.keymap.set("n", "<leader>Q", ":horizontal split<bar> :terminal<CR>")

vim.keymap.set("n", "<leader>A", function() require("nvterm.terminal").toggle "vertical" end)
vim.keymap.set("t", "<leader>A", function() require("nvterm.terminal").toggle "vertical" end)

vim.keymap.set("n", "<leader>Q", function() require("nvterm.terminal").toggle "horizontal" end)
vim.keymap.set("t", "<leader>Q", function() require("nvterm.terminal").toggle "horizontal" end)
----------------------


vim.keymap.set("n", "<A-S-j>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<A-S-k>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<A-S-o>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<A-S-b>", "<cmd>wincmd j<CR>")
