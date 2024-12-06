return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {}
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        cpp = { 'clang-format' },
        c = { 'clang-format' },
        --
        -- Conform can also run multiple formatters sequentially
        python = { 'isort' },
        json = { 'jq' },

        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        graphql = { 'prettier' },
        yaml = { 'prettier' },

        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },
}
