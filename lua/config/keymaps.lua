-- クリップボードの設定
vim.opt.clipboard:append("unnamedplus")

vim.opt.number = true
local current_listchars = vim.opt.listchars:get()
current_listchars.space = "."
vim.opt.listchars = current_listchars
vim.opt.list = true

-- nvim-tree
vim.keymap.set("n", "e", ":NvimTreeOpen<CR>")
