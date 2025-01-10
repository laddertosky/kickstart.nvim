return {
  {
    'tpope/vim-fugitive',
  },
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
    dependencies = {
      'tpope/vim-fugitive',
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      on_attach = function(_)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Prev hunk' })

        -- Actions
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[S]Stage hunk' })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[R]Reset hunk' })

        map('v', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[U]Undo staged hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = '[S]Stage the whole buffer' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = '[R]Reset the whole buffer' })
        map('n', '<leader>hd', function()
          gitsigns.diffthis '~1'
        end, { desc = 'Show git [D]Difference of this file from last commit' })

        map('n', '<leader>hD', gitsigns.diffthis, { desc = 'Show git [D]Difference of this file from staged' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[P]Preview selected hunk' })
      end,
    },
  },
}
