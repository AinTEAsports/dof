local trigger = "<M-f>"
local upper_trigger = string.upper(trigger)

vim.keymap.set("n", upper_trigger, "<cmd>HopPattern<CR>", { desc = "Hop search" })
vim.keymap.set("n", trigger, "<cmd>HopChar1<CR>", { desc = "Hop search 1 char" })
vim.keymap.set("n", trigger, "<cmd>HopChar1<CR>", { desc = "Hop search 1 char" })


vim.keymap.set("n", "y"..trigger, "y<cmd>HopChar1<CR>", { desc = "Hop yank" })
vim.keymap.set("v", trigger, "<cmd>HopChar1<CR>", { desc = "Hop visual select" })
vim.keymap.set("n", "gc"..trigger, "gc<cmd>HopLine<CR>", { desc = "Hop comment" })
vim.keymap.set("n", "d"..trigger, "d<cmd>HopChar1<CR>", { desc = "Hop delete" })
vim.keymap.set("n", "c"..trigger, "c<cmd>HopChar1<CR>", { desc = "Hop change" })
