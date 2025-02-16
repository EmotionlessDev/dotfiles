-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
--vim.cmd [[colorscheme onedark]]
-- vim.o.termguicolors = true
--vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.colorscheme("onedark")


--vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Block cursor
vim.cmd("set guicursor=n-v-c-i:blok")

-- Autoread 
-- vim.cmd [[
--     autocmd FocusGained,BufEnter * silent! !
-- ]]

vim.o.autoread = true

-- Concealer for Neorg
vim.o.conceallevel=2

-- [[ Basic Keymaps ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.listchars = {
  nbsp = ' ',
  precedes = '‹',
  extends = '›',
  trail = '·',
  tab = ' ⎯ ',
  space = '·',
  multispace = '·',
  lead = '·',
  leadmultispace = '·',
}
vim.opt.list = true

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.wrap = false

vim.filetype.add({
  pattern = {
    ['.*.brief'] = 'brief',
  },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.treesitter.stop()
    end,
})

-- Auto Sessions
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.scrolloff = 8
