-- plugins/efmls-configs-nvim.lua
return {
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  event = { 'BufReadPre', 'BufNewFile' }, -- efm 起動前に読み込む
  config = function()
    local prettier = require('efmls-configs.formatters.prettier')
    local stylua = require('efmls-configs.formatters.stylua')

    local languages = {
      typescript = { prettier },
      lua = { stylua },
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { '.git/' },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }

    require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
      -- 任意で on_attach や capabilities をここに指定可能
      -- on_attach = on_attach,
      -- capabilities = capabilities,
    }))

    local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = lsp_fmt_group,
      callback = function(ev)
        local efm = vim.lsp.get_clients({ name = 'efm', bufnr = ev.buf })
        if vim.tbl_isempty(efm) then
          return
        end
        vim.lsp.buf.format({ name = 'efm' })
      end,
    })
  end,
}

