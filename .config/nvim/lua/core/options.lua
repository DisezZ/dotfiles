local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

g.did_load_filetypes = 0
g.do_filetype_lua = 1

opt.laststatus = 3
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 8

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbering
opt.number = true
opt.numberwidth = 2
opt.ruler = true
opt.signcolumn = "yes"

opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 400

opt.whichwrap:append "<>[]hl"

g.mapleader = " "

--vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

