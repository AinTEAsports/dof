vim.keymap.set("n", "<leader>rr", "<cmd>ExecutorRun<CR>", { desc = "Executor run" })
vim.keymap.set("n", "<leader>re", "<cmd>ExecutorReset<cr><cmd>ExecutorRun<CR>", { desc = "Executor reset and run" })
vim.keymap.set("n", "<leader>rd", "<cmd>ExecutorSwapToPopup<CR><cmd>ExecutorToggleDetail<CR>", { desc = "Executor toggle detail" })
