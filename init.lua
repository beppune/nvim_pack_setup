
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

require 'mappings'

require 'lualine'.setup({
    options = {
	theme = 'powerline'
    }
})

vim.lsp.config('lua_ls', {})
vim.lsp.enable('lua_ls')

