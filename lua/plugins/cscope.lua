return {
  {
    {
      "ludovicchabant/vim-gutentags",
      init = function()
        vim.g.gutentags_modules = { "cscope_maps" } -- This is required. Other config is optional
        vim.g.gutentags_cscope_build_inverted_index_maps = 1
        vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/.gutentags")
        vim.g.gutentags_file_list_command = "fd -e c -e h"
        -- vim.g.gutentags_trace = 1
      end,
    }
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    },
    opts = {
      -- USE EMPTY FOR DEFAULT OPTIONS
      -- DEFAULTS ARE LISTED BELOW
      skip_input_prompt = true,
      cscope = {
        picker = 'telescope'
      }
    },
  },
}
