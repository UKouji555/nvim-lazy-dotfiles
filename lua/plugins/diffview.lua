return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("diffview").setup({})
  end,
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
  },
}
