vim.g.mapLeader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

vim.keymap.set("n", "<C-s>", function()
    vim.cmd("w")
end)
