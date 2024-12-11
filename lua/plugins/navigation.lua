return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<cmd>Oil<cr>', { silent = true, desc = 'Open parent directory' })
    end,
  },
}
