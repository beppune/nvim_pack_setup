
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

require 'mappings'

require 'lualine'.setup({
    options = {
	theme = 'powerline'
    }
})

