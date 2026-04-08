
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

vim.o.background = "dark"
vim.cmd.colorscheme "duskfox"

vim.o.cursorline = true
vim.o.signcolumn = 'yes'

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
vim.lsp.config("rust-analyzer", {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            completion = {
                autoimport = {
                    enable = true,
                },
            },
        },
    },
})
vim.lsp.enable('rust_analyzer')

require 'blink.cmp'.setup({
    fuzzy = {
	implementation = 'lua'
    },
    snippets = { preset = 'luasnip' },
    keymap = { preset = 'super-tab' },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    }
})

require('telescope').setup({
    defaults = {
	mappings = {
	    i = {
		['<Esc>'] = require('telescope.actions').close
	    }
	}
    }
})

vim.keymap.set('n', '<leader>ff', function()
    require 'telescope.builtin'.find_files()
end, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>fb', function()
    require 'telescope.builtin'.buffers()
end, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>fh', function()
    require 'telescope.builtin'.help_tags()
end, { desc = 'Telescope help_tags' })


vim.keymap.set('n', '<leader>fc', function()
    require 'telescope.builtin'.commands()
end, { desc = 'Telescope commands' })
-- Treesitter

vim.keymap.set({ "n" }, "]m", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function_call", "textobjects")
end)

vim.keymap.set({ "n" }, "[m", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function_call", "textobjects")
end)
