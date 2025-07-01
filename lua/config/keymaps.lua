-- clipboard setting
vim.opt.clipboard:append("unnamedplus")

vim.opt.number = true
local current_listchars = vim.opt.listchars:get()
current_listchars.space = "."
vim.opt.listchars = current_listchars
vim.opt.list = true

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")

-- access history setting
--vim.keymap.set("n", "@h", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "]h", "<Cmd>ShowHistory<CR>", { noremap = true, silent = true })
