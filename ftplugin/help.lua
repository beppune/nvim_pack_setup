vim.keymap.set('n', '<C-Y>', ':tag<CR>' )

-- tag, optiontag, taglink
vim.keymap.set({ "n" }, "]m", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@link", "textobjects")
end, { remap = true })

vim.keymap.set({ "n" }, "[m", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@link", "textobjects")
end, { remap = true })

