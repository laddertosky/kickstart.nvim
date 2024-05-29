-- Function to add and stage the current file
function _G.git_add_current_file()
  local current_file = vim.fn.expand '%'
  print('current_file ' .. current_file)
  vim.fn.system('git add ' .. current_file)
  if vim.v.shell_error == 0 then
    print('File ' .. current_file .. ' is properly added.')
  else
    print('Failed to add file ' .. current_file .. '.')
  end
end

-- Create a custom command to call the function
vim.api.nvim_command 'command! GitAddCurrentFile lua _G.git_add_current_file()'

vim.api.nvim_set_keymap('n', '<leader>ha', '<cmd>GitAddCurrentFile<CR>', { noremap = true, silent = true, desc = 'git [A]add current file' })
