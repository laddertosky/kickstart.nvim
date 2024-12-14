vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]error messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]quickfix list' })

vim.keymap.set('n', 'z/', function()
  vim.bo.filetype = 'terminal'
  vim.o.wrap = true
end)

-- Navigate vim panes without Ctrl-w
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { silent = true })

vim.keymap.set('n', '<a-s>', '<CMD>horizontal terminal<CR>', { silent = true })
vim.keymap.set('n', '<a-v>', '<CMD>vertical terminal<CR>', { silent = true })

vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h<cr>', { silent = true })
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j<cr>', { silent = true })
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k<cr>', { silent = true })
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l<cr>', { silent = true })
