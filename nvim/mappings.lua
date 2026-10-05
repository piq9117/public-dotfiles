vim.opt.mouse = ''
vim.opt.mousescroll = 'ver:0,hor:0'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.relativenumber = true
vim.opt.nu = true
vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.swapfile = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.opt.colorcolumn = "81"

-- Basic Keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostics float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- ToggleTerm
vim.keymap.set('n', '<leader>ot', '<CMD>ToggleTerm<CR>', { desc = 'Open terminal' })

-- Notes
vim.keymap.set('n', '<leader>on', function()
  vim.cmd('edit ' .. vim.fn.expand('~/code/notes'))
end, { desc = 'Open notes' })

-- Hop
vim.keymap.set('n', '<leader>ho', '<CMD>HopWordMW<CR>', { desc = 'Hop anywhere' })

-- Indent Blankline
vim.keymap.set('n', '<leader>I', '<Cmd>IBLToggle<CR>', { desc = 'Toggle indent lines' })
