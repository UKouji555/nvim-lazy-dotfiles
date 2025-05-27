return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- ファジーファインダーの高速化（オプション）
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    
    telescope.setup({
      defaults = {
        -- プレビューウィンドウの設定
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_width = 0.6,
        },
        -- ファイル無視パターン
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "dist/",
          "build/"
        },
      },
      pickers = {
        find_files = {
          -- 隠しファイルも表示
          hidden = true,
        },
      },
    })
    
    -- fzf拡張の読み込み（インストールした場合）
    telescope.load_extension('fzf')
    
    -- キーマッピング
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
    vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Find current word' })
  end,
}
