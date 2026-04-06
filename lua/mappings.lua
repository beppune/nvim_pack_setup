
vim.keymap.set( 'i', 'jj', '<Esc>', { desc = 'myjj' } )
vim.keymap.set( 'i', 'JJ', '<Esc>:', { desc = 'myJJ' } )

vim.g.mapleader = ' '
vim.keymap.set( 'n', '<Leader>x', '<C-W>x', { desc = 'myx' } )
vim.keymap.set( 'n', '<Leader>o', '<C-W>o', { desc = 'myo' } )
vim.keymap.set( 'n', '<Leader>c', '<C-W>c', { desc = 'myc' } )
vim.keymap.set( 'n', '<Leader>v', '<C-W>v', { desc = 'myv' } )

