return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]Code', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]Document', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]Rename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]Search', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]Workspace', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'git [H]Hunk', _ = 'which_key_ignore' },
    }
  end,
}
