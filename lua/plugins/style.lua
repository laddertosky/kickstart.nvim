return {
     { -- You can easily change to a different colorscheme.
     -- Change the name of the colorscheme plugin below, and then
     -- change the command in the config to whatever the name of that colorscheme is.
     --
     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
     'folke/tokyonight.nvim',
     priority = 1000, -- Make sure to load this before all the other start plugins.
     config = function()
       ---@diagnostic disable-next-line: missing-fields
       require('tokyonight').setup {
         styles = {
           comments = { italic = false }, -- Disable italics in comments
         },
       }
 
       -- Load the colorscheme here.
       -- Like many other themes, this one has different styles, and you could load
       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#ee88ff' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#ee88ff' })
     end,

   },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      }

      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)

      require('ibl').setup { indent = { highlight = highlight } }
    end,
  },
  {
    -- use :ColorizerToggle to toggle display all hex color codes with color
    'norcalli/nvim-colorizer.lua',
  },
}
