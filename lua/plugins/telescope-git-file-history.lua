return {
  "isak102/telescope-git-file-history.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "tpope/vim-fugitive"
  },
  config = function()
    require('telescope').load_extension('git_file_history')
    
    -- キーマップの設定
    vim.keymap.set('n', '<leader>gfh', ':Telescope git_file_history<CR>', 
      { desc = 'Git file history' })
  end,
}
