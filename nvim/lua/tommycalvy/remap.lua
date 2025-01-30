vim.g.mapLeader = " "
vim.g.maplocalleader = " "
-- vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "-", function()
	vim.cmd("w")
	vim.cmd.Ex()
end)

vim.keymap.set("n", "<C-s>", function()
    vim.cmd("w")
end)

