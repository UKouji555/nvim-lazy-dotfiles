return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim",
  },
  cmd = "Neotree",
  opts = {
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        auto_expand_width = true,
      },
    },
  },
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#00afff" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#ffffff" })
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#00afff" })
  end,
}
