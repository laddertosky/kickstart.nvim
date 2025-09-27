return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]add to harpoon' })
      vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu, { desc = 'toggle harpoon [M]menu' })

      vim.keymap.set('n', '<leader>1', function()
        ui.nav_file(1)
      end, { desc = 'go to harpoon entry 1' })
      vim.keymap.set('n', '<leader>2', function()
        ui.nav_file(2)
      end, { desc = 'go to harpoon entry 2' })
      vim.keymap.set('n', '<leader>3', function()
        ui.nav_file(3)
      end, { desc = 'go to harpoon entry 3' })
      vim.keymap.set('n', '<leader>4', function()
        ui.nav_file(4)
      end, { desc = 'go to harpoon entry 4' })
    end,
  },
}
