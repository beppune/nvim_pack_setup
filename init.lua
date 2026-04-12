
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.number = true

vim.o.background = "dark"
vim.cmd.colorscheme "duskfox"

vim.o.cursorline = true
vim.o.signcolumn = 'yes'

if vim.loop.os_uname().sysname:match('Windows') then
    vim.o.shell = '"C:\\Program Files\\Git\\bin\\bash.exe" -i -l'

end

if vim.version().minor >= 12 then
    require 'vim._core.ui2'.enable({})
end

require 'dev'

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


local blink_config = {
    fuzzy = {
	implementation = 'lua'
    },
    snippets = { preset = 'luasnip' },
    keymap = { preset = 'super-tab' },
    sources = {
	default = { "lsp", "path", "snippets", "buffer" },
    }
}

vim.lsp.config('*', {
    on_attach = function ()
	package.loaded['blink.cmp'] = nil
	require 'blink.cmp'.setup(blink_config)
    end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
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

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local rr = s('rr', {
    t('require \''), i(1), t('\''), i(2)
})

ls.add_snippets( 'lua', { rr } )


