return {
  "ryicoh/deepl.vim",
  event = "VeryLazy",
  config = function()
    require("config.dotenv").eval(vim.fs.joinpath(vim.fn.stdpath("config"), ".env"))
    print(vim.env.API_KEY)
    vim.g["deepl#endpoint"] = vim.env.DEEPL_ENDPOINT    vim.g["deepl#auth_key"] = vim.env.DEEPL_API_KEY
    vim.keymap.set("v", "t<C-e>", "<Cmd>call deepl#v('EN')<CR>", { desc = "選択範囲を英訳" })
    vim.keymap.set("v", "t<C-j>", "<Cmd>call deepl#v('JA')<CR>", { desc = "選択範囲を和訳" })
    vim.keymap.set("n", "t<C-e>", "yypV<Cmd>call deepl#v('EN')<CR>", { desc = "行を英訳" })
    vim.keymap.set("n", "t<C-j>", "yypV<Cmd>call deepl#v('JA')<CR>", { desc = "行を和訳" })
    vim.keymap.set("n", "t<C-f>", "yypV<Cmd>call deepl#v('EN', 'FR')<CR>", { desc = "FR→EN 翻訳" })
  end,
}
