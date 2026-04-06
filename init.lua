
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

require 'mappings'

require 'lualine'.setup({
    options = {
	theme = 'powerline'
    }
})

vim.lsp.config('lua_ls', {
    on_attach = function(_, bufnr)
	vim.keymap.set( 'n', '<Leader>d', function()
	    vim.diagnostic.goto_next()
	end, { buffer = bufnr })

	vim.keymap.set( 'n', '<Leader>s', function()
	    vim.diagnostic.goto_prev()
	end, { buffer = bufnr })
    end
})
vim.lsp.enable('lua_ls')

