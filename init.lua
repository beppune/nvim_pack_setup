
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

require 'mappings'

require 'lualine'.setup({
    options = {
	theme = 'powerline'
    }
})

vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = false,
    float = {
	show_header = true,
	source = 'if_many',
	border = 'rounded',
	focusable = false,
    },
    update_in_insert = true, -- default to false
    severity_sort = false, -- default to false
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

require 'blink.cmp'.setup({
    fuzzy = {
	implementation = 'lua'
    },
    snippets = { preset = 'luasnip' },
    keymap = { preset = 'super-tab' }
})

