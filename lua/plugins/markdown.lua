return {
  'laddertosky/markdown-present.nvim',
  dependencies = {
    'MeanderingProgrammer/render-markdown.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('render-markdown').setup {}
  end,
}
