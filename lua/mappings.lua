
vim.keymap.set( 'i', 'jj', '<Esc>', { desc = 'myjj' } )
vim.keymap.set( 'i', 'JJ', '<Esc>:', { desc = 'myJJ' } )

vim.g.mapleader = ' '
vim.keymap.set( 'n', '<Leader>x', '<C-W>x', { desc = 'myx' } )
vim.keymap.set( 'n', '<Leader>o', '<C-W>o', { desc = 'myo' } )
vim.keymap.set( 'n', '<Leader>c', '<C-W>c', { desc = 'myc' } )
vim.keymap.set( 'n', '<Leader>v', '<C-W>v', { desc = 'myv' } )
vim.keymap.set( 'n', '<Leader>q', '<C-W>q', { desc = 'myq' } )

vim.keymap.set( 'n', '<Leader>w', '<C-W>w', { desc = 'myw' } )

vim.keymap.set( 'n', '<Leader>t', ':tabnew<CR>', { desc = 'mytn' })
vim.keymap.set( 'n', '<Leader>n', ':tabnext<CR>', { desc = 'mytx' })

vim.keymap.set( 't', '<Esc>', '<C-\\><C-N>' , { desc = 'myee' })

vim.keymap.set( 'n', 'grd', function ()
	vim.diagnostic.open_float()
end, { desc = 'Show Diagnostic float message' })
