local M = {}

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require('telescope.config').values
local sorters = require 'telescope.sorters'

local grep_with_filter = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end

      local pieces = vim.split(prompt, '  ')
      local args = { 'rg' }
      if pieces[1] then
        table.insert(args, '-e') -- rg option for pattern
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, '-g') -- rg option to use gitignore syntax to search
        table.insert(args, '**/' .. pieces[2] .. '/**') -- for folder search
      end

      if pieces[3] then
        table.insert(args, '-t') -- rg option for type checking
        table.insert(args, pieces[3])
      end

      table.insert(args, '--color=never')
      table.insert(args, '--no-heading')
      table.insert(args, '--with-filename')
      table.insert(args, '--line-number')
      table.insert(args, '--column')
      table.insert(args, '--smart-case')
      table.insert(args, '--no-messages')

      return args
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 100,
      finder = finder,
      prompt_title = 'Live Grep (Type double space to add filename filter)',
      previewer = conf.grep_previewer(opts),
      sorter = sorters.empty(),
    })
    :find()
end

M.setup = function(opts)
  vim.keymap.set('n', '<leader>sg', function()
    grep_with_filter(opts)
  end, { desc = '[S]Search by [G]grep' })
end

return M
