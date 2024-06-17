return {
  {
    'vim-test/vim-test',
    dependencies = {
      'preservim/vimux',
    },
    config = function()
      vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = 'Execute the [N]nearest test' })
      vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = 'Execute the tests in current [F]file' })
      vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { desc = 'Execute the tests in current [S]suite' })
      vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = 'Execute the [L]last test' })
      vim.cmd "let test#strategy = 'vimux'"
    end,
  },
}
